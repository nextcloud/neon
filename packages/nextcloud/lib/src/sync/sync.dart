library syncer;

import 'dart:io';

import 'package:nextcloud/nextcloud.dart';
import 'package:path/path.dart' as p;

part 'action.dart';
part 'conflict.dart';
part 'object.dart';
part 'sources.dart';
part 'sources/webdav_io_sources.dart';
part 'status.dart';
part 'status_entry.dart';

/// Sync between two [SyncSources]s.
///
/// This implementation follows https://unterwaditzer.net/2016/sync-algorithm.html in a generic and abstract way
/// and should work for any two kinds of sources and objects.
Future<List<SyncConflict<T1, T2>>> sync<T1, T2>(
  final SyncSources<T1, T2> sources,
  final SyncStatus syncStatus,
  final Map<String, SyncConflictSolution> conflictSolutions,
) async =>
    executeSyncDiff<T1, T2>(
      sources,
      syncStatus,
      await computeSyncDiff<T1, T2>(
        sources,
        syncStatus,
        conflictSolutions,
      ),
    );

/// Differences between the two sources
class SyncDiff<T1, T2> {
  // ignore: public_member_api_docs
  SyncDiff(
    this.actions,
    this.conflicts,
  );

  /// Actions required to solve the difference
  final List<SyncAction<T1, T2>> actions;

  /// Conflicts without solutions that need to be solved
  final List<SyncConflict<T1, T2>> conflicts;
}

/// Executes the actions required to solve the difference
Future<List<SyncConflict<T1, T2>>> executeSyncDiff<T1, T2>(
  final SyncSources<T1, T2> sources,
  final SyncStatus syncStatus,
  final SyncDiff<T1, T2> sync,
) async {
  for (final action in sync.actions) {
    if (action is SyncActionDeleteFromA<T1, T2>) {
      await sources.deleteObjectA(action.object);
      syncStatus.removeEntry(action.object.id);
    } else if (action is SyncActionDeleteFromB<T1, T2>) {
      await sources.deleteObjectB(action.object);
      syncStatus.removeEntry(action.object.id);
    } else if (action is SyncActionWriteToA<T1, T2>) {
      final objectA = await sources.writeObjectB(action.object);
      syncStatus.updateEntry(
        SyncStatusEntry(
          action.object.id,
          await sources.getObjectETagA(objectA),
          await sources.getObjectETagB(action.object),
        ),
      );
    } else if (action is SyncActionWriteToB<T1, T2>) {
      final objectB = await sources.writeObjectA(action.object);
      syncStatus.updateEntry(
        SyncStatusEntry(
          action.object.id,
          await sources.getObjectETagA(action.object),
          await sources.getObjectETagB(objectB),
        ),
      );
    }
  }

  return sync.conflicts;
}

/// Computes the difference, useful for displaying if a sync is up to date.
Future<SyncDiff<T1, T2>> computeSyncDiff<T1, T2>(
  final SyncSources<T1, T2> sources,
  final SyncStatus syncStatus,
  final Map<String, SyncConflictSolution> conflictSolutions,
) async {
  final actions = <SyncAction<T1, T2>>[];
  var conflicts = <SyncConflict<T1, T2>>[];
  var objectsA = await sources.listObjectsA();
  var objectsB = await sources.listObjectsB();

  for (final objectA in objectsA) {
    final objectB = objectsB.find(objectA.id);
    final statusEntry = syncStatus.entries.find(objectA.id);

    // If the ID exists on side A and the status, but not on B, it has been deleted on B. Delete it from A and the status.
    if (statusEntry != null && objectB == null) {
      actions.add(SyncActionDeleteFromA(objectA));
      continue;
    }

    // If the ID exists on side A and side B, but not in status, we can not just create it in status, since the two items might contain different content each.
    if (objectB != null && statusEntry == null) {
      conflicts.add(
        SyncConflict(
          id: objectA.id,
          type: SyncConflictType.bothNew,
          objectA: objectA,
          objectB: objectB,
        ),
      );
      continue;
    }

    // If the ID exists on side A, but not on B or the status, it must have been created on A. Copy the item from A to B and also insert it into status.
    if (objectB == null || statusEntry == null) {
      actions.add(SyncActionWriteToB(objectA));
      continue;
    }
  }

  for (final objectB in objectsB) {
    final objectA = objectsA.find(objectB.id);
    final statusEntry = syncStatus.entries.find(objectB.id);

    // If the ID exists on side B and the status, but not on A, it has been deleted on A. Delete it from B and the status.
    if (statusEntry != null && objectA == null) {
      actions.add(SyncActionDeleteFromB(objectB));
      continue;
    }

    // If the ID exists on side B and side A, but not in status, we can not just create it in status, since the two items might contain different content each.
    if (objectA != null && statusEntry == null) {
      conflicts.add(
        SyncConflict(
          id: objectA.id,
          type: SyncConflictType.bothNew,
          objectA: objectA,
          objectB: objectB,
        ),
      );
      continue;
    }

    // If the ID exists on side B, but not on A or the status, it must have been created on B. Copy the item from B to A and also insert it into status.
    if (objectA == null || statusEntry == null) {
      actions.add(SyncActionWriteToA(objectB));
      continue;
    }
  }

  objectsA = await sources.listObjectsA();
  objectsB = await sources.listObjectsB();
  final entries = syncStatus.entries.toList();
  for (final entry in entries) {
    final objectA = objectsA.find(entry.id);
    final objectB = objectsB.find(entry.id);

    // Remove all entries from status that don't exist anymore
    if (objectA == null && objectB == null) {
      syncStatus.removeEntry(entry.id);
      continue;
    }

    if (objectA != null && objectB != null) {
      final changedA = entry.etagA != await sources.getObjectETagA(objectA);
      final changedB = entry.etagB != await sources.getObjectETagB(objectB);

      if (changedA && changedB) {
        conflicts.add(
          SyncConflict(
            id: objectA.id,
            type: SyncConflictType.bothChanged,
            objectA: objectA,
            objectB: objectB,
          ),
        );
        continue;
      }

      if (changedA && !changedB) {
        actions.add(SyncActionWriteToB(objectA));
        continue;
      }

      if (changedB && !changedA) {
        actions.add(SyncActionWriteToA(objectB));
        continue;
      }
    }
  }

  // Set of conflicts by id
  conflicts = conflicts
      .map((final conflict) => conflict.id)
      .toSet()
      .map((final id) => conflicts.firstWhere((final conflict) => conflict.id == id))
      .toList();

  final unsolvedConflicts = <SyncConflict<T1, T2>>[];
  for (final conflict in conflicts) {
    final solution = conflictSolutions[conflict.id] ?? sources.findSolution(conflict);
    if (solution != null) {
      switch (solution) {
        case SyncConflictSolution.overwriteA:
          actions.add(SyncActionWriteToA(conflict.objectB));
          break;
        case SyncConflictSolution.overwriteB:
          actions.add(SyncActionWriteToB(conflict.objectA));
          break;
        case SyncConflictSolution.skip:
          break;
      }
    } else {
      unsolvedConflicts.add(conflict);
    }
  }

  return SyncDiff(
    sources.sortActions(actions),
    unsolvedConflicts,
  );
}

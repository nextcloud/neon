import 'package:synchronize/src/action.dart';
import 'package:synchronize/src/conflict.dart';
import 'package:synchronize/src/journal.dart';
import 'package:synchronize/src/journal_entry.dart';
import 'package:synchronize/src/object.dart';
import 'package:synchronize/src/sources.dart';

/// Sync between two [SyncSources]s.
///
/// This implementation follows https://unterwaditzer.net/2016/sync-algorithm.html in a generic and abstract way
/// and should work for any two kinds of sources and objects.
Future<List<SyncConflict<T1, T2>>> sync<T1, T2>(
  SyncSources<T1, T2> sources,
  SyncJournal journal, {
  Map<String, SyncConflictSolution>? conflictSolutions,
  bool keepSkipsAsConflicts = false,
}) async {
  final diff = await computeSyncDiff<T1, T2>(
    sources,
    journal,
    conflictSolutions: conflictSolutions,
    keepSkipsAsConflicts: keepSkipsAsConflicts,
  );
  await executeSyncDiff<T1, T2>(
    sources,
    journal,
    diff,
  );
  return diff.conflicts;
}

/// Differences between the two sources.
class SyncDiff<T1, T2> {
  /// Creates a new diff.
  SyncDiff(
    this.actions,
    this.conflicts,
  );

  /// Actions required to solve the difference.
  final List<SyncAction<dynamic>> actions;

  /// Conflicts without solutions that need to be solved.
  final List<SyncConflict<T1, T2>> conflicts;
}

/// Executes the actions required to solve the difference.
Future<void> executeSyncDiff<T1, T2>(
  SyncSources<T1, T2> sources,
  SyncJournal journal,
  SyncDiff<T1, T2> diff,
) async {
  for (final action in diff.actions) {
    switch (action) {
      case SyncActionDeleteFromA():
        await sources.sourceA.deleteObject(action.object as SyncObject<T1>);
        journal.entries.removeWhere((entry) => entry.id == action.object.id);
      case SyncActionDeleteFromB():
        await sources.sourceB.deleteObject(action.object as SyncObject<T2>);
        journal.entries.removeWhere((entry) => entry.id == action.object.id);
      case SyncActionWriteToA():
        final objectA = await sources.sourceA.writeObject(action.object as SyncObject<T2>);
        journal.updateEntry(
          SyncJournalEntry(
            action.object.id,
            await sources.sourceA.getObjectETag(objectA),
            await sources.sourceB.getObjectETag(action.object as SyncObject<T2>),
          ),
        );
      case SyncActionWriteToB():
        final objectB = await sources.sourceB.writeObject(action.object as SyncObject<T1>);
        journal.updateEntry(
          SyncJournalEntry(
            action.object.id,
            await sources.sourceA.getObjectETag(action.object as SyncObject<T1>),
            await sources.sourceB.getObjectETag(objectB),
          ),
        );
    }
  }
}

/// Computes the difference, useful for displaying if a sync is up to date.
Future<SyncDiff<T1, T2>> computeSyncDiff<T1, T2>(
  SyncSources<T1, T2> sources,
  SyncJournal journal, {
  Map<String, SyncConflictSolution>? conflictSolutions,
  bool keepSkipsAsConflicts = false,
}) async {
  final actions = <SyncAction<dynamic>>[];
  final conflicts = <SyncConflict<T1, T2>>{};
  var objectsA = await sources.sourceA.listObjects();
  var objectsB = await sources.sourceB.listObjects();

  for (final objectA in objectsA) {
    final objectB = objectsB.tryFind(objectA.id);
    final journalEntry = journal.entries.tryFind(objectA.id);

    // If the ID exists on side A and the journal, but not on B, it has been deleted on B. Delete it from A and the journal.
    if (journalEntry != null && objectB == null) {
      actions.add(SyncActionDeleteFromA<T1, T2>(objectA));
      continue;
    }

    // If the ID exists on side A and side B, but not in journal, we can not just create it in journal, since the two items might contain different content each.
    if (objectB != null && journalEntry == null) {
      conflicts.add(
        SyncConflict<T1, T2>(
          id: objectA.id,
          type: SyncConflictType.bothNew,
          objectA: objectA,
          objectB: objectB,
        ),
      );
      continue;
    }

    // If the ID exists on side A, but not on B or the journal, it must have been created on A. Copy the item from A to B and also insert it into journal.
    if (objectB == null || journalEntry == null) {
      actions.add(SyncActionWriteToB<T1, T2>(objectA));
      continue;
    }
  }

  for (final objectB in objectsB) {
    final objectA = objectsA.tryFind(objectB.id);
    final journalEntry = journal.entries.tryFind(objectB.id);

    // If the ID exists on side B and the journal, but not on A, it has been deleted on A. Delete it from B and the journal.
    if (journalEntry != null && objectA == null) {
      actions.add(SyncActionDeleteFromB<T1, T2>(objectB));
      continue;
    }

    // If the ID exists on side B and side A, but not in journal, we can not just create it in journal, since the two items might contain different content each.
    if (objectA != null && journalEntry == null) {
      conflicts.add(
        SyncConflict<T1, T2>(
          id: objectA.id,
          type: SyncConflictType.bothNew,
          objectA: objectA,
          objectB: objectB,
        ),
      );
      continue;
    }

    // If the ID exists on side B, but not on A or the journal, it must have been created on B. Copy the item from B to A and also insert it into journal.
    if (objectA == null || journalEntry == null) {
      actions.add(SyncActionWriteToA<T1, T2>(objectB));
      continue;
    }
  }

  objectsA = await sources.sourceA.listObjects();
  objectsB = await sources.sourceB.listObjects();
  final entries = journal.entries.toList();
  for (final entry in entries) {
    final objectA = objectsA.tryFind(entry.id);
    final objectB = objectsB.tryFind(entry.id);

    // Remove all entries from journal that don't exist anymore
    if (objectA == null && objectB == null) {
      journal.entries.removeWhere((e) => e.id == entry.id);
      continue;
    }

    if (objectA != null && objectB != null) {
      final changedA = entry.etagA != await sources.sourceA.getObjectETag(objectA);
      final changedB = entry.etagB != await sources.sourceB.getObjectETag(objectB);

      if (changedA && changedB) {
        conflicts.add(
          SyncConflict<T1, T2>(
            id: objectA.id,
            type: SyncConflictType.bothChanged,
            objectA: objectA,
            objectB: objectB,
          ),
        );
        continue;
      }

      if (changedA && !changedB) {
        actions.add(SyncActionWriteToB<T1, T2>(objectA));
        continue;
      }

      if (changedB && !changedA) {
        actions.add(SyncActionWriteToA<T1, T2>(objectB));
        continue;
      }
    }
  }

  final unsolvedConflicts = <SyncConflict<T1, T2>>[];
  for (final conflict in conflicts) {
    final solution = conflictSolutions?[conflict.id] ?? sources.findSolution(conflict.objectA, conflict.objectB);
    switch (solution) {
      case SyncConflictSolution.overwriteA:
        actions.add(SyncActionWriteToA<T1, T2>(conflict.objectB));
      case SyncConflictSolution.overwriteB:
        actions.add(SyncActionWriteToB<T1, T2>(conflict.objectA));
      case SyncConflictSolution.skip:
        if (keepSkipsAsConflicts) {
          unsolvedConflicts.add(
            SyncConflict<T1, T2>(
              id: conflict.id,
              type: conflict.type,
              objectA: conflict.objectA,
              objectB: conflict.objectB,
              skipped: true,
            ),
          );
        }
      case null:
        unsolvedConflicts.add(conflict);
    }
  }

  return SyncDiff<T1, T2>(
    _sortActions(actions),
    unsolvedConflicts,
  );
}

List<SyncAction<dynamic>> _sortActions(List<SyncAction<dynamic>> actions) {
  final addActions = <SyncAction<dynamic>>[];
  final removeActions = <SyncAction<dynamic>>[];
  for (final action in actions) {
    switch (action) {
      case SyncActionWriteToA():
        addActions.add(action);
      case SyncActionWriteToB():
        addActions.add(action);
      case SyncActionDeleteFromA():
        removeActions.add(action);
      case SyncActionDeleteFromB():
        removeActions.add(action);
    }
  }
  return _innerSortActions(addActions)..addAll(_innerSortActions(removeActions).reversed);
}

List<SyncAction<dynamic>> _innerSortActions(List<SyncAction<dynamic>> actions) =>
    actions..sort((a, b) => a.object.id.compareTo(b.object.id));

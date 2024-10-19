import 'package:meta/meta.dart';
import 'package:synchronize/src/object.dart';

/// Contains information about a conflict that appeared during sync.
@immutable
class SyncConflict<T1, T2> {
  /// Creates a new conflict.
  const SyncConflict({
    required this.id,
    required this.type,
    required this.objectA,
    required this.objectB,
    this.skipped = false,
  });

  /// Id of the objects involved in the conflict.
  final String id;

  /// Type of the conflict that appeared. See [SyncConflictType] for more info.
  final SyncConflictType type;

  /// Object A involved in the conflict.
  final SyncObject<T1> objectA;

  /// Object B involved in the conflict.
  final SyncObject<T2> objectB;

  /// Whether the conflict was skipped by the user, useful for ignoring it later on.
  final bool skipped;

  @override
  bool operator ==(Object other) => other is SyncConflict && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'SyncConflict<$T1, $T2>(id: $id, type: $type, objectA: $objectA, objectB: $objectB, skipped: $skipped)';
}

/// Types of conflicts that can appear during sync.
enum SyncConflictType {
  /// New objects with the same id exist on both sides.
  bothNew,

  /// Both objects with the same id have changed.
  bothChanged,
}

/// Ways to resolve [SyncConflict]s.
enum SyncConflictSolution {
  /// Overwrite the content of object A with the content of object B.
  overwriteA,

  /// Overwrite the content of object B with the content of object A.
  overwriteB,

  /// Skip the conflict and just do nothing.
  skip,
}

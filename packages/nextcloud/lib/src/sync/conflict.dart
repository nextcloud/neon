part of 'sync.dart';

/// Contains information about a conflict that appeared during sync.
class SyncConflict<T1, T2> {
  // ignore: public_member_api_docs
  SyncConflict({
    required this.id,
    required this.type,
    required this.objectA,
    required this.objectB,
  });

  /// Id of the objects involved in the conflict.
  final String id;

  /// Type of the conflict that appeared. See [SyncConflictType] for more info.
  final SyncConflictType type;

  /// Object A involved in the conflict.
  final SyncObject<T1> objectA;

  /// Object B involved in the conflict.
  final SyncObject<T2> objectB;
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

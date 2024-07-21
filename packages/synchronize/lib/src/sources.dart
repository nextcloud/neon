import 'dart:async';

import 'package:meta/meta.dart';
import 'package:synchronize/src/conflict.dart';
import 'package:synchronize/src/object.dart';

/// The source the sync uses to sync from and to.
@immutable
abstract interface class SyncSource<T1, T2> {
  /// List all the objects.
  FutureOr<List<SyncObject<T1>>> listObjects();

  /// Calculates the ETag of a given [object].
  ///
  /// Must be something easy to compute like the mtime of a file and preferably not the hash of the whole content in order to be fast.
  FutureOr<String> getObjectETag(SyncObject<T1> object);

  /// Writes the given [object].
  FutureOr<SyncObject<T1>> writeObject(SyncObject<T2> object);

  /// Deletes the given [object].
  FutureOr<void> deleteObject(SyncObject<T1> object);
}

/// The sources the sync uses to sync from and to.
@immutable
abstract interface class SyncSources<T1, T2> {
  /// Source A.
  SyncSource<T1, T2> get sourceA;

  /// Source B.
  SyncSource<T2, T1> get sourceB;

  /// Automatically find a solution for conflicts that don't matter. Useful e.g. for ignoring new directories.
  SyncConflictSolution? findSolution(SyncObject<T1> objectA, SyncObject<T2> objectB);

  @override
  String toString() => 'SyncSources<$T1, $T2>(sourceA: $sourceA, sourceB: $sourceB)';
}

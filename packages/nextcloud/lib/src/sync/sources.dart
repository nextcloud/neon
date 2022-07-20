part of 'sync.dart';

/// The sources the sync uses to sync from and to.
abstract class SyncSources<T1, T2> {
  /// List all the objects of type [T1] of the source.
  Future<List<SyncObject<T1>>> listObjectsA();

  /// List all the objects of type [T2] of the source.
  Future<List<SyncObject<T2>>> listObjectsB();

  /// Calculates the ETag of a given [object] of type [T1].
  ///
  /// Should be something easy to compute like the mtime of a file and preferably not the hash of the whole content in order to be fast
  Future<String> getObjectETagA(final SyncObject<T1> object);

  /// Calculates the ETag of a given [object] of type [T2].
  ///
  /// Should be something easy to compute like the mtime of a file and preferably not the hash of the whole content in order to be fast
  Future<String> getObjectETagB(final SyncObject<T2> object);

  /// Writes the given [object] of type [T1] to the source.
  Future<SyncObject<T2>> writeObjectA(final SyncObject<T1> object);

  /// Writes the given [object] of type [T2] to the source.
  Future<SyncObject<T1>> writeObjectB(final SyncObject<T2> object);

  /// Deletes the given [object] of type [T1] from the source.
  Future deleteObjectA(final SyncObject<T1> object);

  /// Deletes the given [object] of type [T2] from the source.
  Future deleteObjectB(final SyncObject<T2> object);

  /// Sorts the actions before executing them. Useful e.g. for creating directories before creating files and deleting files before deleting directories.
  List<SyncAction<T1, T2>> sortActions(final List<SyncAction<T1, T2>> actions);

  /// Automatically find a solution for conflicts that don't matter. Useful e.g. for ignoring new directories.
  SyncConflictSolution? findSolution(final SyncConflict<T1, T2> conflict);
}

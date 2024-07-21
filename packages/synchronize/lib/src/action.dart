import 'package:meta/meta.dart';
import 'package:synchronize/src/object.dart';

/// Action to be executed in the sync process.
@internal
@immutable
sealed class SyncAction<T> {
  /// Creates a new action.
  const SyncAction(this.object);

  /// The object that is part of the action.
  final SyncObject<T> object;

  @override
  String toString() => 'SyncAction<$T>(object: $object)';
}

/// Action to delete on object from A.
@internal
@immutable
interface class SyncActionDeleteFromA<T1, T2> extends SyncAction<T1> {
  /// Creates a new action to delete an object from A.
  const SyncActionDeleteFromA(super.object);

  @override
  String toString() => 'SyncActionDeleteFromA<$T1, $T2>(object: $object)';
}

/// Action to delete an object from B.
@internal
@immutable
interface class SyncActionDeleteFromB<T1, T2> extends SyncAction<T2> {
  /// Creates a new action to delete an object from B.
  const SyncActionDeleteFromB(super.object);

  @override
  String toString() => 'SyncActionDeleteFromB<$T1, $T2>(object: $object)';
}

/// Action to write an object to A.
@internal
@immutable
interface class SyncActionWriteToA<T1, T2> extends SyncAction<T2> {
  /// Creates a new action to write an object to A.
  const SyncActionWriteToA(super.object);

  @override
  String toString() => 'SyncActionWriteToA<$T1, $T2>(object: $object)';
}

/// Action to write an object to B.
@internal
@immutable
interface class SyncActionWriteToB<T1, T2> extends SyncAction<T1> {
  /// Creates a new action to write an object to B.
  const SyncActionWriteToB(super.object);

  @override
  String toString() => 'SyncActionWriteToB<$T1, $T2>(object: $object)';
}

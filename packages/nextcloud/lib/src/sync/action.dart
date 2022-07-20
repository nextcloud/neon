part of 'sync.dart';

/// Action to be executed in the sync process
abstract class SyncAction<T1, T2> {}

/// Action to delete object from A
class SyncActionDeleteFromA<T1, T2> extends SyncAction<T1, T2> {
  // ignore: public_member_api_docs
  SyncActionDeleteFromA(this.object);

  // ignore: public_member_api_docs
  final SyncObject<T1> object;
}

/// Action to delete object from B
class SyncActionDeleteFromB<T1, T2> extends SyncAction<T1, T2> {
  // ignore: public_member_api_docs
  SyncActionDeleteFromB(this.object);

  // ignore: public_member_api_docs
  final SyncObject<T2> object;
}

/// Action to write object to A
class SyncActionWriteToA<T1, T2> extends SyncAction<T1, T2> {
  // ignore: public_member_api_docs
  SyncActionWriteToA(this.object);

  // ignore: public_member_api_docs
  final SyncObject<T2> object;
}

/// Action to write object to B
class SyncActionWriteToB<T1, T2> extends SyncAction<T1, T2> {
  // ignore: public_member_api_docs
  SyncActionWriteToB(this.object);

  // ignore: public_member_api_docs
  final SyncObject<T1> object;
}

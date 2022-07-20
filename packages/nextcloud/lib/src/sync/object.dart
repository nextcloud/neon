part of 'sync.dart';

/// Wraps the actual data contained on each side.
class SyncObject<T> {
  // ignore: public_member_api_docs
  SyncObject(
    this.id,
    this.data,
  );

  /// Id of the object.
  final String id;

  /// Actual data of the object, can be anything.
  final T data;
}

// ignore: public_member_api_docs
extension SyncObjectsFind<T> on List<SyncObject<T>> {
  // ignore: public_member_api_docs
  SyncObject<T>? find(final String id) {
    for (final object in this) {
      if (object.id == id) {
        return object;
      }
    }

    return null;
  }
}

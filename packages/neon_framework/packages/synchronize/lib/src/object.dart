import 'package:collection/collection.dart';

/// Wraps the actual data contained on each side.
typedef SyncObject<T> = ({String id, T data});

/// Extension to find a [SyncObject].
extension SyncObjectsFind<T> on Iterable<SyncObject<T>> {
  /// Finds the first [SyncObject] that has the `id` set to [id].
  ///
  /// Returns `null` if no matching [SyncObject] was found.
  SyncObject<T>? tryFind(String id) => firstWhereOrNull((object) => object.id == id);
}

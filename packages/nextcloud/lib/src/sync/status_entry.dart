part of 'sync.dart';

/// Stores a single entry in the [SyncStatus].
///
/// It contains an [id] and ETags for each object, [etagA] and [etagB] respectively.
class SyncStatusEntry {
  // ignore: public_member_api_docs
  SyncStatusEntry(
    this.id,
    this.etagA,
    this.etagB,
  );

  // ignore: public_member_api_docs
  final String id;

  /// ETag of the object A.
  final String etagA;

  /// ETag of the object B.
  final String etagB;

  @override
  String toString() => 'SyncStatusEntry(id: $id, etagA: $etagA, etagB: $etagB)';
}

// ignore: public_member_api_docs
extension SyncStatusEntriesFind on List<SyncStatusEntry> {
  // ignore: public_member_api_docs
  SyncStatusEntry? find(final String id) {
    for (final entry in this) {
      if (entry.id == id) {
        return entry;
      }
    }

    return null;
  }
}

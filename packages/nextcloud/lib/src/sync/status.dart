part of 'sync.dart';

/// Contains the local state of the whole synced.
///
/// Used for detecting changes and new or deleted files.
class SyncStatus {
  // ignore: public_member_api_docs
  SyncStatus(this._entries);

  final List<SyncStatusEntry> _entries;

  /// All entries contained in the status.
  List<SyncStatusEntry> get entries => _entries;

  /// Update an [entry].
  void updateEntry(final SyncStatusEntry entry) {
    for (var i = 0; i < _entries.length; i++) {
      if (_entries[i].id == entry.id) {
        _entries[i] = entry;
        return;
      }
    }
    _entries.add(entry);
  }

  /// Remove an entry by it's [id].
  void removeEntry(final String id) =>
      _entries.replaceRange(0, _entries.length, _entries.where((final entry) => entry.id != id));
}

// ignore: public_member_api_docs
SyncStatus syncStatusFromJson(final List data) => SyncStatus(
      data.map(
        (final a) {
          final b = a as Map<String, dynamic>;
          return SyncStatusEntry(
            b['id'] as String,
            b['etagA'] as String,
            b['etagB'] as String,
          );
        },
      ).toList(),
    );

// ignore: public_member_api_docs
List syncStatusToJson(final SyncStatus status) => status.entries
    .map(
      (final e) => {
        'id': e.id,
        'etagA': e.etagA,
        'etagB': e.etagB,
      },
    )
    .toList();

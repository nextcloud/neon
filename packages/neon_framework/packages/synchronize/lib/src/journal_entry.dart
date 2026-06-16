import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:synchronize/src/journal.dart';

part 'journal_entry.g.dart';

/// Stores a single entry in the [SyncJournal].
///
/// It contains an [id] and ETags for each object, [etagA] and [etagB] respectively.
@immutable
@JsonSerializable()
class SyncJournalEntry {
  /// Creates a new journal entry.
  const SyncJournalEntry(
    this.id,
    this.etagA,
    this.etagB,
  );

  /// Deserializes a journal entry from [json].
  factory SyncJournalEntry.fromJson(Map<String, dynamic> json) => _$SyncJournalEntryFromJson(json);

  /// Serializes a journal entry to JSON.
  Map<String, dynamic> toJson() => _$SyncJournalEntryToJson(this);

  /// Unique ID of the journal entry.
  final String id;

  /// ETag of the object A.
  final String etagA;

  /// ETag of the object B.
  final String etagB;

  @override
  bool operator ==(Object other) => other is SyncJournalEntry && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'SyncJournalEntry(id: $id, etagA: $etagA, etagB: $etagB)';
}

/// Extension to find a [SyncJournalEntry].
extension SyncJournalEntriesFind on Iterable<SyncJournalEntry> {
  /// Finds the first [SyncJournalEntry] that has the [SyncJournalEntry.id] set to [id].
  ///
  /// Returns `null` if no matching [SyncJournalEntry] was found.
  SyncJournalEntry? tryFind(String id) => firstWhereOrNull((entry) => entry.id == id);
}

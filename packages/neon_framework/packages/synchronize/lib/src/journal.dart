import 'package:json_annotation/json_annotation.dart';
import 'package:synchronize/src/journal_entry.dart';

part 'journal.g.dart';

/// Contains the journal.
///
/// Used for detecting changes and new or deleted files.
@JsonSerializable()
class SyncJournal {
  /// Creates a new journal.
  // Note: This must not be const as otherwise the entries are not modifiable when a const set is used!
  SyncJournal([Set<SyncJournalEntry>? entries]) : entries = entries ?? {};

  /// Deserializes a journal from [json].
  factory SyncJournal.fromJson(Map<String, dynamic> json) => _$SyncJournalFromJson(json);

  /// Serializes a journal to JSON.
  Map<String, dynamic> toJson() => _$SyncJournalToJson(this);

  /// All entries contained in the journal.
  final Set<SyncJournalEntry> entries;

  /// Updates an [entry].
  void updateEntry(SyncJournalEntry entry) {
    entries
      ..remove(entry)
      ..add(entry);
  }

  @override
  String toString() => 'SyncJournal(entries: $entries)';
}

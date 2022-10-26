// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncJournal _$SyncJournalFromJson(Map<String, dynamic> json) => SyncJournal(
      (json['entries'] as List<dynamic>).map((e) => SyncJournalEntry.fromJson(e as Map<String, dynamic>)).toSet(),
    );

Map<String, dynamic> _$SyncJournalToJson(SyncJournal instance) => <String, dynamic>{
      'entries': instance.entries.toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilesSyncMapping _$FilesSyncMappingFromJson(Map<String, dynamic> json) => FilesSyncMapping(
      accountId: json['accountId'] as String,
      appId: json['appId'] as String,
      journal: SyncJournal.fromJson(json['journal'] as Map<String, dynamic>),
      remotePath: PathUri.parse(json['remotePath'] as String),
      localPath: FilesSyncMapping._directoryFromJson(json['localPath'] as String),
    );

Map<String, dynamic> _$FilesSyncMappingToJson(FilesSyncMapping instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'appId': instance.appId,
      'journal': instance.journal,
      'remotePath': FilesSyncMapping._pathUriToJson(instance.remotePath),
      'localPath': FilesSyncMapping._directoryToJson(instance.localPath),
    };

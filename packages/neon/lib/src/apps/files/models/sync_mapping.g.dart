// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_mapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilesSyncMapping _$FilesSyncMappingFromJson(Map<String, dynamic> json) => FilesSyncMapping(
      accountId: json['accountId'] as String,
      remotePath: (json['remotePath'] as List<dynamic>).map((e) => e as String).toList(),
      localPath: json['localPath'] as String,
      status: syncStatusFromJson(json['status'] as List),
    );

Map<String, dynamic> _$FilesSyncMappingToJson(FilesSyncMapping instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'remotePath': instance.remotePath,
      'localPath': instance.localPath,
      'status': syncStatusToJson(instance.status),
    };

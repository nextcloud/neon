import 'package:json_annotation/json_annotation.dart';
import 'package:nextcloud/nextcloud.dart';

part 'sync_mapping.g.dart';

@JsonSerializable()
class FilesSyncMapping {
  FilesSyncMapping({
    required this.accountId,
    required this.remotePath,
    required this.localPath,
    final SyncStatus? status,
  }) {
    this.status = status ?? SyncStatus([]);
  }

  factory FilesSyncMapping.fromJson(final Map<String, dynamic> json) => _$FilesSyncMappingFromJson(json);
  Map<String, dynamic> toJson() => _$FilesSyncMappingToJson(this);

  final String accountId;

  final List<String> remotePath;

  final String localPath;

  @JsonKey(
    fromJson: syncStatusFromJson,
    toJson: syncStatusToJson,
  )
  late final SyncStatus status;
}

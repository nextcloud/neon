import 'package:nextcloud/src/api/files_external.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/files_external.openapi.dart';

// ignore: public_member_api_docs
extension FilesExternalExtension on NextcloudClient {
  static final _filesExternal = Expando<FilesExternalClient>();

  /// Client for the files_external APIs
  FilesExternalClient get filesExternal => _filesExternal[this] ??= FilesExternalClient.fromClient(this);
}

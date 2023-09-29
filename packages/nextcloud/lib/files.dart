import 'package:nextcloud/src/api/files.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/files.openapi.dart';

// ignore: public_member_api_docs
extension FilesExtension on NextcloudClient {
  static final _files = Expando<FilesClient>();

  /// Client for the files APIs
  FilesClient get files => _files[this] ??= FilesClient.fromClient(this);
}

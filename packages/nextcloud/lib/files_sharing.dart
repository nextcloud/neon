import 'package:nextcloud/src/api/files_sharing.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/files_sharing.openapi.dart';

// ignore: public_member_api_docs
extension FilesSharingExtension on NextcloudClient {
  static final _filesSharing = Expando<FilesSharingClient>();

  /// Client for the files_sharing APIs
  FilesSharingClient get filesSharing => _filesSharing[this] ??= FilesSharingClient.fromClient(this);
}

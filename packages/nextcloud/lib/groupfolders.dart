import 'package:nextcloud/src/api/groupfolders/groupfolders.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/groupfolders/groupfolders.openapi.dart';

/// ID for the groupfolders app.
const String appID = 'groupfolders';

/// Client for the groupfolders APIs.
extension GroupfoldersExtension on NextcloudClient {
  static final _groupfolders = Expando<$Client>();

  /// Client for the groupfolders APIs.
  $Client get groupfolders => _groupfolders[this] ??= $Client.fromClient(this);
}

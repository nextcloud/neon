import 'package:nextcloud/src/api/cookbook/cookbook.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/cookbook/cookbook.openapi.dart';
export 'package:nextcloud/src/api/cookbook/cookbook_helpers.dart';

/// ID for the cookbook app.
const String appID = 'cookbook';

/// Client for the cookbook APIs.
extension CookbookExtension on NextcloudClient {
  static final _cookbook = Expando<$Client>();

  /// Client for the cookbook APIs.
  $Client get cookbook => _cookbook[this] ??= $Client.fromClient(this);
}

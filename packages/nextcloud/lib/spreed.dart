import 'package:nextcloud/src/api/spreed/spreed.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/spreed/spreed.openapi.dart';
export 'package:nextcloud/src/api/spreed/spreed_helpers.dart';

/// Client for the spreed APIs.
extension SpreedExtension on NextcloudClient {
  static final _spreed = Expando<$Client>();

  /// Client for the spreed APIs.
  $Client get spreed => _spreed[this] ??= $Client.fromClient(this);
}

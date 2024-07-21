// coverage:ignore-file
import 'package:nextcloud/src/api/spreed/spreed.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/spreed/spreed.openapi.dart';
export 'src/api/spreed/spreed_helpers.dart';

// ignore: public_member_api_docs
extension SpreedExtension on NextcloudClient {
  static final _spreed = Expando<$Client>();

  /// Client for the spreed APIs
  $Client get spreed => _spreed[this] ??= $Client.fromClient(this);
}

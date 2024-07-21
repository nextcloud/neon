// coverage:ignore-file
import 'package:nextcloud/src/api/cookbook/cookbook.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/cookbook/cookbook.openapi.dart';
export 'src/api/cookbook/cookbook_helpers.dart';

// ignore: public_member_api_docs
extension CookbookExtension on NextcloudClient {
  static final _cookbook = Expando<$Client>();

  /// Client for the cookbook APIs
  $Client get cookbook => _cookbook[this] ??= $Client.fromClient(this);
}

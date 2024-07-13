// coverage:ignore-file
import 'package:nextcloud/src/api/cookbook.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/cookbook.openapi.dart';
export 'src/helpers/cookbook.dart';

// ignore: public_member_api_docs
extension CookbookExtension on NextcloudClient {
  static final _cookbook = Expando<$Client>();

  /// Client for the cookbook APIs
  $Client get cookbook => _cookbook[this] ??= $Client.fromClient(this);
}

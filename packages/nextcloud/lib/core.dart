// coverage:ignore-file
import 'package:nextcloud/src/api/core/core.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/core/core.openapi.dart';
export 'src/api/core/core_helpers.dart';

// ignore: public_member_api_docs
extension CoreExtension on NextcloudClient {
  static final _core = Expando<$Client>();

  /// Client for the core APIs
  $Client get core => _core[this] ??= $Client.fromClient(this);
}

// coverage:ignore-file
import 'package:nextcloud/src/api/uppush.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/uppush.openapi.dart';

// ignore: public_member_api_docs
extension UppushExtension on NextcloudClient {
  static final _uppush = Expando<UppushClient>();

  /// Client for the uppush APIs
  UppushClient get uppush => _uppush[this] ??= UppushClient.fromClient(this);
}

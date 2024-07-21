// coverage:ignore-file
import 'package:nextcloud/src/api/updatenotification/updatenotification.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/updatenotification/updatenotification.openapi.dart';

// ignore: public_member_api_docs
extension UpdatenotificationExtension on NextcloudClient {
  static final _updatenotification = Expando<$Client>();

  /// Client for the updatenotification APIs
  $Client get updatenotification => _updatenotification[this] ??= $Client.fromClient(this);
}

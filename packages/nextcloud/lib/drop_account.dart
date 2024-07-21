// coverage:ignore-file
import 'package:nextcloud/src/api/drop_account/drop_account.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/drop_account/drop_account.openapi.dart';

// ignore: public_member_api_docs
extension DropAccountExtension on NextcloudClient {
  static final _dropAccount = Expando<$Client>();

  /// Client for the drop_account APIs
  $Client get dropAccount => _dropAccount[this] ??= $Client.fromClient(this);
}

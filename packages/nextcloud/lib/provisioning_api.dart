import 'package:nextcloud/src/api/provisioning_api/provisioning_api.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/provisioning_api/provisioning_api.openapi.dart';

/// Client for the provisioning_api APIs.
extension ProvisioningApiExtension on NextcloudClient {
  static final _provisioningApi = Expando<$Client>();

  /// Client for the provisioning_api APIs.
  $Client get provisioningApi => _provisioningApi[this] ??= $Client.fromClient(this);
}

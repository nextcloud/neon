import 'package:nextcloud/src/api/terms_of_service/terms_of_service.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/terms_of_service/terms_of_service.openapi.dart';

/// ID for the terms_of_service app.
const String appID = 'terms_of_service';

/// Client for the terms_of_service APIs.
extension TermsOfServiceExtension on NextcloudClient {
  static final _termsOfService = Expando<$Client>();

  /// Client for the terms_of_service APIs.
  $Client get termsOfService => _termsOfService[this] ??= $Client.fromClient(this);
}

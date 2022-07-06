import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/generated/provisioning_api/api.dart';

// ignore: public_member_api_docs
class NextcloudProvisioningApiClient extends DefaultApi {
  // ignore: public_member_api_docs
  NextcloudProvisioningApiClient(
    final String baseURL,
    final Authentication authentication,
    final ApiClient Function(ApiClient) addCommonSettings,
  ) : super(
          addCommonSettings(
            ApiClient(
              basePath: '$baseURL/ocs/v1.php/cloud',
              authentication: authentication,
            ),
          ),
        );
}

// ignore: public_member_api_docs
extension UserDetailsDisplayName on ProvisioningApiUserDetails {
  /// This is used to work around an API change that wasn't made for every endpoint
  /// See https://github.com/nextcloud/server/commit/5086335643b6181284ee50f57b95525002842992
  String? getDisplayName() => displayname ?? displayName;
}

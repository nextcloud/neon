import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/generated/user_status/api.dart';

// ignore: public_member_api_docs
class NextcloudUserStatusClient extends DefaultApi {
  // ignore: public_member_api_docs
  NextcloudUserStatusClient(
    final String baseURL,
    final Authentication authentication,
    final ApiClient Function(ApiClient) addCommonSettings,
  ) : super(
          addCommonSettings(
            ApiClient(
              basePath: '$baseURL/ocs/v1.php/apps/user_status',
              authentication: authentication,
            ),
          ),
        );
}

import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/generated/news/api.dart';

// ignore: public_member_api_docs
class NextcloudNewsClient extends DefaultApi {
  // ignore: public_member_api_docs
  NextcloudNewsClient(
    final String baseURL,
    final Authentication authentication,
    final ApiClient Function(ApiClient) addCommonSettings,
  ) : super(
          addCommonSettings(
            ApiClient(
              basePath: '$baseURL/apps/news',
              authentication: authentication,
            ),
          ),
        );
}

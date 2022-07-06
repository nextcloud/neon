import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/generated/notes/api.dart';

// ignore: public_member_api_docs
class NextcloudNotesClient extends DefaultApi {
  // ignore: public_member_api_docs
  NextcloudNotesClient(
    final String baseURL,
    final Authentication authentication,
    final ApiClient Function(ApiClient) addCommonSettings,
  ) : super(
          addCommonSettings(
            ApiClient(
              basePath: '$baseURL/apps/notes',
              authentication: authentication,
            ),
          ),
        );
}

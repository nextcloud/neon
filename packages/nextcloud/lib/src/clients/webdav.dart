import 'package:nextcloud/src/authentication_extension.dart';
import 'package:nextcloud/src/clients/common/api.dart';
import 'package:nextcloud/src/clients/custom/webdav/webdav.dart';

// ignore: public_member_api_docs
class NextcloudWebDAVClient extends WebDavClient {
  // ignore: public_member_api_docs
  NextcloudWebDAVClient(
    super.baseURL,
    final Authentication authentication,
    final String username,
    final Map<String, String> headers,
  ) : super(
          basePath: '/remote.php/dav/files/$username',
          baseHeaders: {
            ...headers,
            ...authentication.headers,
          },
        );
}

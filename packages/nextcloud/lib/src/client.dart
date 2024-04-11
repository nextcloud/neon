import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

// ignore: public_member_api_docs
class NextcloudClient extends DynamiteClient {
  // ignore: public_member_api_docs
  NextcloudClient(
    super.baseURL, {
    String? loginName,
    String? password,
    String? appPassword,
    String? userAgent,
    super.httpClient,
    super.cookieJar,
  }) : super(
          baseHeaders: {
            if (userAgent != null) HttpHeaders.userAgentHeader: userAgent,
          },
          authentications: [
            if (appPassword != null)
              DynamiteHttpBearerAuthentication(
                token: appPassword,
              ),
            if (loginName != null && (password ?? appPassword) != null)
              DynamiteHttpBasicAuthentication(
                username: loginName,
                password: (password ?? appPassword)!,
              ),
          ],
        );
}

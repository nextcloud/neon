import 'package:cookie_jar/cookie_jar.dart';
import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:nextcloud/src/utils/cookie_jar_client.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Client conformance tests',
    () {
      testAll(
        () => CookieJarClient(
          cookieJar: CookieJar(),
        ),
        canReceiveSetCookieHeaders: true,
        canSendCookieHeaders: true,
      );
    },
    onPlatform: const {
      'browser': [Skip()],
    },
  );
}

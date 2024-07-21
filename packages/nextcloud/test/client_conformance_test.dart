@TestOn('vm')
library;

import 'package:cookie_jar/cookie_jar.dart';
import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';
import 'package:nextcloud/src/utils/cookie_jar_client.dart';
import 'package:test/test.dart';

void main() {
  group('Client conformance tests', () {
    testAll(
      () => NextcloudClient(Uri()),
      canReceiveSetCookieHeaders: true,
      canSendCookieHeaders: true,
    );

    testAll(
      () => CookieJarClient(
        cookieJar: CookieJar(),
      ),
      canReceiveSetCookieHeaders: true,
      canSendCookieHeaders: true,
    );

    testAll(
      () => WebDavCSRFClient(NextcloudClient(Uri())),
      canReceiveSetCookieHeaders: true,
      canSendCookieHeaders: true,
    );
  });
}

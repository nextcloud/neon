import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Client conformance tests',
    () {
      testAll(
        () => WebDavCSRFClient(Uri()),
        canReceiveSetCookieHeaders: true,
        canSendCookieHeaders: true,
      );
    },
    onPlatform: const {
      'browser': [Skip()],
    },
  );
}

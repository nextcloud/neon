import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Interceptor Client VM conformance test',
    () {
      testAll(
        () => NextcloudClient(Uri()),
        canReceiveSetCookieHeaders: true,
        canSendCookieHeaders: true,
      );
    },
    onPlatform: const {
      'browser': [Skip()],
    },
  );

  group(
    'Interceptor Client browser conformance test',
    () {
      testAll(
        () => NextcloudClient(Uri()),
        redirectAlwaysAllowed: true,
        canStreamRequestBody: false,
        canStreamResponseBody: false,
        canWorkInIsolates: false,
        supportsMultipartRequest: false,
      );
    },
    onPlatform: const {
      'dart-vm': [Skip()],
    },
  );
}

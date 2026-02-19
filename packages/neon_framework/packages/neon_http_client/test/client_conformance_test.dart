import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:neon_http_client/src/neon_http_client.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Neon Client VM conformance test',
    () {
      testAll(() => NeonHttpClient(baseURL: Uri()), canReceiveSetCookieHeaders: true, canSendCookieHeaders: true);
    },
    onPlatform: const {
      'browser': [Skip()],
    },
  );

  group(
    'Neon Client browser conformance test',
    () {
      testAll(
        () => NeonHttpClient(baseURL: Uri()),
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

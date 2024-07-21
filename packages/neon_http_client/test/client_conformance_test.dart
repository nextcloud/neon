@TestOn('vm')
library;

import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:neon_http_client/src/neon_http_client.dart';
import 'package:test/test.dart';

void main() {
  testAll(
    NeonHttpClient.new,
    canReceiveSetCookieHeaders: true,
    canSendCookieHeaders: true,
  );
}

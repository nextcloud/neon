import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:interceptor_http_client/src/interceptor_http_client.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Interceptor Client VM conformance test',
    () {
      testAll(
        () => InterceptorHttpClient(
          baseClient: http.Client(),
          interceptors: BuiltList(),
        ),
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
        () => InterceptorHttpClient(
          baseClient: http.Client(),
          interceptors: BuiltList(),
        ),
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

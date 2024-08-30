import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:nextcloud/nextcloud.dart';

void main() {
  testAll(
    () => NextcloudClient(Uri()),
    canReceiveSetCookieHeaders: true,
    canSendCookieHeaders: true,
  );
}

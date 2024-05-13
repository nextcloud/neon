import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/cookie_store_conformance_tests.dart' as conformance_tests;

void main() {
  conformance_tests.testAll(CookieStore.new);
}

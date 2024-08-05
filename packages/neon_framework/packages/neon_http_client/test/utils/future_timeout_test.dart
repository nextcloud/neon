import 'dart:async';

import 'package:neon_http_client/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('FutureTimeout', () {
    test('times out with non null value', () async {
      expect(
        Future<void>.delayed(const Duration(milliseconds: 10)).maybeTimeout(const Duration(milliseconds: 3)),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('does not time out with null value', () async {
      expect(
        Future<void>.delayed(const Duration(milliseconds: 10)).maybeTimeout(null),
        completes,
      );
    });
  });
}

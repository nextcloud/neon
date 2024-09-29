import 'dart:async';

import 'package:http/src/request.dart';
import 'package:http/src/response.dart';
import 'package:neon_storage/neon_storage.dart';
import 'package:test/test.dart';

class _TestRequestCache implements RequestCache {
  @override
  Future<Response?> get(String accountID, Request request) => throw UnimplementedError();

  @override
  Future<void> set(String accountID, Request request, Response response) => throw UnimplementedError();

  @override
  Future<void> updateHeaders(String accountID, Request request, Map<String, String> headers) =>
      throw UnimplementedError();
}

void main() {
  group('RequestCache', () {
    test('can be implemented', () {
      expect(_TestRequestCache(), isNotNull);
    });
  });
}

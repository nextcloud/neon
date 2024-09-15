import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:neon_framework/testing.dart';

/// Creates an [Account] connected to a fake server defined by [requests].
///
/// To be used for end-to-end testing `Bloc`s.
Account mockServer(
  Map<RegExp, Map<String, FutureOr<Response> Function(RegExpMatch match, Request)>> requests,
) {
  final client = MockClient((request) async {
    for (final entry in requests.entries) {
      final match = entry.key.firstMatch(request.url.path);
      if (match != null) {
        final call = entry.value[request.method];
        if (call != null) {
          return call(match, request);
        }
      }
    }

    throw Exception(request);
  });

  return createAccount(
    credentials: createCredentials(
      serverURL: Uri.parse('https://example.com'),
      username: 'test',
      appPassword: 'test',
    ),
    httpClient: client,
  );
}

import 'dart:async';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:neon_framework/src/models/account.dart';

/// Creates an [Account] connected to a fake server defined by [requests].
///
/// To be used for end-to-end testing `Bloc`s.
Account mockServer(
  Map<RegExp, Map<String, FutureOr<Response> Function(RegExpMatch match, Map<String, List<String>> queryParameters)>>
      requests,
) =>
    Account(
      (b) => b
        ..serverURL = Uri.parse('https://example.com')
        ..username = 'test'
        ..password = 'test'
        ..httpClient = MockClient((request) async {
          for (final entry in requests.entries) {
            final match = entry.key.firstMatch(request.url.path);
            if (match != null) {
              final call = entry.value[request.method];
              if (call != null) {
                return call(match, request.url.queryParametersAll);
              }
            }
          }

          throw Exception(request);
        }),
    );

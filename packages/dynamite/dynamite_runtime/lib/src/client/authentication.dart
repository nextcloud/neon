import 'dart:convert';

import 'package:meta/meta.dart';

/// Base dynamite authentication.
@immutable
sealed class DynamiteAuthentication {
  /// Creates a new authentication.
  const DynamiteAuthentication({
    required this.type,
    required this.scheme,
  });

  /// The base type of the authentication.
  final String type;

  /// The used authentication HTTP scheme.
  final String? scheme;

  /// The authentication headers added to a request.
  Map<String, String> get headers;
}

/// Basic http authentication with username and password.
class DynamiteHttpBasicAuthentication extends DynamiteAuthentication {
  /// Creates a new http basic authentication.
  const DynamiteHttpBasicAuthentication({
    required this.username,
    required this.password,
  }) : super(
          type: 'http',
          scheme: 'basic',
        );

  /// The username.
  final String username;

  /// The password.
  final String password;

  @override
  Map<String, String> get headers => {
        'Authorization':
            'Basic ${base64.encode(utf8.encode('$username:$password'))}',
      };
}

/// Http bearer authentication with a token.
class DynamiteHttpBearerAuthentication extends DynamiteAuthentication {
  /// Creates a new http bearer authentication.
  const DynamiteHttpBearerAuthentication({
    required this.token,
  }) : super(
          type: 'http',
          scheme: 'bearer',
        );

  /// The authentication token.
  final String token;

  @override
  Map<String, String> get headers => {
        'Authorization': 'Bearer $token',
      };
}

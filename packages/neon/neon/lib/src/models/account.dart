import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/nextcloud.dart';

part 'account.g.dart';

/// Credentials interface
@internal
@immutable
abstract interface class Credentials {
  /// Url of the server
  abstract final String serverURL;

  /// Username
  abstract final String username;

  /// Password
  abstract final String? password;
}

@JsonSerializable()
@immutable
class Account implements Credentials {
  Account({
    required this.serverURL,
    required this.username,
    this.password,
    this.userAgent,
  }) : _client = NextcloudClient(
          serverURL,
          loginName: username,
          password: password,
          userAgentOverride: userAgent,
          cookieJar: CookieJar(),
        );

  factory Account.fromJson(final Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  final String serverURL;
  @override
  final String username;
  @override
  final String? password;
  final String? userAgent;

  @override
  bool operator ==(final Object other) =>
      other is Account &&
      other.serverURL == serverURL &&
      other.username == username &&
      other.password == password &&
      other.userAgent == userAgent;

  @override
  int get hashCode => serverURL.hashCode + username.hashCode;

  String get id => client.id;

  String get humanReadableID => client.humanReadableID;

  final NextcloudClient _client;

  NextcloudClient get client => _client;
}

Map<String, String> _idCache = {};

extension NextcloudClientHelpers on NextcloudClient {
  String get id {
    final key = '$username@$baseURL';
    if (_idCache[key] != null) {
      return _idCache[key]!;
    }
    return _idCache[key] = sha1.convert(utf8.encode(key)).toString();
  }

  String get humanReadableID {
    final uri = Uri.parse(baseURL);
    // Maybe also show path if it is not '/' ?
    return '${username!}@${uri.port != 443 ? '${uri.host}:${uri.port}' : uri.host}';
  }
}

extension AccountFind on Iterable<Account> {
  Account? tryFind(final String? accountID) => firstWhereOrNull((final account) => account.id == accountID);
  Account find(final String accountID) => firstWhere((final account) => account.id == accountID);
}

/// Qrcode Login credentials.
///
/// The Credentials as provided by the server when manually creating an app
/// password.
@internal
@immutable
class LoginQrcode implements Credentials {
  /// Creates a new LoginQrcode object.
  @visibleForTesting
  const LoginQrcode({
    required this.serverURL,
    required this.username,
    required this.password,
  });

  @override
  final String serverURL;
  @override
  final String username;
  @override
  final String password;

  /// Pattern matching the full Qrcode content.
  static final _loginQrcodeUrlRegex = RegExp(r'^nc://login/user:(.*)&password:(.*)&server:(.*)$');

  /// Pattern matching the path part of the Qrcode.
  ///
  /// This is used when launching the app through an intent.
  static final _loginQrcodePathRegex = RegExp(r'^/user:(.*)&password:(.*)&server:(.*)$');

  /// Creates a new `LoginQrcode` object by parsing a url string.
  ///
  /// If the [url] string is not valid as a LoginQrcode a [FormatException] is
  /// thrown.
  ///
  /// Example:
  /// ```dart
  /// final loginQrcode =
  ///     LoginQrcode.parse('nc://login/user:JohnDoe&password:super_secret&server:example.com');
  /// print(loginQrcode.serverURL); // JohnDoe
  /// print(loginQrcode.username); // super_secret
  /// print(loginQrcode.password); // example.com
  ///
  /// LoginQrcode.parse('::Not valid LoginQrcode::'); // Throws FormatException.
  /// ```
  static LoginQrcode parse(final String url) {
    for (final regex in [_loginQrcodeUrlRegex, _loginQrcodePathRegex]) {
      final matches = regex.allMatches(url);
      if (matches.isEmpty) {
        continue;
      }

      final match = matches.single;
      if (match.groupCount != 3) {
        continue;
      }

      return LoginQrcode(
        serverURL: match.group(3)!,
        username: match.group(1)!,
        password: match.group(2)!,
      );
    }

    throw const FormatException();
  }

  /// Creates a new `LoginQrcode` object by parsing a url string.
  ///
  /// Returns `null` if the [url] string is not valid as a LoginQrcode.
  ///
  /// Example:
  /// ```dart
  /// final loginQrcode =
  ///     LoginQrcode.parse('nc://login/user:JohnDoe&password:super_secret&server:example.com');
  /// print(loginQrcode.serverURL); // JohnDoe
  /// print(loginQrcode.username); // super_secret
  /// print(loginQrcode.password); // example.com
  ///
  /// final notLoginQrcode = LoginQrcode.tryParse('::Not valid LoginQrcode::');
  /// print(notLoginQrcode); // null
  /// ```
  static LoginQrcode? tryParse(final String url) {
    try {
      return parse(url);
    } on FormatException {
      return null;
    }
  }

  @override
  bool operator ==(final Object other) =>
      other is LoginQrcode && other.serverURL == serverURL && other.username == username && other.password == password;

  @override
  int get hashCode => Object.hashAll([
        serverURL,
        username,
        password,
      ]);
}

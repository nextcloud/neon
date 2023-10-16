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
  abstract final Uri serverURL;

  /// Username
  abstract final String username;

  /// App password
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
  }) : client = NextcloudClient(
          serverURL,
          loginName: username,
          password: password,
          appPassword: password,
          userAgentOverride: userAgent,
          cookieJar: CookieJar(),
        );

  factory Account.fromJson(final Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  final Uri serverURL;
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

  final NextcloudClient client;

  String get id {
    final key = '$username@$serverURL';

    return _idCache[key] ??= sha1.convert(utf8.encode(key)).toString();
  }

  /// A human readable representation of [username] and [serverURL].
  String get humanReadableID {
    // Maybe also show path if it is not '/' ?
    final buffer = StringBuffer()
      ..write(username)
      ..write('@')
      ..write(serverURL.host);

    if (serverURL.hasPort) {
      buffer
        ..write(':')
        ..write(serverURL.port);
    }

    return buffer.toString();
  }

  /// Completes an incomplete [Uri] using the [serverURL].
  ///
  /// Some Nextcloud APIs return [Uri]s to resources on the server (e.g. an image) but only give an absolute path.
  /// Those [Uri]s need to be completed using the [serverURL] to have a working [Uri].
  ///
  /// The paths of the [serverURL] and the [uri] need to be join to get the full path, unless the [uri] path is already an absolute path.
  /// In that case an instance hosted at a sub folder will already contain the sub folder part in the [uri].
  Uri completeUri(final Uri uri) {
    final result = serverURL.resolveUri(uri);
    if (!uri.hasAbsolutePath) {
      return result.replace(path: '${serverURL.path}/${uri.path}');
    }
    return result;
  }

  /// Removes the [serverURL] part from the [uri].
  ///
  /// Should be used when trying to push a [uri] from an API to the router as it might contain the scheme, host and sub path of the instance which will not work with the router.
  Uri stripUri(final Uri uri) => Uri.parse(uri.toString().replaceFirst(serverURL.toString(), ''));
}

Map<String, String> _idCache = {};

extension AccountFind on Iterable<Account> {
  Account? tryFind(final String? accountID) => firstWhereOrNull((final account) => account.id == accountID);
  Account find(final String accountID) => firstWhere((final account) => account.id == accountID);
}

/// QRcode Login credentials.
///
/// The Credentials as provided by the server when manually creating an app
/// password.
@internal
@immutable
class LoginQRcode implements Credentials {
  /// Creates a new LoginQRcode object.
  @visibleForTesting
  const LoginQRcode({
    required this.serverURL,
    required this.username,
    required this.password,
  });

  @override
  final Uri serverURL;
  @override
  final String username;
  @override
  final String password;

  /// Pattern matching the full QRcode content.
  static final _loginQRcodeUrlRegex = RegExp(r'^nc://login/user:(.*)&password:(.*)&server:(.*)$');

  /// Pattern matching the path part of the QRcode.
  ///
  /// This is used when launching the app through an intent.
  static final _loginQRcodePathRegex = RegExp(r'^/user:(.*)&password:(.*)&server:(.*)$');

  /// Creates a new `LoginQRcode` object by parsing a url string.
  ///
  /// If the [url] string is not valid as a LoginQRcode a [FormatException] is
  /// thrown.
  ///
  /// Example:
  /// ```dart
  /// final loginQRcode =
  ///     LoginQRcode.parse('nc://login/user:JohnDoe&password:super_secret&server:example.com');
  /// print(loginQRcode.serverURL); // JohnDoe
  /// print(loginQRcode.username); // super_secret
  /// print(loginQRcode.password); // example.com
  ///
  /// LoginQRcode.parse('::Not valid LoginQRcode::'); // Throws FormatException.
  /// ```
  static LoginQRcode parse(final String url) {
    for (final regex in [_loginQRcodeUrlRegex, _loginQRcodePathRegex]) {
      final matches = regex.allMatches(url);
      if (matches.isEmpty) {
        continue;
      }

      final match = matches.single;
      if (match.groupCount != 3) {
        continue;
      }

      return LoginQRcode(
        serverURL: Uri.parse(match.group(3)!),
        username: match.group(1)!,
        password: match.group(2)!,
      );
    }

    throw const FormatException();
  }

  /// Creates a new `LoginQRcode` object by parsing a url string.
  ///
  /// Returns `null` if the [url] string is not valid as a LoginQRcode.
  ///
  /// Example:
  /// ```dart
  /// final loginQRcode =
  ///     LoginQRcode.parse('nc://login/user:JohnDoe&password:super_secret&server:example.com');
  /// print(loginQRcode.serverURL); // JohnDoe
  /// print(loginQRcode.username); // super_secret
  /// print(loginQRcode.password); // example.com
  ///
  /// final notLoginQRcode = LoginQRcode.tryParse('::Not valid LoginQRcode::');
  /// print(notLoginQRcode); // null
  /// ```
  static LoginQRcode? tryParse(final String url) {
    try {
      return parse(url);
    } on FormatException {
      return null;
    }
  }

  @override
  bool operator ==(final Object other) =>
      other is LoginQRcode && other.serverURL == serverURL && other.username == username && other.password == password;

  @override
  int get hashCode => Object.hashAll([
        serverURL,
        username,
        password,
      ]);
}

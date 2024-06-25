import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/nextcloud.dart';

part 'account.g.dart';

@SerializersFor([
  Account,
])
final Serializers _serializers = (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

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

/// Account data.
@immutable
abstract class Account implements Credentials, Findable, Built<Account, AccountBuilder> {
  // ignore: public_member_api_docs
  factory Account([void Function(AccountBuilder)? updates]) = _$Account;

  const Account._();

  /// Creates a new account object from the given [json] data.
  factory Account.fromJson(Map<String, dynamic> json) => _serializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  Map<String, dynamic> toJson() => _serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  // ignore: public_member_api_docs
  static Serializer<Account> get serializer => _$accountSerializer;

  @override
  Uri get serverURL;

  @override
  String get username;

  @override
  String? get password;

  /// The user agent to use.
  String? get userAgent;

  /// Custom HTTP client used for all requests.
  @visibleForTesting
  @BuiltValueField(serialize: false)
  Client? get httpClient;

  /// An authenticated API client.
  @memoized
  NextcloudClient get client {
    final cookieStore = NeonStorage().cookieStore(
      accountID: id,
      serverURL: serverURL,
    );

    return NextcloudClient(
      serverURL,
      loginName: username,
      password: password,
      appPassword: password,
      userAgent: userAgent,
      cookieJar: cookieStore != null ? CookieJarAdapter(cookieStore) : null,
      httpClient: httpClient,
    );
  }

  /// The unique ID of the account.
  ///
  /// Implemented in a primitive way hashing the [username] and [serverURL].
  @override
  @memoized
  String get id => sha1.convert(utf8.encode('$username@$serverURL')).toString();

  /// A human readable representation of [username] and [serverURL].
  @memoized
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
  @internal
  Uri completeUri(Uri uri) {
    final result = serverURL.resolveUri(uri);
    if (!uri.hasAbsolutePath) {
      return result.replace(path: '${serverURL.path}/${uri.path}');
    }
    return result;
  }

  /// Get the necessary `Authorization` headers for a given [uri].
  ///
  /// This method ensures no credentials are sent to the wrong server.
  Map<String, String>? getAuthorizationHeaders(Uri uri) {
    if (uri.toString().startsWith(serverURL.toString())) {
      return client.authentications?.firstOrNull?.headers;
    }

    return null;
  }

  /// Removes the [serverURL] part from the [uri].
  ///
  /// Should be used when trying to push a [uri] from an API to the router as it might contain the scheme, host and sub path of the instance which will not work with the router.
  Uri stripUri(Uri uri) => Uri.parse(uri.toString().replaceFirst(serverURL.toString(), ''));
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
  static LoginQRcode parse(String url) {
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
  static LoginQRcode? tryParse(String url) {
    try {
      return parse(url);
    } on FormatException {
      return null;
    }
  }

  @override
  bool operator ==(Object other) =>
      other is LoginQRcode && other.serverURL == serverURL && other.username == username && other.password == password;

  @override
  int get hashCode => Object.hashAll([
        serverURL,
        username,
        password,
      ]);
}

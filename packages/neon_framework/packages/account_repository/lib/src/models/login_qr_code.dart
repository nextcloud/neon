import 'package:account_repository/src/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// QRcode Login credentials.
///
/// The Credentials as provided by the server when manually creating an app
/// password.
@immutable
final class LoginQRcode with EquatableMixin {
  /// Creates a new LoginQRcode object.
  @visibleForTesting
  const LoginQRcode({
    required this.credentials,
  });

  /// The server credentials.
  final Credentials credentials;

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
        credentials: Credentials((b) {
          b
            ..serverURL = Uri.parse(match.group(3)!)
            ..username = match.group(1)
            ..password = match.group(2);
        }),
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
  String toString() {
    final username = credentials.username;
    final password = credentials.password;
    final serverURL = credentials.serverURL;

    return 'nc://login/user:$username&password:$password&server:$serverURL';
  }

  @override
  List<Object?> get props => [credentials];
}

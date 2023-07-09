import 'package:meta/meta.dart';

@internal
class LoginQrcode {
  LoginQrcode({
    required this.server,
    required this.user,
    required this.password,
  });

  static final _loginQrcodeUrlRegex = RegExp(r'^nc://login/user:(.*)&password:(.*)&server:(.*)$');
  static final _loginQrcodePathRegex = RegExp(r'^/user:(.*)&password:(.*)&server:(.*)$');

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
        server: match.group(3)!,
        user: match.group(1)!,
        password: match.group(2)!,
      );
    }

    throw const FormatException();
  }

  static LoginQrcode? tryParse(final String url) {
    try {
      return parse(url);
    } on FormatException {
      return null;
    }
  }

  final String server;
  final String user;
  final String password;
}

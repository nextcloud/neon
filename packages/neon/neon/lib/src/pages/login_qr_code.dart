import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/exceptions.dart';
import 'package:neon/src/widgets/error.dart';

@internal
class LoginQRcodePage extends StatefulWidget {
  const LoginQRcodePage({
    super.key,
  });

  @override
  State<LoginQRcodePage> createState() => _LoginQRcodePageState();
}

class _LoginQRcodePageState extends State<LoginQRcodePage> {
  String? _lastErrorURL;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ReaderWidget(
          codeFormat: Format.qrCode,
          showGallery: false,
          showToggleCamera: false,
          showScannerOverlay: false,
          tryHarder: true,
          cropPercent: 0,
          scanDelaySuccess: const Duration(seconds: 3),
          onScan: (final code) async {
            String? url;
            try {
              url = code.text;
              if (url == null) {
                throw const InvalidQRcodeException();
              }
              final match = LoginQRcode.tryParse(url);
              if (match == null) {
                throw const InvalidQRcodeException();
              }

              LoginCheckServerStatusRoute.withCredentials(
                serverUrl: match.serverURL,
                loginName: match.username,
                password: match.password,
              ).pushReplacement(context);
            } catch (e, s) {
              if (_lastErrorURL != url) {
                debugPrint(e.toString());
                debugPrint(s.toString());

                _lastErrorURL = url;
                NeonError.showSnackbar(context, e);
              }
            }
          },
        ),
      );
}

@immutable
class InvalidQRcodeException extends NeonException {
  const InvalidQRcodeException();

  @override
  NeonExceptionDetails get details => NeonExceptionDetails(
        getText: (final context) => NeonLocalizations.of(context).errorInvalidQRcode,
      );
}

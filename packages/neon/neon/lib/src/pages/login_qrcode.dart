import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/exceptions.dart';
import 'package:neon/src/widgets/exception.dart';

@internal
class LoginQrcodePage extends StatefulWidget {
  const LoginQrcodePage({
    super.key,
  });

  @override
  State<LoginQrcodePage> createState() => _LoginQrcodePageState();
}

class _LoginQrcodePageState extends State<LoginQrcodePage> {
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
                throw InvalidQrcodeException();
              }
              final match = LoginQrcode.tryParse(url);
              if (match == null) {
                throw InvalidQrcodeException();
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
                NeonException.showSnackbar(context, e);
              }
            }
          },
        ),
      );
}

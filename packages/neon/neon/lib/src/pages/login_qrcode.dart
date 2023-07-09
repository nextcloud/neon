import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/exceptions.dart';
import 'package:neon/src/widgets/exception.dart';

class LoginQrcodePage extends StatefulWidget {
  const LoginQrcodePage({
    super.key,
  });

  @override
  State<LoginQrcodePage> createState() => _LoginQrcodePageState();
}

class _LoginQrcodePageState extends State<LoginQrcodePage> {
  final _urlRegex = RegExp(r'^nc://login/user:(.*)&password:(.*)&server:(.*)$');
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
              final match = _urlRegex.allMatches(url).single;
              if (match.groupCount != 3) {
                throw InvalidQrcodeException();
              }
              final loginName = match.group(1)!;
              final password = match.group(2)!;
              final serverURL = match.group(3)!;

              final result = await LoginCheckServerStatusRoute(serverURL: serverURL).push<bool>(context);
              if ((result ?? false) && mounted) {
                LoginCheckAccountRoute(
                  serverURL: serverURL,
                  loginName: loginName,
                  password: password,
                ).pushReplacement(context);
              }
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

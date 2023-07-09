import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/exceptions.dart';
import 'package:neon/src/utils/login_qrcode.dart';
import 'package:neon/src/widgets/exception.dart';

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
              await processLoginQrcode(context, match);
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

class LoginQrcodeIntermediatePage extends StatefulWidget {
  const LoginQrcodeIntermediatePage({
    required this.serverURL,
    required this.loginName,
    required this.password,
    super.key,
  });

  final String serverURL;
  final String loginName;
  final String password;

  @override
  State<LoginQrcodeIntermediatePage> createState() => _LoginQrcodeIntermediatePageState();
}

class _LoginQrcodeIntermediatePageState extends State<LoginQrcodeIntermediatePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      unawaited(
        processLoginQrcode(
          context,
          LoginQrcode(
            server: widget.serverURL,
            user: widget.loginName,
            password: widget.password,
          ),
        ),
      );
    });
  }

  @override
  Widget build(final BuildContext context) => const SizedBox();
}

Future processLoginQrcode(final BuildContext context, final LoginQrcode qrcode) async {
  final result = await LoginCheckServerStatusRoute(serverURL: qrcode.server).push<bool>(context);
  if ((result ?? false) && context.mounted) {
    LoginCheckAccountRoute(
      serverURL: qrcode.server,
      loginName: qrcode.user,
      password: qrcode.password,
    ).pushReplacement(context);
  }
}

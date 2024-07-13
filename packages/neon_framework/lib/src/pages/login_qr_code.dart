import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/utils/exceptions.dart';
import 'package:neon_framework/src/widgets/error.dart';

final _log = Logger('LoginQRcodePage');

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ReaderWidget(
          codeFormat: Format.qrCode,
          showGallery: false,
          showToggleCamera: false,
          showScannerOverlay: false,
          tryHarder: true,
          cropPercent: 0,
          scanDelaySuccess: const Duration(seconds: 3),
          onScan: (code) async {
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

              await LoginCheckServerStatusWithCredentialsRoute(
                serverUrl: match.serverURL,
                loginName: match.username,
                password: match.password,
              ).push<LoginCheckServerStatusRoute>(context);
            } on InvalidQRcodeException catch (error, stackTrace) {
              if (_lastErrorURL != url) {
                _log.warning(
                  'Error parsing parsing qr code.',
                  error,
                  stackTrace,
                );

                _lastErrorURL = url;
                if (context.mounted) {
                  NeonError.showSnackbar(context, error);
                }
              }
            }
          },
        ),
      ),
    );
  }
}

/// Exception which is thrown when an invalid QR code is encountered.
@immutable
class InvalidQRcodeException extends NeonException {
  /// Creates a new [InvalidQRcodeException].
  const InvalidQRcodeException();

  @override
  NeonExceptionDetails get details => NeonExceptionDetails(
        getText: (context) => NeonLocalizations.of(context).errorInvalidQRcode,
      );
}

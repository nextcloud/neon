import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/login/bloc/login_bloc.dart';
import 'package:neon_framework/src/login_qr_code/login_qr_code.dart';

@internal
class LoginQrCodeView extends StatelessWidget {
  const LoginQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: move the listener into the page once our routing allows it
    return BlocListener<LoginQrCodeBloc, LoginQrCodeState>(
      listener: (context, state) {
        if (state.invalid) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            SnackBar(
              content: Text(NeonLocalizations.of(context).errorInvalidQRcode),
            ),
          );
        }

        final credentials = state.credentials;
        if (credentials != null) {
          context.read<LoginBloc>().add(LoginCredentialsEntered(credentials));
        }
      },
      child: ReaderWidget(
        codeFormat: Format.qrCode,
        showGallery: false,
        showToggleCamera: false,
        showScannerOverlay: false,
        tryHarder: true,
        cropPercent: 0,
        scanDelaySuccess: const Duration(seconds: 3),
        onScan: (code) => context.read<LoginQrCodeBloc>().add(LoginQrCodeScanned(code.text)),
      ),
    );
  }
}

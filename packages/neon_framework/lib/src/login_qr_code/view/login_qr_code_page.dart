import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/login_qr_code/login_qr_code.dart';

@internal
class LoginQrCodePage extends StatelessWidget {
  const LoginQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginQrCodeBloc(),
        ),
      ],
      child: const LoginQrCodeView(),
    );
  }
}

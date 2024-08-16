import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_framework/src/login/login.dart';

/// The page for the login flow
class LoginPage extends StatelessWidget {
  /// Creates a login page.
  LoginPage({
    this.serverURL,
    this.qrCode,
    super.key,
  })  : assert(qrCode == null || serverURL == null, 'Either a serverURL or qrCode can be provided'),
        assert(qrCode == null || LoginQRcode.tryParse(qrCode) != null, 'qrCode can is not a valid login qr code');

  /// The initial server url.
  final Uri? serverURL;

  /// The scanned login qr code.
  final String? qrCode;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
          create: (context) {
            Credentials? credentials;
            if (qrCode != null) {
              credentials = LoginQRcode.parse(qrCode!).credentials;
            }

            return LoginBloc(
              accountRepository: context.read<AccountRepository>(),
              serverURL: serverURL,
              credentials: credentials,
            );
          },
        ),
      ],
      child: const LoginView(),
    );
  }
}

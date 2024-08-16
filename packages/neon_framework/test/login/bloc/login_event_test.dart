// ignore_for_file: prefer_const_constructors

import 'package:account_repository/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login/login.dart';

void main() {
  final url = Uri.https('serverURL');
  final credentials = createCredentials(
    serverURL: Uri.https('credentials_serverURL'),
  );
  final account = createAccount(
    credentials: credentials,
  );

  group('LoginEvent', () {
    group('LoginUseQRCode', () {
      test('supports value equality', () {
        expect(
          LoginUseQRCode(),
          equals(LoginUseQRCode()),
        );
      });

      test('props are correct', () {
        expect(
          LoginUseQRCode().props,
          equals(<Object?>[]),
        );
      });

      group('LoginUrlEntered', () {
        test('supports value equality', () {
          expect(
            LoginUrlEntered(url, credentials),
            equals(LoginUrlEntered(url, credentials)),
          );
        });

        test('props are correct', () {
          expect(
            LoginUrlEntered(url, credentials).props,
            equals(<Object?>[
              url, // serverURL
              credentials, // credentials
            ]),
          );
        });
      });

      group('LoginServerChecked', () {
        test('supports value equality', () {
          expect(
            LoginServerChecked(),
            equals(LoginServerChecked()),
          );
        });

        test('props are correct', () {
          expect(
            LoginServerChecked().props,
            equals(<Object?>[]),
          );
        });
      });

      group('LoginCredentialsEntered', () {
        test('supports value equality', () {
          expect(
            LoginCredentialsEntered(credentials),
            equals(LoginCredentialsEntered(credentials)),
          );
        });

        test('props are correct', () {
          expect(
            LoginCredentialsEntered(credentials).props,
            equals(<Object?>[
              credentials, // credentials
            ]),
          );
        });
      });

      group('LoginAccountChecked', () {
        test('supports value equality', () {
          expect(
            LoginAccountChecked(account),
            equals(LoginAccountChecked(account)),
          );
        });

        test('props are correct', () {
          expect(
            LoginAccountChecked(account).props,
            equals(<Object?>[
              account, // account
            ]),
          );
        });
      });
    });
  });
}

// ignore_for_file: avoid_redundant_argument_values

import 'package:account_repository/account_repository.dart';
import 'package:account_repository/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_qr_code/login_qr_code.dart';

void main() {
  group('LoginQrCodeState', () {
    LoginQrCodeState createSubject({
      Credentials? credentials,
      bool invalid = false,
    }) {
      return LoginQrCodeState(
        credentials: credentials,
        invalid: invalid,
      );
    }

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject(
          credentials: createCredentials(),
        ).props,
        equals(<Object?>[
          createCredentials(), // credentials
          false, // invalid
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            credentials: null,
            invalid: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            credentials: createCredentials(
              serverURL: Uri.https('new-serverURL'),
              username: 'new-username',
              appPassword: 'new-appPassword',
            ),
            invalid: true,
          ),
          equals(
            createSubject(
              credentials: createCredentials(
                serverURL: Uri.https('new-serverURL'),
                username: 'new-username',
                appPassword: 'new-appPassword',
              ),
              invalid: true,
            ),
          ),
        );
      });
    });
  });
}

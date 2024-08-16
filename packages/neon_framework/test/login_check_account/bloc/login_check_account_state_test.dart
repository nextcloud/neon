import 'package:account_repository/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';

void main() {
  group('LoginCheckAccountState', () {
    group('LoginCheckAccountStateLoading', () {
      test('supports value comparison', () {
        expect(
          LoginCheckAccountStateLoading(
            credentials: createCredentials(),
          ),
          LoginCheckAccountStateLoading(
            credentials: createCredentials(),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LoginCheckAccountStateLoading(
            credentials: createCredentials(),
          ).props,
          equals(<Object?>[
            createCredentials(), // credentials
          ]),
        );
      });
    });

    group('LoginCheckAccountStateSuccess', () {
      test('supports value comparison', () {
        expect(
          LoginCheckAccountStateSuccess(
            credentials: createCredentials(),
            account: createAccount(),
          ),
          LoginCheckAccountStateSuccess(
            credentials: createCredentials(),
            account: createAccount(),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LoginCheckAccountStateSuccess(
            credentials: createCredentials(),
            account: createAccount(),
          ).props,
          equals(<Object?>[
            createCredentials(), // credentials
            createAccount(), // account
          ]),
        );
      });
    });

    group('LoginCheckAccountStateFailure', () {
      test('supports value comparison', () {
        expect(
          LoginCheckAccountStateFailure(
            credentials: createCredentials(),
          ),
          LoginCheckAccountStateFailure(
            credentials: createCredentials(),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LoginCheckAccountStateFailure(
            credentials: createCredentials(),
          ).props,
          equals(<Object?>[
            createCredentials(), // credentials
          ]),
        );
      });
    });
  });
}

// ignore_for_file: inference_failure_on_collection_literal

import 'package:account_repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_qr_code/login_qr_code.dart';

void main() {
  group('LoginQrCodeBloc', () {
    LoginQrCodeBloc buildBloc() {
      return LoginQrCodeBloc();
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const LoginQrCodeState()),
        );
      });
    });

    group('LoginQrCodeScanned', () {
      blocTest<LoginQrCodeBloc, LoginQrCodeState>(
        'emits new state with credentials for valid qr code',
        build: buildBloc,
        act: (bloc) => bloc
            .add(const LoginQrCodeScanned('nc://login/user:JohnDoe&password:super_secret&server:https://example.com')),
        expect: () => [
          const LoginQrCodeState(),
          LoginQrCodeState(
            credentials: Credentials((b) {
              b
                ..serverURL = Uri.https('example.com')
                ..username = 'JohnDoe'
                ..password = 'super_secret';
            }),
          ),
        ],
      );

      blocTest<LoginQrCodeBloc, LoginQrCodeState>(
        'emits valid new state for null qr code',
        build: buildBloc,
        act: (bloc) => bloc.add(const LoginQrCodeScanned(null)),
        expect: () => const [
          LoginQrCodeState(),
        ],
      );

      blocTest<LoginQrCodeBloc, LoginQrCodeState>(
        'emits invalid new state for invalid qr code',
        build: buildBloc,
        act: (bloc) => bloc.add(const LoginQrCodeScanned('invalid')),
        expect: () => const [
          LoginQrCodeState(),
          LoginQrCodeState(invalid: true),
        ],
      );

      blocTest<LoginQrCodeBloc, LoginQrCodeState>(
        'clears invalid state on the next scan',
        build: buildBloc,
        act: (bloc) => bloc.add(const LoginQrCodeScanned(null)),
        seed: () => const LoginQrCodeState(invalid: true),
        expect: () => const [
          LoginQrCodeState(),
        ],
      );
    });
  });
}

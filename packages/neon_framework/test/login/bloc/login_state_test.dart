// ignore_for_file: prefer_const_constructors

import 'package:account_repository/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login/login.dart';

void main() {
  final url = Uri.https('serverURL');
  final credentials = createCredentials(
    serverURL: Uri.https('credentials_serverURL'),
  );

  group('LoginState', () {
    group('initial constructor', () {
      test('with url', () {
        expect(
          LoginState.initial(serverURL: url),
          LoginStateCheckServer(serverURL: url),
        );
      });

      test('with credentials', () {
        expect(
          LoginState.initial(credentials: credentials),
          LoginStateCheckServer(serverURL: credentials.serverURL, credentials: credentials),
        );
      });

      test('with credentials and url', () {
        expect(
          LoginState.initial(serverURL: url, credentials: credentials),
          LoginStateCheckServer(serverURL: credentials.serverURL, credentials: credentials),
        );
      });

      test('without credentials or url', () {
        expect(
          LoginState.initial(),
          LoginStateInitial(),
        );
      });
    });

    group('LoginStateInitial', () {
      test('supports value comparison', () {
        expect(
          LoginStateInitial(),
          LoginStateInitial(),
        );
      });
    });
    group('LoginStateScanQrCode', () {
      test('supports value comparison', () {
        expect(
          LoginStateScanQrCode(),
          LoginStateScanQrCode(),
        );
      });
    });
    group('LoginStateCheckServer', () {
      test('supports value comparison', () {
        expect(
          LoginStateCheckServer(serverURL: url, credentials: credentials),
          LoginStateCheckServer(serverURL: url, credentials: credentials),
        );
      });
    });
    group('LoginStateFlowV2', () {
      test('supports value comparison', () {
        expect(
          LoginStateFlowV2(serverURL: url),
          LoginStateFlowV2(serverURL: url),
        );
      });
    });
    group('LoginStateCheckAccount', () {
      test('supports value comparison', () {
        expect(
          LoginStateCheckAccount(credentials: credentials),
          LoginStateCheckAccount(credentials: credentials),
        );
      });
    });
    group('LoginStateDone', () {
      test('supports value comparison', () {
        expect(
          LoginStateDone(),
          LoginStateDone(),
        );
      });
    });
  });
}

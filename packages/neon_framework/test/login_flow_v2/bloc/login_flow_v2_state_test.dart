import 'package:account_repository/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';

void main() {
  group('LoginFlowV2State', () {
    group('LoginFlowV2StateInitial', () {
      test('supports value comparison', () {
        expect(
          LoginFlowV2StateInitial(
            serverURL: Uri.https('serverURL'),
          ),
          LoginFlowV2StateInitial(
            serverURL: Uri.https('serverURL'),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LoginFlowV2StateInitial(
            serverURL: Uri.https('serverURL'),
          ).props,
          equals(<Object?>[
            Uri.https('serverURL'), // serverURL
          ]),
        );
      });
    });

    group('LoginFlowV2StatePolling', () {
      test('supports value comparison', () {
        expect(
          LoginFlowV2StatePolling(
            serverURL: Uri.https('serverURL'),
            loginEndpoint: Uri.https('loginEndpoint'),
            token: 'token',
          ),
          LoginFlowV2StatePolling(
            serverURL: Uri.https('serverURL'),
            loginEndpoint: Uri.https('loginEndpoint'),
            token: 'token',
          ),
        );
      });

      test('props are correct', () {
        expect(
          LoginFlowV2StatePolling(
            serverURL: Uri.https('serverURL'),
            loginEndpoint: Uri.https('loginEndpoint'),
            token: 'token',
          ).props,
          equals(<Object?>[
            Uri.https('serverURL'), // serverURL
            Uri.https('loginEndpoint'), // loginEndpoint
            'token', // token
          ]),
        );
      });
    });

    group('LoginFlowV2StatePolling', () {
      test('supports value comparison', () {
        expect(
          LoginFlowV2StateSuccess(
            serverURL: Uri.https('serverURL'),
            credentials: createCredentials(),
          ),
          LoginFlowV2StateSuccess(
            serverURL: Uri.https('serverURL'),
            credentials: createCredentials(),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LoginFlowV2StateSuccess(
            serverURL: Uri.https('serverURL'),
            credentials: createCredentials(),
          ).props,
          equals(<Object?>[
            Uri.https('serverURL'), // serverURL
            createCredentials(), // credentials
          ]),
        );
      });
    });
  });
}

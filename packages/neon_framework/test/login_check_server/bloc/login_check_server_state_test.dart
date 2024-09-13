// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';

void main() {
  group('LoginCheckServerState', () {
    LoginCheckServerState createSubject({
      Uri? serverURL,
      ServerVersionState serverVersionState = const ServerVersionStateLoading(),
      MaintenanceModeState maintenanceModeState = const MaintenanceModeStateLoading(),
    }) {
      return LoginCheckServerState(
        serverURL: serverURL ?? Uri.https('serverURL'),
        serverVersionState: serverVersionState,
        maintenanceModeState: maintenanceModeState,
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
        createSubject().props,
        equals(<Object?>[
          Uri.https('serverURL'), // serverURL
          ServerVersionStateLoading(), // serverVersionState
          MaintenanceModeStateLoading(), // maintenanceModeState
        ]),
      );
    });

    test('isSuccess returns true when a serverVersionState and maintenanceMode are successful', () {
      expect(
        createSubject(
          serverVersionState: const ServerVersionStateSuccess(
            serverVersion: '28.0.0',
          ),
          maintenanceModeState: const MaintenanceModeStateSuccess(),
        ).isSuccess,
        isTrue,
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
            serverVersionState: null,
            maintenanceModeState: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            serverVersionState: ServerVersionStateCanceled(),
            maintenanceModeState: MaintenanceModeStateCanceled(),
          ),
          equals(
            createSubject(
              serverVersionState: ServerVersionStateCanceled(),
              maintenanceModeState: MaintenanceModeStateCanceled(),
            ),
          ),
        );
      });
    });
  });

  group('ServerVersionState', () {
    group('ServerVersionStateLoading', () {
      test('supports value comparison', () {
        expect(
          ServerVersionStateLoading(),
          ServerVersionStateLoading(),
        );
      });

      test('props are correct', () {
        expect(
          ServerVersionStateLoading().props,
          equals(<Object?>[]),
        );
      });
    });

    group('ServerVersionStateSuccess', () {
      test('supports value comparison', () {
        expect(
          ServerVersionStateSuccess(
            serverVersion: 'serverVersion',
          ),
          ServerVersionStateSuccess(
            serverVersion: 'serverVersion',
          ),
        );
      });

      test('props are correct', () {
        expect(
          ServerVersionStateSuccess(
            serverVersion: 'serverVersion',
          ).props,
          equals(<Object?>[
            'serverVersion', // serverVersion
          ]),
        );
      });
    });

    group('ServerVersionStateFailure', () {
      test('supports value comparison', () {
        expect(
          ServerVersionStateFailure(
            serverVersion: 'serverVersion',
          ),
          ServerVersionStateFailure(
            serverVersion: 'serverVersion',
          ),
        );
      });

      test('props are correct', () {
        expect(
          ServerVersionStateFailure(
            serverVersion: 'serverVersion',
          ).props,
          equals(<Object?>[
            'serverVersion', // serverVersion
          ]),
        );
      });
    });

    group('ServerVersionStateCanceled', () {
      test('supports value comparison', () {
        expect(
          ServerVersionStateCanceled(),
          ServerVersionStateCanceled(),
        );
      });

      test('props are correct', () {
        expect(
          ServerVersionStateCanceled().props,
          equals(<Object?>[]),
        );
      });
    });
  });

  group('MaintenanceModeState', () {
    group('MaintenanceModeStateLoading', () {
      test('supports value comparison', () {
        expect(
          MaintenanceModeStateLoading(),
          MaintenanceModeStateLoading(),
        );
      });

      test('props are correct', () {
        expect(
          MaintenanceModeStateLoading().props,
          equals(<Object?>[]),
        );
      });
    });

    group('MaintenanceModeStateSuccess', () {
      test('supports value comparison', () {
        expect(
          MaintenanceModeStateSuccess(),
          MaintenanceModeStateSuccess(),
        );
      });

      test('props are correct', () {
        expect(
          MaintenanceModeStateSuccess().props,
          equals(<Object?>[]),
        );
      });
    });

    group('MaintenanceModeStateFailure', () {
      test('supports value comparison', () {
        expect(
          MaintenanceModeStateFailure(),
          MaintenanceModeStateFailure(),
        );
      });

      test('props are correct', () {
        expect(
          MaintenanceModeStateFailure().props,
          equals(<Object?>[]),
        );
      });
    });

    group('MaintenanceModeStateCanceled', () {
      test('supports value comparison', () {
        expect(
          MaintenanceModeStateCanceled(),
          MaintenanceModeStateCanceled(),
        );
      });

      test('props are correct', () {
        expect(
          MaintenanceModeStateCanceled().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}

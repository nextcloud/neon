import 'package:account_repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:version/version.dart';

class _FakeUri extends Fake implements Uri {}

class _MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  group('LoginCheckServerBloc', () {
    late AccountRepository accountRepository;

    setUpAll(() {
      registerFallbackValue(_FakeUri());
    });

    setUp(() {
      accountRepository = _MockAccountRepository();
    });

    final serverURL = Uri.https('serverURL');
    core.Status buildStatus({
      bool maintenance = false,
      Version? version,
    }) {
      version ??= core.minVersion;

      return core.Status((b) {
        b
          ..installed = true
          ..maintenance = maintenance
          ..needsDbUpgrade = false
          ..version = version.toString()
          ..versionstring = version.toString()
          ..edition = 'edition'
          ..productname = 'productname'
          ..extendedSupport = false;
      });
    }

    LoginCheckServerBloc buildBloc() {
      return LoginCheckServerBloc(
        serverURL: serverURL,
        accountRepository: accountRepository,
      );
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(LoginCheckServerState(serverURL: serverURL)),
        );
      });
    });

    group('LoginCheckServer', () {
      blocTest<LoginCheckServerBloc, LoginCheckServerState>(
        'emits new state with loading and success validations',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.getServerStatus(any())).thenAnswer(
            (_) async => buildStatus(),
          );
        },
        act: (bloc) => bloc.add(const LoginCheckServer()),
        expect: () => [
          LoginCheckServerState(serverURL: serverURL),
          LoginCheckServerState(
            serverURL: serverURL,
            serverVersionState: ServerVersionStateSuccess(
              serverVersion: core.minVersion.toString(),
            ),
            maintenanceModeState: const MaintenanceModeStateSuccess(),
          ),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.getServerStatus(serverURL)).called(1);
        },
      );

      blocTest<LoginCheckServerBloc, LoginCheckServerState>(
        'emits new state with failure state when unsupported',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.getServerStatus(any())).thenAnswer(
            (_) async => buildStatus(
              maintenance: true,
              version: Version(15, 0, 0),
            ),
          );
        },
        act: (bloc) => bloc.add(const LoginCheckServer()),
        expect: () => [
          LoginCheckServerState(serverURL: serverURL),
          LoginCheckServerState(
            serverURL: serverURL,
            serverVersionState: const ServerVersionStateFailure(
              serverVersion: '15.0.0',
            ),
            maintenanceModeState: const MaintenanceModeStateFailure(),
          ),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.getServerStatus(serverURL)).called(1);
        },
      );

      blocTest<LoginCheckServerBloc, LoginCheckServerState>(
        'emits new state with canceled state on fetch failure',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.getServerStatus(any())).thenThrow(FetchStatusFailure(serverURL));
        },
        act: (bloc) => bloc.add(const LoginCheckServer()),
        expect: () => [
          LoginCheckServerState(serverURL: serverURL),
          LoginCheckServerState(
            serverURL: serverURL,
            serverVersionState: const ServerVersionStateCanceled(),
            maintenanceModeState: const MaintenanceModeStateCanceled(),
          ),
        ],
        errors: () => <Matcher>[
          equals(serverURL),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.getServerStatus(serverURL)).called(1);
        },
      );
    });
  });
}

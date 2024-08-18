// ignore_for_file: inference_failure_on_collection_literal

import 'package:account_repository/account_repository.dart';
import 'package:account_repository/testing.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/login/login.dart';

class _FakeAccount extends Fake implements Account {}

class _MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  group('LoginBloc', () {
    late AccountRepository accountRepository;

    setUpAll(() {
      registerFallbackValue(_FakeAccount());
    });

    setUp(() {
      accountRepository = _MockAccountRepository();
    });

    final serverURL = Uri.https('serverURL');
    final credentials = createCredentials(
      serverURL: Uri.https('credentials_serverURL'),
    );
    final account = createAccount(
      credentials: credentials,
    );

    LoginBloc buildBloc() {
      return LoginBloc(
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
          equals(const LoginStateInitial()),
        );
      });
    });

    group('LoginUseQRCode', () {
      blocTest<LoginBloc, LoginState>(
        'emits new state with LoginStateScanQrCode',
        build: buildBloc,
        act: (bloc) => bloc.add(const LoginUseQRCode()),
        expect: () => const [
          LoginStateScanQrCode(),
        ],
      );
    });

    group('LoginUrlEntered', () {
      blocTest<LoginBloc, LoginState>(
        'emits new state with serverURL',
        build: buildBloc,
        act: (bloc) => bloc.add(LoginUrlEntered(serverURL)),
        expect: () => [
          LoginStateCheckServer(serverURL: serverURL),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits new state with serverURL and credentials',
        build: buildBloc,
        act: (bloc) => bloc.add(LoginUrlEntered(credentials.serverURL, credentials)),
        expect: () => [
          LoginStateCheckServer(serverURL: credentials.serverURL, credentials: credentials),
        ],
      );
    });

    group('LoginServerChecked', () {
      blocTest<LoginBloc, LoginState>(
        'emits no new state when not in LoginStateCheckServer',
        build: buildBloc,
        act: (bloc) => bloc.add(const LoginServerChecked()),
        expect: () => const [],
      );

      blocTest<LoginBloc, LoginState>(
        'emits new LoginStateCheckAccount when credentials are known',
        build: buildBloc,
        seed: () => LoginStateCheckServer(serverURL: credentials.serverURL, credentials: credentials),
        act: (bloc) => bloc.add(const LoginServerChecked()),
        expect: () => [
          LoginStateCheckAccount(credentials: credentials),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits new LoginStateCheckServer when credentials are not known',
        build: buildBloc,
        seed: () => LoginStateCheckServer(serverURL: serverURL),
        act: (bloc) => bloc.add(const LoginServerChecked()),
        expect: () => [
          LoginStateFlowV2(serverURL: serverURL),
        ],
      );
    });

    group('LoginCredentialsEntered', () {
      blocTest<LoginBloc, LoginState>(
        'emits LoginStateCheckAccount',
        build: buildBloc,
        act: (bloc) => bloc.add(LoginCredentialsEntered(credentials)),
        expect: () => [
          LoginStateCheckAccount(credentials: credentials),
        ],
      );
    });

    group('LoginAccountChecked', () {
      blocTest<LoginBloc, LoginState>(
        'emits LoginStateDone and logs account in',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.logIn(any())).thenAnswer((_) async {});
        },
        act: (bloc) => bloc.add(LoginAccountChecked(account)),
        expect: () => const [
          LoginStateDone(),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.logIn(any(that: equals(account)))).called(1);
        },
      );
    });
  });
}

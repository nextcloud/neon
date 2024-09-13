// ignore_for_file: inference_failure_on_collection_literal

import 'package:account_repository/account_repository.dart';
import 'package:account_repository/testing.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _FakeUri extends Fake implements Uri {}

class _MockAccountRepository extends Mock implements AccountRepository {}

class _MockUrlLauncher extends Mock with MockPlatformInterfaceMixin implements UrlLauncherPlatform {}

void main() {
  group('LoginFlowV2Bloc', () {
    late AccountRepository accountRepository;

    setUpAll(() {
      registerFallbackValue(_FakeUri());

      registerFallbackValue(const LaunchOptions());
    });

    setUp(() async {
      UrlLauncherPlatform.instance = _MockUrlLauncher();
      when(() => UrlLauncherPlatform.instance.launchUrl(any(), any())).thenAnswer((_) async => true);
      accountRepository = _MockAccountRepository();
    });

    final serverURL = Uri.https('serverURL');
    final credentials = createCredentials(
      serverURL: Uri.https('credentials_serverURL'),
    );

    LoginFlowV2Bloc buildBloc() {
      return LoginFlowV2Bloc(
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
          equals(LoginFlowV2StateInitial(serverURL: serverURL)),
        );
      });
    });

    group('LoginFlowV2Init', () {
      blocTest<LoginFlowV2Bloc, LoginFlowV2State>(
        'emits new state with loginUrl, opens the url and polls endpoint',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.loginFlowInit(any())).thenAnswer(
            (_) async => (Uri.https('login_uri'), 'token'),
          );
          when(() => accountRepository.loginFlowPoll(any(), any())).thenAnswer(
            (_) async => credentials,
          );
        },
        act: (bloc) => bloc.add(const LoginFlowV2Init()),
        wait: const Duration(seconds: 2),
        expect: () => [
          LoginFlowV2StatePolling(
            serverURL: serverURL,
            loginEndpoint: Uri.https('login_uri'),
            token: 'token',
          ),
          LoginFlowV2StateSuccess(
            serverURL: serverURL,
            credentials: credentials,
          ),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.loginFlowInit(serverURL)).called(1);
          verify(
            () => UrlLauncherPlatform.instance.launchUrl('https://login_uri', any()),
          ).called(1);
          verify(() => accountRepository.loginFlowPoll(serverURL, 'token')).called(1);
        },
      );

      blocTest<LoginFlowV2Bloc, LoginFlowV2State>(
        'adds unwrapped InitLoginFailure errors to bloc',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.loginFlowInit(any())).thenThrow(
            InitLoginFailure(serverURL),
          );
          when(() => accountRepository.loginFlowPoll(any(), any())).thenAnswer(
            (_) async => credentials,
          );
        },
        act: (bloc) => bloc.add(const LoginFlowV2Init()),
        expect: () => [],
        errors: () => <Matcher>[
          equals(serverURL),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.loginFlowInit(serverURL)).called(1);
          verifyNever(
            () => UrlLauncherPlatform.instance.launchUrl('https://login_uri', any()),
          );
          verifyNever(() => accountRepository.loginFlowPoll(any(), any()));
        },
      );

      blocTest<LoginFlowV2Bloc, LoginFlowV2State>(
        'adds unwrapped PollLoginFailure errors to bloc',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.loginFlowInit(any())).thenAnswer(
            (_) async => (Uri.https('login_uri'), 'token'),
          );
          when(() => accountRepository.loginFlowPoll(any(), any())).thenThrow(
            PollLoginFailure(serverURL),
          );
        },
        act: (bloc) => bloc.add(const LoginFlowV2Init()),
        wait: const Duration(seconds: 2),
        expect: () => [
          LoginFlowV2StatePolling(
            serverURL: serverURL,
            loginEndpoint: Uri.https('login_uri'),
            token: 'token',
          ),
          LoginFlowV2StateInitial(
            serverURL: serverURL,
          ),
        ],
        errors: () => <Matcher>[
          equals(serverURL),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.loginFlowInit(serverURL)).called(1);
          verify(
            () => UrlLauncherPlatform.instance.launchUrl('https://login_uri', any()),
          ).called(1);
          verify(() => accountRepository.loginFlowPoll(serverURL, 'token')).called(1);
        },
      );
    });

    group('LoginFlowV2OpenPage', () {
      blocTest<LoginFlowV2Bloc, LoginFlowV2State>(
        'launches login uri',
        build: buildBloc,
        act: (bloc) => bloc.add(const LoginFlowV2OpenPage()),
        seed: () => LoginFlowV2StatePolling(
          serverURL: serverURL,
          loginEndpoint: Uri.https('login_uri'),
          token: 'token',
        ),
        expect: () => [],
        verify: (bloc) async {
          verify(
            () => UrlLauncherPlatform.instance.launchUrl('https://login_uri', any()),
          ).called(1);
        },
      );
    });
  });
}

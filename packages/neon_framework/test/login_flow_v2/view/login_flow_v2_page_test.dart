import 'package:account_repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/login/bloc/login_bloc.dart';
import 'package:neon_framework/src/login_flow_v2/login_flow_v2.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _MockAccountRepository extends Mock implements AccountRepository {}

class _MockLoginFlowV2Bloc extends MockBloc<LoginFlowV2Event, LoginFlowV2State> implements LoginFlowV2Bloc {}

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState> implements LoginBloc {}

class _MockUrlLauncher extends Mock with MockPlatformInterfaceMixin implements UrlLauncherPlatform {}

class _FakeUri extends Fake implements Uri {}

void main() {
  final serverURL = Uri.https('serverURL');
  final credentials = createCredentials(
    serverURL: Uri.https('credentials_serverURL'),
  );

  group('LoginFLowV2Page', () {
    late AccountRepository accountRepository;

    setUpAll(() async {
      registerFallbackValue(_FakeUri());

      registerFallbackValue(const LaunchOptions());

      UrlLauncherPlatform.instance = _MockUrlLauncher();
      when(() => UrlLauncherPlatform.instance.launchUrl(any(), any())).thenAnswer((_) async => true);
    });

    setUp(() {
      accountRepository = _MockAccountRepository();
    });

    Widget buildSubject() {
      return TestApp(
        appThemes: const [
          NeonTheme(
            branding: Branding(
              name: 'neon',
              logo: Placeholder(),
            ),
          ),
        ],
        providers: [
          RepositoryProvider<AccountRepository>.value(
            value: accountRepository,
          ),
        ],
        child: LoginFLowV2Page(serverURL: serverURL),
      );
    }

    testWidgets('renders LoginFLowV2View', (tester) async {
      when(() => accountRepository.loginFlowInit(any())).thenAnswer(
        (_) async => (Uri.https('login_uri'), 'token'),
      );

      await tester.pumpWidgetWithAccessibility(buildSubject());

      expect(find.byType(LoginFLowV2View), findsOneWidget);
    });
  });

  group('LoginFLowV2View', () {
    late LoginFlowV2Bloc loginFlowV2Bloc;
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = _MockLoginBloc();
      loginFlowV2Bloc = _MockLoginFlowV2Bloc();
      when(() => loginFlowV2Bloc.state).thenReturn(
        LoginFlowV2StateInitial(serverURL: serverURL),
      );
    });

    Widget buildSubject() {
      return TestApp(
        providers: [
          RepositoryProvider<LoginFlowV2Bloc>.value(
            value: loginFlowV2Bloc,
          ),
          BlocProvider<LoginBloc>.value(value: loginBloc),
        ],
        child: const LoginFLowV2View(),
      );
    }

    testWidgets(
      'LoginCredentialsEntered to LoginBloc when credentials are known',
      (tester) async {
        whenListen<LoginFlowV2State>(
          loginFlowV2Bloc,
          Stream.fromIterable([
            LoginFlowV2StateInitial(serverURL: serverURL),
            LoginFlowV2StateSuccess(
              serverURL: serverURL,
              credentials: credentials,
            ),
          ]),
        );
        await tester.pumpWidgetWithAccessibility(buildSubject());

        verify(() => loginBloc.add(LoginCredentialsEntered(credentials))).called(1);
      },
    );

    group('LoginButton', () {
      testWidgets(
        'is not added with null `loginEndpoint`',
        (tester) async {
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(find.byType(ElevatedButton), findsNothing);
        },
      );

      testWidgets(
        'adds LoginFlowV2OpenPage event when pressed',
        (tester) async {
          when(() => loginFlowV2Bloc.state).thenReturn(
            LoginFlowV2StatePolling(
              serverURL: serverURL,
              loginEndpoint: Uri(),
              token: 'token',
            ),
          );

          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(find.byType(ElevatedButton), findsOneWidget);
          await tester.tap(find.byType(ElevatedButton));
          verify(() => loginFlowV2Bloc.add(const LoginFlowV2OpenPage())).called(1);
        },
      );
    });
  });
}

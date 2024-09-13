import 'package:account_repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/login/login.dart';
import 'package:neon_framework/src/login_check_server/login_check_server.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:nextcloud/core.dart' as core;

class _MockAccountRepository extends Mock implements AccountRepository {}

class _MockLoginCheckServerBloc extends MockBloc<LoginCheckServerEvent, LoginCheckServerState>
    implements LoginCheckServerBloc {}

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState> implements LoginBloc {}

class _FakeUri extends Fake implements Uri {}

void main() {
  final serverURL = Uri.https('serverURL');
  final status = core.Status((b) {
    b
      ..installed = true
      ..maintenance = false
      ..needsDbUpgrade = false
      ..version = core.minVersion.toString()
      ..versionstring = core.minVersion.toString()
      ..edition = 'edition'
      ..productname = 'productname'
      ..extendedSupport = false;
  });

  group('LoginCheckServerPage', () {
    late AccountRepository accountRepository;

    setUpAll(() {
      registerFallbackValue(_FakeUri());
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
        child: LoginCheckServerPage(serverURL: serverURL),
      );
    }

    testWidgets('renders LoginCheckServerView', (tester) async {
      when(() => accountRepository.getServerStatus(any())).thenAnswer((_) async => status);
      await tester.pumpWidgetWithAccessibility(buildSubject());

      expect(find.byType(LoginCheckServerView), findsOneWidget);
    });
  });

  group('LoginCheckServerView', () {
    late LoginCheckServerBloc loginCheckServerBloc;
    late LoginBloc loginBloc;

    setUp(() {
      loginCheckServerBloc = _MockLoginCheckServerBloc();
      when(() => loginCheckServerBloc.state).thenReturn(
        LoginCheckServerState(serverURL: serverURL),
      );

      loginBloc = _MockLoginBloc();
    });

    Widget buildSubject() {
      return TestApp(
        providers: [
          RepositoryProvider<LoginCheckServerBloc>.value(
            value: loginCheckServerBloc,
          ),
          BlocProvider<LoginBloc>.value(value: loginBloc),
        ],
        child: const LoginCheckServerView(),
      );
    }

    group('version NeonValidationTile', () {
      testWidgets(
        'is rendered with loading state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              maintenanceModeState: const MaintenanceModeStateCanceled(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byType(CircularProgressIndicator),
            findsOneWidget,
          );
          expect(
            find.text(NeonLocalizationsEn().loginServerVersion),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'is rendered with success state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              serverVersionState: const ServerVersionStateSuccess(
                serverVersion: '28.0.0',
              ),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byIcon(AdaptiveIcons.check_circle),
            findsOne,
          );
          expect(
            find.text(NeonLocalizationsEn().loginServerVersionSupported('28.0.0')),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'is rendered with failure state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              serverVersionState: const ServerVersionStateFailure(
                serverVersion: '15.0.0',
              ),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byIcon(AdaptiveIcons.error_outline),
            findsOne,
          );
          expect(
            find.text(NeonLocalizationsEn().loginServerVersionUnsupported('15.0.0')),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'is rendered with canceled state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              serverVersionState: const ServerVersionStateCanceled(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byIcon(AdaptiveIcons.cancel_outlined),
            findsOne,
          );
          expect(
            find.text(NeonLocalizationsEn().loginServerVersion),
            findsOneWidget,
          );
        },
      );
    });

    group('server status NeonValidationTile', () {
      testWidgets(
        'is rendered with loading state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              serverVersionState: const ServerVersionStateCanceled(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byType(CircularProgressIndicator),
            findsOneWidget,
          );
          expect(
            find.text(NeonLocalizationsEn().loginMaintenanceMode),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'is rendered with success state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              maintenanceModeState: const MaintenanceModeStateSuccess(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byIcon(AdaptiveIcons.check_circle),
            findsOne,
          );
          expect(
            find.text(NeonLocalizationsEn().loginMaintenanceModeDisabled),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'is rendered with failed state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              maintenanceModeState: const MaintenanceModeStateFailure(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byIcon(AdaptiveIcons.error_outline),
            findsOne,
          );
          expect(
            find.text(NeonLocalizationsEn().loginMaintenanceModeEnabled),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'is rendered with canceled state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              maintenanceModeState: const MaintenanceModeStateCanceled(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          expect(
            find.byIcon(AdaptiveIcons.cancel_outlined),
            findsOne,
          );
          expect(
            find.text(NeonLocalizationsEn().loginMaintenanceMode),
            findsOneWidget,
          );
        },
      );
    });

    group('Action button', () {
      testWidgets(
        'is retry for non success state',
        (tester) async {
          await tester.pumpWidgetWithAccessibility(buildSubject());
          await tester.tap(find.text(NeonLocalizationsEn().actionRetry));
          verify(() => loginCheckServerBloc.add(const LoginCheckServer())).called(1);
        },
      );

      testWidgets(
        'is continue for success state',
        (tester) async {
          when(() => loginCheckServerBloc.state).thenReturn(
            LoginCheckServerState(
              serverURL: serverURL,
              serverVersionState: const ServerVersionStateSuccess(
                serverVersion: '28.0.0',
              ),
              maintenanceModeState: const MaintenanceModeStateSuccess(),
            ),
          );
          await tester.pumpWidgetWithAccessibility(buildSubject());
          await tester.tap(find.text(NeonLocalizationsEn().actionContinue));
          verify(() => loginBloc.add(const LoginServerChecked())).called(1);
        },
      );
    });
  });
}

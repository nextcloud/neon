import 'package:account_repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/login/login.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/widgets/nextcloud_logo.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';

class _MockAccountRepository extends Mock implements AccountRepository {}

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState> implements LoginBloc {}

void main() {
  setUp(() {
    NeonPlatform.instance = MockNeonPlatform();
    when(() => NeonPlatform.instance.canUseCamera).thenReturn(false);
  });

  group('LoginPage', () {
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
          RepositoryProvider<AccountRepository>.value(value: _MockAccountRepository()),
        ],
        child: LoginPage(),
      );
    }

    testWidgets('renders LoginView', (tester) async {
      await tester.pumpWidgetWithAccessibility(buildSubject());

      expect(find.byType(LoginView), findsOneWidget);
    });
  });

  group('LoginView', () {
    late MockGoRouter router;
    late LoginBloc loginBloc;
    late Branding branding;

    setUp(() {
      branding = const Branding(
        name: 'neon-branding',
        logo: Placeholder(key: Key('branding')),
      );

      router = MockGoRouter();
      when(() => router.go(any())).thenAnswer((_) async {});

      loginBloc = _MockLoginBloc();
      when(() => loginBloc.state).thenReturn(
        const LoginStateInitial(),
      );
    });

    Widget buildSubject() {
      return TestApp(
        router: router,
        appThemes: [
          NeonTheme(branding: branding),
        ],
        providers: [
          RepositoryProvider<LoginBloc>.value(
            value: loginBloc,
          ),
        ],
        child: const LoginView(),
      );
    }

    testWidgets(
      'pops when LoginStateDone is emitted',
      (tester) async {
        whenListen<LoginState>(
          loginBloc,
          Stream.fromIterable(const [
            LoginStateInitial(),
            LoginStateDone(),
          ]),
        );
        await tester.pumpWidgetWithAccessibility(buildSubject());

        verify(() => router.go('/')).called(1);
      },
    );

    group('login Qr button', () {
      testWidgets('is not shown when un supported', (tester) async {
        await tester.pumpWidgetWithAccessibility(buildSubject());
        expect(find.byIcon(AdaptiveIcons.qr_code_scanner), findsNothing);
      });

      testWidgets('is shown when supported', (tester) async {
        when(() => NeonPlatform.instance.canUseCamera).thenReturn(true);
        await tester.pumpWidgetWithAccessibility(buildSubject());
        expect(find.byIcon(AdaptiveIcons.qr_code_scanner), findsOne);
      });
    });

    group('Nextcloud logo', () {
      testWidgets(
        'is rendered',
        (tester) async {
          await tester.pumpWidgetWithAccessibility(buildSubject());

          expect(find.byType(NextcloudLogo), findsOneWidget);
        },
      );

      testWidgets(
        'is not rendered when disabled in branding',
        (tester) async {
          branding = const Branding(
            name: 'neon-branding',
            showLoginWithNextcloud: false,
            logo: Placeholder(key: Key('branding')),
          );

          await tester.pumpWidgetWithAccessibility(buildSubject());

          expect(find.byType(NextcloudLogo), findsNothing);
        },
      );
    });

    group('Branding', () {
      testWidgets(
        'is rendered',
        (tester) async {
          await tester.pumpWidgetWithAccessibility(buildSubject());

          expect(find.byKey(const Key('branding')), findsOneWidget);
          expect(find.text('neon-branding'), findsOneWidget);
        },
      );
    });

    testWidgets(
      'adds LoginUrlEntered to LoginBloc when valid url entered',
      (tester) async {
        await tester.pumpWidgetWithAccessibility(buildSubject());

        await tester.enterText(find.byType(TextFormField), 'invalid');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verifyNever(() => loginBloc.add(LoginUrlEntered(Uri())));

        await tester.enterText(find.byType(TextFormField), 'https://serverURL');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verify(() => loginBloc.add(LoginUrlEntered(Uri.https('serverURL')))).called(1);
      },
    );
  });
}

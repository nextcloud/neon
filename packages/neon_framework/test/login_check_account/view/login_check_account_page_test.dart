import 'package:account_repository/account_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/login/bloc/login_bloc.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';
import 'package:neon_framework/src/widgets/account_tile.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';

class _MockAccountRepository extends Mock implements AccountRepository {}

class _MockLoginCheckAccountBloc extends MockBloc<LoginCheckAccountEvent, LoginCheckAccountState>
    implements LoginCheckAccountBloc {}

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState> implements LoginBloc {}

class _FakeCredentials extends Fake implements Credentials {}

void main() {
  final credentials = createCredentials(
    serverURL: Uri.https('credentials_serverURL'),
  );
  final account = createAccount(
    credentials: credentials,
  );

  setUpAll(() {
    registerFallbackValue(_FakeCredentials());
  });

  group('LoginCheckAccountPage', () {
    late AccountRepository accountRepository;

    setUp(() {
      accountRepository = _MockAccountRepository();
    });

    Widget buildSubject() {
      return TestApp(
        providers: [
          RepositoryProvider<AccountRepository>.value(
            value: accountRepository,
          ),
        ],
        child: LoginCheckAccountPage(credentials: credentials),
      );
    }

    testWidgets('renders LoginCheckAccountView', (tester) async {
      when(() => accountRepository.getAccount(any())).thenAnswer((_) async => account);
      await tester.pumpWidgetWithAccessibility(buildSubject());

      expect(find.byType(LoginCheckAccountView), findsOneWidget);
    });
  });

  group('LoginCheckAccountView', () {
    late LoginCheckAccountBloc loginCheckAccountBloc;
    late LoginBloc loginBloc;

    setUp(() {
      loginCheckAccountBloc = _MockLoginCheckAccountBloc();
      when(() => loginCheckAccountBloc.state).thenReturn(
        LoginCheckAccountStateLoading(credentials: credentials),
      );

      loginBloc = _MockLoginBloc();
    });

    Widget buildSubject() {
      return TestApp(
        providers: [
          RepositoryProvider<LoginCheckAccountBloc>.value(
            value: loginCheckAccountBloc,
          ),
          BlocProvider<LoginBloc>.value(value: loginBloc),
        ],
        child: const LoginCheckAccountView(),
      );
    }

    group(
      'version NeonValidationTile',
      () {
        testWidgets(
          'is rendered with state',
          (tester) async {
            await tester.pumpWidgetWithAccessibility(buildSubject());
            expect(
              find.byType(CircularProgressIndicator),
              findsOneWidget,
            );
            expect(
              find.text(NeonLocalizationsEn().loginCheckingAccount),
              findsOneWidget,
            );

            when(() => loginCheckAccountBloc.state).thenReturn(
              LoginCheckAccountStateSuccess(
                credentials: credentials,
                account: account,
              ),
            );
            await tester.pumpWidgetWithAccessibility(buildSubject());
            expect(
              find.byType(NeonAccountTile),
              findsOne,
            );

            when(() => loginCheckAccountBloc.state).thenReturn(
              LoginCheckAccountStateFailure(
                credentials: credentials,
              ),
            );
            await tester.pumpWidgetWithAccessibility(buildSubject());
            expect(
              find.byIcon(AdaptiveIcons.error_outline),
              findsOne,
            );
            expect(
              find.text(NeonLocalizationsEn().loginCheckingAccount),
              findsOneWidget,
            );
          },
        );
      },
      skip: 'The AccountListTile requires the UserDetailsBloc and therefore the AccountsBloc. '
          'Mocking them is out of scope for now.',
    );

    group(
      'Action button',
      () {
        testWidgets(
          'is continue for success and retry for failure',
          (tester) async {
            await tester.pumpWidgetWithAccessibility(buildSubject());
            await tester.tap(find.text(NeonLocalizationsEn().actionRetry));
            verify(() => loginCheckAccountBloc.add(const LoginCheckAccount())).called(1);

            when(() => loginCheckAccountBloc.state).thenReturn(
              LoginCheckAccountStateSuccess(
                credentials: credentials,
                account: account,
              ),
            );
            await tester.pumpWidgetWithAccessibility(buildSubject());
            await tester.tap(find.text(NeonLocalizationsEn().actionContinue));
            verify(() => loginBloc.add(LoginAccountChecked(account))).called(1);
          },
        );
      },
      skip: 'The AccountListTile requires the UserDetailsBloc and therefore the AccountsBloc. '
          'Mocking them is out of scope for now.',
    );
  });
}

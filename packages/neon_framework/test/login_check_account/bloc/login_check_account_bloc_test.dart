import 'package:account_repository/account_repository.dart';
import 'package:account_repository/testing.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/login_check_account/login_check_account.dart';

class _FakeCredentials extends Fake implements Credentials {}

class _MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  group('LoginCheckAccountBloc', () {
    late AccountRepository accountRepository;

    setUpAll(() {
      registerFallbackValue(_FakeCredentials());
    });

    setUp(() {
      accountRepository = _MockAccountRepository();
    });

    final credentials = createCredentials(
      serverURL: Uri.https('credentials_serverURL'),
    );
    final account = createAccount(
      credentials: credentials,
    );

    LoginCheckAccountBloc buildBloc() {
      return LoginCheckAccountBloc(
        credentials: credentials,
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
          equals(LoginCheckAccountStateLoading(credentials: credentials)),
        );
      });
    });

    group('LoginCheckAccount', () {
      blocTest<LoginCheckAccountBloc, LoginCheckAccountState>(
        'emits new state with loading and success validations',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.getAccount(any())).thenAnswer(
            (_) async => account,
          );
        },
        act: (bloc) => bloc.add(const LoginCheckAccount()),
        expect: () => [
          LoginCheckAccountStateLoading(credentials: credentials),
          LoginCheckAccountStateSuccess(
            credentials: credentials,
            account: account,
          ),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.getAccount(credentials)).called(1);
        },
      );

      blocTest<LoginCheckAccountBloc, LoginCheckAccountState>(
        'emits new state with canceled state on failure',
        build: buildBloc,
        setUp: () async {
          when(() => accountRepository.getAccount(any())).thenThrow(FetchAccountFailure(credentials));
        },
        act: (bloc) => bloc.add(const LoginCheckAccount()),
        expect: () => [
          LoginCheckAccountStateLoading(credentials: credentials),
          LoginCheckAccountStateFailure(
            credentials: credentials,
          ),
        ],
        errors: () => <Matcher>[
          equals(credentials),
        ],
        verify: (bloc) async {
          verify(() => accountRepository.getAccount(credentials)).called(1);
        },
      );
    });
  });
}

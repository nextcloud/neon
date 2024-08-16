import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/testing.dart';

class _MockAccountRepository extends Mock implements AccountRepository {}

void main() {
  group('redirect', () {
    testWidgets('QR-Code login', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: Container(),
        ),
      );
      final context = tester.element(find.byType(Container));

      final state = MockGoRouterState();
      when(() => state.uri).thenReturn(Uri.parse('nc://login/user:JohnDoe&password:super_secret&server:example.com'));

      expect(
        redirect(context, state),
        Uri(
          path: '/login',
          queryParameters: {'qr-code': 'nc://login/user:JohnDoe&password:super_secret&server:example.com'},
        ).toString(),
      );
    });

    testWidgets('Login', (tester) async {
      final accountRepository = _MockAccountRepository();
      when(() => accountRepository.hasAccounts).thenReturn(false);

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            RepositoryProvider<AccountRepository>.value(value: accountRepository),
          ],
          child: Container(),
        ),
      );
      final context = tester.element(find.byType(Container));

      final state = MockGoRouterState();

      when(() => state.uri).thenReturn(Uri.parse('/test'));
      when(() => state.matchedLocation).thenReturn('/test');
      expect(redirect(context, state), '/login');
    });
  });
}

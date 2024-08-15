import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';

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

      expect(redirect(context, state), '/login/check/server/JohnDoe/super_secret?server-url=example.com');
    });

    testWidgets('Login', (tester) async {
      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.hasAccounts).thenReturn(false);

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: Container(),
        ),
      );
      final context = tester.element(find.byType(Container));

      final state = MockGoRouterState();

      when(() => state.uri).thenReturn(Uri.parse('/test'));
      when(() => state.matchedLocation).thenReturn('/test');
      expect(redirect(context, state), '/login');

      when(() => state.uri).thenReturn(Uri.parse('/login/test'));
      when(() => state.matchedLocation).thenReturn('/login/test');
      expect(redirect(context, state), null);
    });
  });
}

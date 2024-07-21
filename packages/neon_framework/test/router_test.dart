import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data buildCapabilities(
  core.CoreCapabilities? capabilities,
) =>
    core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data(
      (b) => b
        ..version.update(
          (b) => b
            ..major = 0
            ..minor = 0
            ..micro = 0
            ..string = ''
            ..edition = ''
            ..extendedSupport = false,
        )
        ..capabilities = (
          // We need to provide at least one capability because anyOf expects at least one schema to match
          commentsCapabilities: null,
          coreCapabilities: capabilities,
          corePublicCapabilities: null,
          davCapabilities: null,
          dropAccountCapabilities: null,
          filesCapabilities: null,
          filesSharingCapabilities: null,
          filesTrashbinCapabilities: null,
          filesVersionsCapabilities: null,
          notesCapabilities: null,
          notificationsCapabilities: null,
          provisioningApiCapabilities: null,
          sharebymailCapabilities: null,
          spreedCapabilities: null,
          spreedPublicCapabilities: null,
          systemtagsCapabilities: null,
          themingPublicCapabilities: null,
          userStatusCapabilities: null,
          weatherStatusCapabilities: null,
        ),
    );

void main() {
  group('redirect', () {
    testWidgets('Strip index.php', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: Container(),
        ),
      );
      final context = tester.element(find.byType(Container));

      final state = MockGoRouterState();
      when(() => state.uri).thenReturn(Uri(path: '/index.php/test'));

      expect(redirect(context, state), '/test');
    });

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

    testWidgets('Strip account', (tester) async {
      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.hasAccounts).thenReturn(true);

      final account = Account(
        (b) => b
          ..serverURL = Uri.parse('http://example.com')
          ..username = '',
      );

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
            Provider<Account>.value(value: account),
          ],
          child: Container(),
        ),
      );
      final context = tester.element(find.byType(Container));

      final state = MockGoRouterState();

      when(() => state.uri).thenReturn(Uri.parse('http://example.com/test'));
      expect(redirect(context, state), '/test');

      when(() => state.uri).thenReturn(Uri.parse('example.com/test'));
      expect(redirect(context, state), null);
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

  group('onException', () {
    testWidgets('Not found', (tester) async {
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

      final router = MockGoRouter();
      when(() => router.push(any())).thenAnswer((_) => Future.value());

      final state = MockGoRouterState();
      when(() => state.uri).thenReturn(Uri(path: '/test'));

      await onException(context, state, router);
      verify(() => router.push('/not-found/${Uri.encodeComponent('/test')}')).called(1);
    });

    group('Complete account', () {
      late MockUrlLauncher urlLauncher;

      setUpAll(() {
        registerFallbackValue(const LaunchOptions());

        urlLauncher = MockUrlLauncher();
        // ignore: discarded_futures
        when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

        UrlLauncherPlatform.instance = urlLauncher;
      });

      for (final (path, modRewriteWorking, url) in [
        ('/test', true, 'http://example.com/test'),
        ('/test', false, 'http://example.com/index.php/test'),
        ('http://example.org/test', false, 'http://example.org/test'),
      ]) {
        testWidgets('Mod rewrite ${modRewriteWorking ? '' : 'not '}working $path', (tester) async {
          final accountsBloc = MockAccountsBloc();
          when(() => accountsBloc.hasAccounts).thenReturn(true);

          final capabilitiesBloc = MockCapabilitiesBloc();
          when(() => capabilitiesBloc.capabilities).thenAnswer(
            (_) => BehaviorSubject.seeded(
              Result.success(
                buildCapabilities(
                  core.CoreCapabilities(
                    (b) => b.core.update(
                      (b) => b
                        ..pollinterval = 0
                        ..webdavRoot = ''
                        ..referenceApi = false
                        ..referenceRegex = ''
                        ..modRewriteWorking = modRewriteWorking,
                    ),
                  ),
                ),
              ),
            ),
          );

          final account = Account(
            (b) => b
              ..serverURL = Uri.parse('http://example.com')
              ..username = '',
          );

          await tester.pumpWidgetWithAccessibility(
            TestApp(
              providers: [
                NeonProvider<AccountsBloc>.value(value: accountsBloc),
                Provider<Account>.value(value: account),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: Container(),
            ),
          );
          final context = tester.element(find.byType(Container));

          final router = MockGoRouter();

          final state = MockGoRouterState();
          when(() => state.uri).thenReturn(Uri.parse(path));

          await onException(context, state, router);
          verify(() => urlLauncher.launchUrl(url, any())).called(1);
        });
      }
    });
  });
}

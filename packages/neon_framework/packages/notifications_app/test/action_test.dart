import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:notifications_app/src/widgets/action.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import 'testing.dart';

void main() {
  late MockUrlLauncher urlLauncher;
  late Account account;

  setUpAll(() {
    registerFallbackValue(const LaunchOptions());

    urlLauncher = MockUrlLauncher();
    // ignore: discarded_futures
    when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    UrlLauncherPlatform.instance = urlLauncher;
  });

  setUp(() {
    account = MockAccount();
  });

  testWidgets('Primary', (tester) async {
    final action = MockAction();
    when(() => action.label).thenReturn('label');
    when(() => action.primary).thenReturn(true);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NotificationsAction(
          action: action,
        ),
      ),
    );

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/action_primary.png'));
  });

  testWidgets('Secondary', (tester) async {
    final action = MockAction();
    when(() => action.label).thenReturn('label');
    when(() => action.primary).thenReturn(false);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NotificationsAction(
          action: action,
        ),
      ),
    );

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/action_secondary.png'));
  });

  testWidgets('Opens link', (tester) async {
    final action = MockAction();
    when(() => action.label).thenReturn('label');
    when(() => action.primary).thenReturn(true);
    when(() => action.link).thenReturn('/link');

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: NotificationsAction(
          action: action,
        ),
      ),
    );

    await tester.tap(find.byType(NotificationsAction));

    verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
  });
}

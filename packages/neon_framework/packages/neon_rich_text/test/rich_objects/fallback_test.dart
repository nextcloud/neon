import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_rich_text/neon_rich_text.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

void main() {
  late MockUrlLauncher urlLauncher;
  late Account account;

  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(const LaunchOptions());

    urlLauncher = MockUrlLauncher();
    // ignore: discarded_futures
    when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    UrlLauncherPlatform.instance = urlLauncher;
  });

  setUp(() {
    account = MockAccount();
  });

  group('Fallback', () {
    testWidgets('Opens link', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFallback(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.calendarEvent
                ..id = ''
                ..name = 'name'
                ..link = '/link',
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NeonRichObjectFallback));
      verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
    });

    testWidgets('Without icon', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonRichObjectFallback(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.addressbook
                ..id = ''
                ..name = 'name',
            ),
          ),
        ),
      );
      expect(find.byType(NeonUriImage), findsNothing);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(NeonRichObjectFallback),
        matchesGoldenFile('goldens/rich_text_object_fallback_without_icon.png'),
      );
    });

    testWidgets('With icon', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFallback(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.addressbook
                ..id = ''
                ..name = 'name'
                ..iconUrl = '',
            ),
          ),
        ),
      );
      expect(find.byType(NeonUriImage), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(NeonRichObjectFallback),
        matchesGoldenFile('goldens/rich_text_object_fallback_with_icon.png'),
      );
    });
  });
}

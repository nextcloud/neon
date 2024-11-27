import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
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

  testWidgets('Deck card', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: NeonRichObjectDeckCard(
          parameter: core.RichObjectParameter(
            (b) => b
              ..type = core.RichObjectParameter_Type.deckCard
              ..id = ''
              ..name = 'name'
              ..boardname = 'boardname'
              ..stackname = 'stackname'
              ..link = '/link',
          ),
        ),
      ),
    );
    expect(find.text('name'), findsOne);
    expect(find.text('boardname: stackname'), findsOne);
    await expectLater(
      find.byType(NeonRichObjectDeckCard),
      matchesGoldenFile('goldens/rich_text_object_deck_card.png'),
    );

    await tester.tap(find.byType(NeonRichObjectDeckCard));
    verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
  });
}

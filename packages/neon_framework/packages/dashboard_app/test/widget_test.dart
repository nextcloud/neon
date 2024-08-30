import 'package:dashboard_app/l10n/localizations.dart';
import 'package:dashboard_app/src/pages/main.dart';
import 'package:dashboard_app/src/widgets/widget.dart';
import 'package:dashboard_app/src/widgets/widget_button.dart';
import 'package:dashboard_app/src/widgets/widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;
import 'package:provider/provider.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

Widget wrapWidget(Widget child) => TestApp(
      localizationsDelegates: DashboardLocalizations.localizationsDelegates,
      supportedLocales: DashboardLocalizations.supportedLocales,
      providers: [Provider<Account>.value(value: MockAccount())],
      child: child,
    );

void main() {
  late MockUrlLauncher urlLauncher;

  setUpAll(() {
    registerFallbackValue(const LaunchOptions());

    urlLauncher = MockUrlLauncher();
    // ignore: discarded_futures
    when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    UrlLauncherPlatform.instance = urlLauncher;
  });

  setUp(() {
    FakeNeonStorage.setup();
  });

  group('Widget item', () {
    final item = dashboard.WidgetItem(
      (b) => b
        ..title = 'Widget item title'
        ..subtitle = 'Widget item subtitle'
        ..link = '/link'
        ..iconUrl = '/iconUrl'
        ..overlayIconUrl = '/overlayIconUrl'
        ..sinceId = '',
    );

    testWidgets('Everything filled', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetItem(
            item: item,
            roundIcon: true,
          ),
        ),
      );

      expect(find.text('Widget item title'), findsOneWidget);
      expect(find.text('Widget item subtitle'), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
      expect(
        tester.widget(find.byType(InkWell)),
        isA<InkWell>().having(
          (a) => a.onTap,
          'onTap is not null',
          isNotNull,
        ),
      );
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(
        tester.widget(find.byType(ClipRRect)),
        isA<ClipRRect>().having(
          (a) => a.borderRadius,
          'borderRadius is correct',
          BorderRadius.circular(largeIconSize),
        ),
      );
      expect(find.byType(NeonUriImage), findsNWidgets(2));

      await expectLater(find.byType(DashboardWidgetItem), matchesGoldenFile('goldens/widget_item.png'));

      await tester.tap(find.byType(DashboardWidgetItem));
      verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
    });

    testWidgets('Not round', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetItem(
            item: item,
            roundIcon: false,
          ),
        ),
      );

      expect(
        tester.widget(find.byType(ClipRRect)),
        isA<ClipRRect>().having(
          (a) => a.borderRadius,
          'borderRadius is zero',
          BorderRadius.zero,
        ),
      );

      await expectLater(find.byType(DashboardWidgetItem), matchesGoldenFile('goldens/widget_item_not_round.png'));
    });

    testWidgets('Without link', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetItem(
            item: item.rebuild((b) => b..link = ''),
            roundIcon: true,
          ),
        ),
      );

      expect(
        tester.widget(find.byType(InkWell)),
        isA<InkWell>().having(
          (a) => a.onTap,
          'onTap is null',
          isNull,
        ),
      );
    });

    testWidgets('Without overlayIconUrl', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetItem(
            item: item.rebuild((b) => b..overlayIconUrl = ''),
            roundIcon: true,
          ),
        ),
      );

      expect(find.byType(NeonUriImage), findsOneWidget);
    });

    testWidgets('Without iconUrl', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetItem(
            item: item.rebuild((b) => b..iconUrl = ''),
            roundIcon: true,
          ),
        ),
      );

      expect(find.byType(NeonUriImage), findsOneWidget);
      expect(find.byIcon(AdaptiveIcons.question_mark), findsOneWidget);
    });
  });

  group('Widget button', () {
    final button = dashboard.Widget_Buttons(
      (b) => b
        ..type = 'new'
        ..text = 'Button'
        ..link = '/link',
    );

    testWidgets('Opens link', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetButton(
            button: button,
          ),
        ),
      );

      await tester.tap(find.byType(DashboardWidgetButton));
      verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
    });

    testWidgets('New', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetButton(
            button: button,
          ),
        ),
      );

      expect(find.byIcon(AdaptiveIcons.add), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_new.png'));
    });

    testWidgets('More', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetButton(
            button: button.rebuild((b) => b.type = 'more'),
          ),
        ),
      );

      expect(find.byIcon(Icons.more_outlined), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_more.png'));
    });

    testWidgets('Setup', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetButton(
            button: button.rebuild((b) => b.type = 'setup'),
          ),
        ),
      );

      expect(find.byIcon(Icons.launch), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_setup.png'));
    });

    testWidgets('Invalid', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          DashboardWidgetButton(
            button: button.rebuild((b) => b.type = 'test'),
          ),
        ),
      );

      expect(find.byType(Icon), findsNothing);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_invalid.png'));
    });
  });

  group('Widget', () {
    final item = dashboard.WidgetItem(
      (b) => b
        ..title = 'Widget item title'
        ..subtitle = 'Widget item subtitle'
        ..link = '/link'
        ..iconUrl = '/iconUrl'
        ..overlayIconUrl = '/overlayIconUrl'
        ..sinceId = '',
    );
    final items = dashboard.WidgetItems(
      (b) => b
        ..items.replace([item])
        ..emptyContentMessage = ''
        ..halfEmptyContentMessage = '',
    );
    final button = dashboard.Widget_Buttons(
      (b) => b
        ..type = 'new'
        ..text = 'Button'
        ..link = '/link',
    );
    final widget = dashboard.Widget(
      (b) => b
        ..id = 'id'
        ..title = 'Widget title'
        ..order = 0
        ..iconClass = ''
        ..iconUrl = '/iconUrl'
        ..widgetUrl = '/widgetUrl'
        ..itemIconsRound = true
        ..itemApiVersions.replace([1, 2])
        ..reloadInterval = 0
        ..buttons.replace([button]),
    );

    testWidgets('Everything filled', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widget,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widget,
                items: items,
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.text('Widget title'), findsOneWidget);
      expect(find.byType(InkWell), findsNWidgets(4));
      expect(
        tester.widget(find.byType(InkWell).first),
        isA<InkWell>().having(
          (a) => a.onTap,
          'onTap is not null',
          isNotNull,
        ),
      );
      expect(find.byType(ClipRRect), findsOneWidget);
      expect(
        tester.widget(find.byType(ClipRRect)),
        isA<ClipRRect>().having(
          (a) => a.borderRadius,
          'borderRadius is correct',
          BorderRadius.circular(largeIconSize),
        ),
      );
      expect(find.byType(NeonUriImage), findsNWidgets(3));
      expect(find.byType(DashboardWidgetItem), findsOneWidget);
      expect(find.bySubtype<FilledButton>(), findsOneWidget);
      expect(find.byIcon(AdaptiveIcons.add), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget.png'));
    });

    testWidgets('Without widgetUrl', (tester) async {
      final widgetEmptyURL = widget.rebuild((b) => b.widgetUrl = '');
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widgetEmptyURL,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widgetEmptyURL,
                items: items,
              ).toList(),
            ),
          ),
        ),
      );

      expect(
        tester.widget(find.byType(InkWell).first),
        isA<InkWell>().having(
          (a) => a.onTap,
          'onTap is null',
          isNull,
        ),
      );
    });

    testWidgets('Not round', (tester) async {
      final widgetNotRound = widget.rebuild((b) => b.itemIconsRound = false);
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widgetNotRound,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widgetNotRound,
                items: items,
              ).toList(),
            ),
          ),
        ),
      );

      expect(
        tester.widget(find.byType(ClipRRect)),
        isA<ClipRRect>().having(
          (a) => a.borderRadius,
          'borderRadius is zero',
          BorderRadius.zero,
        ),
      );

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_not_round.png'));
    });

    testWidgets('With halfEmptyContentMessage', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widget,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widget,
                items: items.rebuild((b) => b.halfEmptyContentMessage = 'Half empty'),
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.text('Half empty'), findsOneWidget);
      expect(find.byIcon(AdaptiveIcons.check), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_with_half_empty.png'));
    });

    testWidgets('With emptyContentMessage', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widget,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widget,
                items: items.rebuild((b) => b.emptyContentMessage = 'Empty'),
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.text('Empty'), findsOneWidget);
      expect(find.byIcon(AdaptiveIcons.check), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_with_empty.png'));
    });

    testWidgets('With emptyContentMessage and halfEmptyContentMessage', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widget,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widget,
                items: items.rebuild(
                  (b) => b
                    ..halfEmptyContentMessage = 'Half empty'
                    ..emptyContentMessage = 'Empty',
                ),
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.text('Empty'), findsOneWidget);
      expect(find.text('Half empty'), findsNothing);
      expect(find.byIcon(AdaptiveIcons.check), findsOneWidget);

      await expectLater(
        find.byType(DashboardWidget),
        matchesGoldenFile('goldens/widget_with_empty_and_half_empty.png'),
      );
    });

    testWidgets('Without items', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widget,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widget,
                items: null,
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.text('No entries'), findsOneWidget);
      expect(find.byIcon(AdaptiveIcons.check), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_without_items.png'));
    });

    testWidgets('Without buttons', (tester) async {
      final widgetWithoutButtons = widget.rebuild((b) => b.buttons.clear());
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widgetWithoutButtons,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widgetWithoutButtons,
                items: null,
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.bySubtype<FilledButton>(), findsNothing);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_without_buttons.png'));
    });

    testWidgets('With multiple buttons', (tester) async {
      final widgetWithMultipleButtons = widget.rebuild(
        (b) => b.buttons.replace([button, button]),
      );
      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          Builder(
            builder: (context) => DashboardWidget(
              widget: widgetWithMultipleButtons,
              children: DashboardMainPage.buildWidgetItems(
                context: context,
                widget: widgetWithMultipleButtons,
                items: null,
              ).toList(),
            ),
          ),
        ),
      );

      expect(find.bySubtype<FilledButton>(), findsExactly(2));

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_with_multiple_buttons.png'));
    });
  });
}

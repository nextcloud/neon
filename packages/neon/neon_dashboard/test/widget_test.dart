import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_dashboard/l10n/localizations.dart' show DashboardLocalizations;
import 'package:neon_dashboard/src/widgets/widget.dart';
import 'package:neon_dashboard/src/widgets/widget_button.dart';
import 'package:neon_dashboard/src/widgets/widget_item.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;
import 'package:rxdart/rxdart.dart';

// ignore: subtype_of_sealed_class
class MockAccountsBloc extends Mock implements AccountsBloc {}

class MockCacheManager extends Mock implements DefaultCacheManager {}

Widget wrapWidget(final AccountsBloc accountsBloc, final Widget child) => MaterialApp(
      localizationsDelegates: DashboardLocalizations.localizationsDelegates,
      supportedLocales: DashboardLocalizations.supportedLocales,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: NeonProvider<AccountsBloc>.value(
          value: accountsBloc,
          child: child,
        ),
      ),
    );

void main() {
  NeonCachedImage.cacheManager = MockCacheManager();

  final accountsBloc = MockAccountsBloc();
  when(() => accountsBloc.activeAccount).thenAnswer(
    (final invocation) => BehaviorSubject.seeded(
      Account(
        serverURL: Uri(),
        username: 'example',
      ),
    ),
  );

  group('Widget item', () {
    final item = dashboard.WidgetItem(
      (final b) => b
        ..title = 'Widget item title'
        ..subtitle = 'Widget item subtitle'
        ..link = 'https://example.com/link'
        ..iconUrl = 'https://example.com/iconUrl'
        ..overlayIconUrl = 'https://example.com/overlayIconUrl'
        ..sinceId = '',
    );

    testWidgets('Everything filled', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
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
          (final a) => a.onTap,
          'onTap is not null',
          isNotNull,
        ),
      );
      expect(find.byType(NeonImageWrapper), findsOneWidget);
      expect(
        tester.widget(find.byType(NeonImageWrapper)),
        isA<NeonImageWrapper>().having(
          (final a) => a.borderRadius,
          'borderRadius is correct',
          BorderRadius.circular(largeIconSize),
        ),
      );
      expect(find.byType(NeonCachedImage), findsNWidgets(2));

      await expectLater(find.byType(DashboardWidgetItem), matchesGoldenFile('goldens/widget_item.png'));
    });

    testWidgets('Not round', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetItem(
            item: item,
            roundIcon: false,
          ),
        ),
      );

      expect(
        tester.widget(find.byType(NeonImageWrapper)),
        isA<NeonImageWrapper>().having(
          (final a) => a.borderRadius,
          'borderRadius is null',
          null,
        ),
      );

      await expectLater(find.byType(DashboardWidgetItem), matchesGoldenFile('goldens/widget_item_not_round.png'));
    });

    testWidgets('Without link', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetItem(
            item: item.rebuild((final b) => b..link = ''),
            roundIcon: true,
          ),
        ),
      );

      expect(
        tester.widget(find.byType(InkWell)),
        isA<InkWell>().having(
          (final a) => a.onTap,
          'onTap is null',
          isNull,
        ),
      );
    });

    testWidgets('Without overlayIconUrl', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetItem(
            item: item.rebuild((final b) => b..overlayIconUrl = ''),
            roundIcon: true,
          ),
        ),
      );

      expect(find.byType(NeonCachedImage), findsOneWidget);
    });
  });

  group('Widget button', () {
    final button = dashboard.Widget_Buttons(
      (final b) => b
        ..type = 'new'
        ..text = 'Button'
        ..link = 'https://example.com/link',
    );

    testWidgets('New', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetButton(
            button: button,
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_new.png'));
    });

    testWidgets('More', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetButton(
            button: button.rebuild((final b) => b.type = 'more'),
          ),
        ),
      );

      expect(find.byIcon(Icons.more_outlined), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_more.png'));
    });

    testWidgets('Setup', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetButton(
            button: button.rebuild((final b) => b.type = 'setup'),
          ),
        ),
      );

      expect(find.byIcon(Icons.launch), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidgetButton), matchesGoldenFile('goldens/widget_button_setup.png'));
    });

    testWidgets('Invalid', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidgetButton(
            button: button.rebuild((final b) => b.type = 'test'),
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
      (final b) => b
        ..title = 'Widget item title'
        ..subtitle = 'Widget item subtitle'
        ..link = 'https://example.com/link'
        ..iconUrl = 'https://example.com/iconUrl'
        ..overlayIconUrl = 'https://example.com/overlayIconUrl'
        ..sinceId = '',
    );
    final items = dashboard.WidgetItems(
      (final b) => b
        ..items = BuiltList<dashboard.WidgetItem>.from([item]).toBuilder()
        ..emptyContentMessage = ''
        ..halfEmptyContentMessage = '',
    );
    final button = dashboard.Widget_Buttons(
      (final b) => b
        ..type = 'new'
        ..text = 'Button'
        ..link = 'https://example.com/link',
    );
    final widget = dashboard.Widget(
      (final b) => b
        ..id = 'id'
        ..title = 'Widget title'
        ..order = 0
        ..iconClass = ''
        ..iconUrl = 'https://example.com/iconUrl'
        ..widgetUrl = 'https://example.com/widgetUrl'
        ..itemIconsRound = true
        ..itemApiVersions = BuiltList<int>.from([1, 2]).toBuilder()
        ..reloadInterval = 0
        ..buttons = BuiltList<dashboard.Widget_Buttons>.from([button]).toBuilder(),
    );

    testWidgets('Everything filled', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget,
            items: items,
          ),
        ),
      );

      expect(find.text('Widget title'), findsOneWidget);
      expect(find.byType(InkWell), findsNWidgets(4));
      expect(
        tester.widget(find.byType(InkWell).first),
        isA<InkWell>().having(
          (final a) => a.onTap,
          'onTap is not null',
          isNotNull,
        ),
      );
      expect(find.byType(NeonImageWrapper), findsOneWidget);
      expect(
        tester.widget(find.byType(NeonImageWrapper)),
        isA<NeonImageWrapper>().having(
          (final a) => a.borderRadius,
          'borderRadius is correct',
          BorderRadius.circular(largeIconSize),
        ),
      );
      expect(find.byType(NeonCachedImage), findsNWidgets(3));
      expect(find.byType(DashboardWidgetItem), findsOneWidget);
      expect(find.bySubtype<FilledButton>(), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Button'), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget.png'));
    });

    testWidgets('Without widgetUrl', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget.rebuild((final b) => b.widgetUrl = ''),
            items: items,
          ),
        ),
      );

      expect(
        tester.widget(find.byType(InkWell).first),
        isA<InkWell>().having(
          (final a) => a.onTap,
          'onTap is null',
          isNull,
        ),
      );
    });

    testWidgets('Not round', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget.rebuild((final b) => b.itemIconsRound = false),
            items: items,
          ),
        ),
      );

      expect(
        tester.widget(find.byType(NeonImageWrapper)),
        isA<NeonImageWrapper>().having(
          (final a) => a.borderRadius,
          'borderRadius is null',
          null,
        ),
      );

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_not_round.png'));
    });

    testWidgets('With halfEmptyContentMessage', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget,
            items: items.rebuild((final b) => b.halfEmptyContentMessage = 'Half empty'),
          ),
        ),
      );

      expect(find.text('Half empty'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_with_half_empty.png'));
    });

    testWidgets('With emptyContentMessage', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget,
            items: items.rebuild((final b) => b.emptyContentMessage = 'Empty'),
          ),
        ),
      );

      expect(find.text('Empty'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_with_empty.png'));
    });

    testWidgets('Without items', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget,
            items: null,
          ),
        ),
      );

      expect(find.text('No entries'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_without_items.png'));
    });

    testWidgets('Without buttons', (final tester) async {
      await tester.pumpWidget(
        wrapWidget(
          accountsBloc,
          DashboardWidget(
            widget: widget.rebuild((final b) => b.buttons.clear()),
            items: items,
          ),
        ),
      );

      expect(find.bySubtype<FilledButton>(), findsNothing);

      await expectLater(find.byType(DashboardWidget), matchesGoldenFile('goldens/widget_without_buttons.png'));
    });
  });
}

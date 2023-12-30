import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/theme/theme.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/utils.dart';

Widget wrapDialog(final Widget dialog, [final TargetPlatform platform = TargetPlatform.android]) {
  final theme = AppTheme.test(platform: platform);
  const locale = Locale('en');

  return MaterialApp(
    theme: theme.lightTheme,
    localizationsDelegates: NeonLocalizations.localizationsDelegates,
    supportedLocales: NeonLocalizations.supportedLocales,
    locale: locale,
    home: dialog,
  );
}

void main() {
  group('dialog', () {
    group('NeonConfirmationDialog', () {
      testWidgets('NeonConfirmationDialog widget', (final widgetTester) async {
        const title = 'My Title';
        var dialog = const NeonConfirmationDialog(title: title);
        await widgetTester.pumpWidget(wrapDialog(dialog));

        expect(find.text(title), findsOneWidget);
        expect(find.byType(NeonDialogAction), findsExactly(2));

        // Not true on cupertino platforms
        expect(find.byType(OutlinedButton), findsOneWidget);
        expect(find.byType(ElevatedButton), findsOneWidget);

        dialog = const NeonConfirmationDialog(
          title: title,
          isDestructive: false,
        );

        await widgetTester.pumpWidget(wrapDialog(dialog));

        expect(find.byType(NeonDialogAction), findsExactly(2));
        expect(find.byType(OutlinedButton), findsExactly(2));

        const icon = Icon(Icons.error);
        const content = SizedBox(key: Key('content'));
        const confirmAction = SizedBox(key: Key('confirmAction'));
        const declineAction = SizedBox(key: Key('declineAction'));
        dialog = const NeonConfirmationDialog(
          title: title,
          icon: icon,
          content: content,
          confirmAction: confirmAction,
          declineAction: declineAction,
        );
        await widgetTester.pumpWidget(wrapDialog(dialog));

        expect(find.byIcon(Icons.error), findsOneWidget);
        expect(find.byKey(const Key('content')), findsOneWidget);
        expect(find.byKey(const Key('confirmAction')), findsOneWidget);
        expect(find.byKey(const Key('declineAction')), findsOneWidget);
      });

      testWidgets('NeonConfirmationDialog actions', (final widgetTester) async {
        const title = 'My Title';
        await widgetTester.pumpWidget(wrapDialog(const Placeholder()));
        final context = widgetTester.element(find.byType(Placeholder));

        // confirm
        var result = showConfirmationDialog(context: context, title: title);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(find.text(NeonLocalizationsEn().actionContinue));
        expect(await result, isTrue);

        // decline
        result = showConfirmationDialog(context: context, title: title);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(find.text(NeonLocalizationsEn().actionCancel));
        expect(await result, isFalse);

        // cancel by tapping outside
        result = showConfirmationDialog(context: context, title: title);
        await widgetTester.pumpAndSettle();
        await widgetTester.tapAt(Offset.zero);
        expect(await result, isFalse);
      });
    });

    group('NeonRenameDialog', () {
      testWidgets('NeonRenameDialog widget', (final widgetTester) async {
        const title = 'My Title';
        const value = 'My value';
        const dialog = NeonRenameDialog(title: title, value: value);
        await widgetTester.pumpWidget(wrapDialog(dialog));

        expect(find.text(title), findsExactly(2), reason: 'The title is also used for the confirmation button');
        expect(find.text(value), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });

      testWidgets('NeonRenameDialog actions', (final widgetTester) async {
        const title = 'My Title';
        const value = 'My value';
        await widgetTester.pumpWidget(wrapDialog(const Placeholder()));
        final context = widgetTester.element(find.byType(Placeholder));

        // Equal value should not submit
        var result = showRenameDialog(context: context, title: title, initialValue: value);
        await widgetTester.pumpAndSettle();
        await widgetTester.enterText(find.byType(TextFormField), value);
        await widgetTester.tap(find.byType(NeonDialogAction));
        expect(await result, isNull);

        // Empty value should not submit
        result = showRenameDialog(context: context, title: title, initialValue: value);
        await widgetTester.pumpAndSettle();
        await widgetTester.enterText(find.byType(TextFormField), '');
        await widgetTester.tap(find.byType(NeonDialogAction));

        // Different value should submit
        await widgetTester.enterText(find.byType(TextFormField), 'My new value');
        await widgetTester.tap(find.byType(NeonDialogAction));
        expect(await result, equals('My new value'));

        // Submit via keyboard
        result = showRenameDialog(context: context, title: title, initialValue: value);
        await widgetTester.pumpAndSettle();
        await widgetTester.enterText(find.byType(TextFormField), 'My new value');
        await widgetTester.testTextInput.receiveAction(TextInputAction.done);
        await widgetTester.tap(find.byType(NeonDialogAction));
        expect(await result, equals('My new value'));
      });
    });

    group('NeonErrorDialog', () {
      testWidgets('NeonErrorDialog widget', (final widgetTester) async {
        const title = 'My Title';
        const content = 'My content';
        var dialog = const NeonErrorDialog(content: content, title: title);
        await widgetTester.pumpWidget(wrapDialog(dialog));

        expect(find.byIcon(Icons.error), findsOneWidget);
        expect(find.text(title), findsOneWidget);
        expect(find.text(content), findsOneWidget);
        expect(find.byType(NeonDialogAction), findsOneWidget);

        dialog = const NeonErrorDialog(content: content);
        await widgetTester.pumpWidget(wrapDialog(dialog));

        expect(find.text(NeonLocalizationsEn().errorDialog), findsOneWidget);
      });

      testWidgets('NeonErrorDialog actions', (final widgetTester) async {
        const content = 'My content';
        await widgetTester.pumpWidget(wrapDialog(const Placeholder()));
        final context = widgetTester.element(find.byType(Placeholder));

        final result = showErrorDialog(context: context, message: content);
        await widgetTester.pumpAndSettle();
        await widgetTester.tap(find.text(NeonLocalizationsEn().actionClose));
        await result;
      });
    });

    testWidgets('UnimplementedDialog', (final widgetTester) async {
      const title = 'My Title';
      await widgetTester.pumpWidget(wrapDialog(const Placeholder()));
      final context = widgetTester.element(find.byType(Placeholder));

      final result = showUnimplementedDialog(context: context, title: title);
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.text(NeonLocalizationsEn().actionClose));
      await result;
    });

    testWidgets('NeonDialog', (final widgetTester) async {
      var dialog = const NeonDialog(
        actions: [],
      );
      await widgetTester.pumpWidget(wrapDialog(dialog, TargetPlatform.macOS));
      expect(
        find.byType(NeonDialogAction),
        findsOneWidget,
        reason: 'Dialogs can not be dismissed on cupertino platforms. Expecting a fallback action.',
      );

      dialog = const NeonDialog(
        automaticallyShowCancel: false,
        actions: [],
      );
      await widgetTester.pumpWidget(wrapDialog(dialog, TargetPlatform.macOS));
      expect(find.byType(NeonDialogAction), findsNothing);
    });
  });
}

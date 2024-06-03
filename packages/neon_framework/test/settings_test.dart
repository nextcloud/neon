import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/settings/models/option.dart';
import 'package:neon_framework/src/settings/widgets/option_settings_tile.dart';
import 'package:neon_framework/storage.dart';
import 'package:neon_framework/testing.dart';

enum StorageKey implements Storable {
  key._('storage-key');

  const StorageKey._(this.value);

  @override
  final String value;
}

enum SelectValues {
  first,
  second,
  third,
}

void main() {
  final storage = MockStorage();
  const key = StorageKey.key;

  setUp(() {
    // ignore: discarded_futures
    when(() => storage.setBool(key.value, any())).thenAnswer((_) async => true);
    // ignore: discarded_futures
    when(() => storage.setString(key.value, any())).thenAnswer((_) async => true);
    // ignore: discarded_futures
    when(() => storage.remove(key.value)).thenAnswer((_) async => true);
  });

  group('OptionSettingsTile', () {
    testWidgets('ToggleOption', (tester) async {
      final option = ToggleOption(
        storage: storage,
        key: key,
        label: (_) => 'label',
        defaultValue: true,
      );

      final widget = TestApp(child: OptionSettingsTile(option: option));
      await tester.pumpWidgetWithAccessibility(widget);

      expect(find.text('label'), findsOneWidget);

      await tester.tap(find.byType(SwitchListTile));
      await tester.pumpAndSettle();

      expect(option.value, isFalse);
    });

    group('ToggleOption', () {
      final valuesLabel = {
        null: (_) => 'null',
        SelectValues.first: (_) => 'first',
        SelectValues.second: (_) => 'second',
        SelectValues.third: (_) => 'third',
      };

      late SelectOption<SelectValues?> option;

      setUp(() {
        option = SelectOption<SelectValues?>(
          storage: storage,
          key: key,
          label: (_) => 'label',
          defaultValue: SelectValues.first,
          values: valuesLabel,
        );
      });

      testWidgets('ToggleOption material', (tester) async {
        final widget = TestApp(child: OptionSettingsTile(option: option));
        await tester.pumpWidgetWithAccessibility(widget);

        expect(find.text('label'), findsOneWidget);
        expect(find.text('first'), findsOneWidget);

        await tester.tap(find.byType(SelectSettingsTile));
        await tester.pumpAndSettle();
        expect(find.byType(SelectSettingsTileDialog), findsOneWidget);

        // cancel selection
        await tester.tapAt(Offset.zero);
        await tester.pumpAndSettle();
        expect(option.value, SelectValues.first);

        await tester.tap(find.byType(SelectSettingsTile));
        await tester.pumpAndSettle();

        // Select null value
        await tester.tap(find.text('null'));
        await tester.pumpAndSettle();
        expect(option.value, isNull);
      });

      testWidgets('ToggleOption cupertino', (tester) async {
        final widget = TestApp(platform: TargetPlatform.macOS, child: OptionSettingsTile(option: option));
        await tester.pumpWidgetWithAccessibility(widget);

        expect(find.text('label'), findsOneWidget);
        expect(find.text('first'), findsOneWidget);

        await tester.tap(find.byType(SelectSettingsTile));
        await tester.pumpAndSettle();
        expect(find.byType(SelectSettingsTileScreen), findsOneWidget);

        // Select null value
        await tester.tap(find.text('null'));
        await tester.pumpAndSettle();
        expect(option.value, isNull);

        // Select second value
        await tester.tap(find.text('second'));
        await tester.pumpAndSettle();
        expect(option.value, SelectValues.second);
      });
    });
  });
}

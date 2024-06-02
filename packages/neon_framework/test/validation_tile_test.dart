import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/widgets/validation_tile.dart';
import 'package:neon_framework/testing.dart';

void main() {
  group('NeonValidationTile', () {
    testWidgets('NeonValidationTile material', (tester) async {
      var widget = const NeonValidationTile(title: 'title', state: ValidationState.loading);
      await tester.pumpWidgetWithAccessibility(TestApp(child: widget));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // We do not change the theme throughout the test so getting once is enough.
      final theme = (tester.firstWidget(find.byType(Theme)) as Theme).data;

      widget = const NeonValidationTile(title: 'title', state: ValidationState.failure);
      await tester.pumpWidgetWithAccessibility(TestApp(child: widget));
      var iconFinder = find.byIcon(AdaptiveIcons.error_outline);
      expect(iconFinder, findsOneWidget);
      var icon = tester.firstWidget(iconFinder) as Icon;
      expect(icon.color, theme.colorScheme.error);

      widget = const NeonValidationTile(title: 'title', state: ValidationState.canceled);
      await tester.pumpWidgetWithAccessibility(TestApp(child: widget));
      iconFinder = find.byIcon(AdaptiveIcons.cancel_outlined);
      expect(iconFinder, findsOneWidget);
      icon = tester.firstWidget(iconFinder) as Icon;
      expect(icon.color, theme.colorScheme.primary);

      widget = const NeonValidationTile(title: 'title', state: ValidationState.success);
      await tester.pumpWidgetWithAccessibility(TestApp(child: widget));
      iconFinder = find.byIcon(AdaptiveIcons.check_circle);
      expect(iconFinder, findsOneWidget);
      icon = tester.firstWidget(iconFinder) as Icon;
      expect(icon.color, theme.colorScheme.primary);
    });

    testWidgets('NeonValidationTile cupertino', (tester) async {
      const widget = NeonValidationTile(title: 'title', state: ValidationState.canceled);

      await tester.pumpWidgetWithAccessibility(
        const TestApp(
          platform: TargetPlatform.macOS,
          child: ColoredBox(
            color: Colors.white,
            child: widget,
          ),
        ),
      );
      expect(find.byType(CupertinoListTile), findsOneWidget);
    });
  });
}

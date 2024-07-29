import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/widgets/settings_profile_field.dart';
import 'package:neon_framework/testing.dart';

class MockStringCallbackFunction extends Mock {
  void call(String value);
}

void main() {
  testWidgets('Open an close scope menu', (tester) async {
    final callback = MockStringCallbackFunction();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NeonSettingsProfileField(
          value: '',
          scope: 'v2-private',
          labelText: '',
          hintText: '',
          onUpdateValue: (_) {},
          onUpdateScope: callback.call,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.phone_android));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check), findsOne);
    expect(find.byIcon(Icons.phone_android), findsExactly(2));
    expect(find.byIcon(Icons.lock), findsOne);
    expect(find.byIcon(Icons.groups), findsOne);
    expect(find.byIcon(Icons.web), findsOne);

    await tester.tap(find.byIcon(Icons.phone_android).first);
    await tester.pumpAndSettle();

    verifyNever(() => callback(any()));
  });

  testWidgets('Change scope', (tester) async {
    final callback = MockStringCallbackFunction();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NeonSettingsProfileField(
          value: '',
          scope: 'v2-private',
          labelText: '',
          hintText: '',
          onUpdateValue: (_) {},
          onUpdateScope: callback.call,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.phone_android));
    await tester.pumpAndSettle();

    await tester.runAsync(() async {
      await tester.tap(find.byIcon(Icons.web));
      await tester.pumpAndSettle();
    });

    verify(() => callback('v2-published')).called(1);
  });

  group('Change value', () {
    testWidgets('Debounce', (tester) async {
      final callback = MockStringCallbackFunction();

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonSettingsProfileField(
            value: '123',
            scope: 'v2-private',
            labelText: '',
            hintText: '',
            onUpdateValue: callback.call,
            onUpdateScope: (_) {},
          ),
        ),
      );
      expect(find.byIcon(Icons.check), findsNothing);

      await tester.enterText(find.byType(TextField), '456');
      await tester.pumpAndSettle();

      await TestWidgetsFlutterBinding.instance.delayed(const Duration(seconds: 1));
      verify(() => callback('456')).called(1);

      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.check), findsOne);
    });

    testWidgets('Submit', (tester) async {
      final callback = MockStringCallbackFunction();

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonSettingsProfileField(
            value: '123',
            scope: 'v2-private',
            labelText: '',
            hintText: '',
            onUpdateValue: callback.call,
            onUpdateScope: (_) {},
          ),
        ),
      );
      expect(find.byIcon(Icons.check), findsNothing);

      await tester.enterText(find.byType(TextField), '456');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(() => callback('456')).called(1);

      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.check), findsOne);

      await TestWidgetsFlutterBinding.instance.delayed(const Duration(seconds: 1));
      verifyNever(() => callback('456'));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_notifications/src/widgets/action.dart';

import 'testing.dart';

void main() {
  testWidgets('Primary', (tester) async {
    final action = MockAction();
    when(() => action.label).thenReturn('label');
    when(() => action.primary).thenReturn(true);

    await tester.pumpWidget(
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

    await tester.pumpWidget(
      TestApp(
        child: NotificationsAction(
          action: action,
        ),
      ),
    );

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/action_secondary.png'));
  });
}

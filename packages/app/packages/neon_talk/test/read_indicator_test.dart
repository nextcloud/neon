import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_talk/src/widgets/read_indicator.dart';

import 'testing.dart';

void main() {
  testWidgets('Unread', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.id).thenReturn(1);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: TalkReadIndicator(
          chatMessage: chatMessage,
          lastCommonRead: 0,
        ),
      ),
    );
    expect(find.byIcon(MdiIcons.check), findsOne);
  });

  testWidgets('Read', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.id).thenReturn(1);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: TalkReadIndicator(
          chatMessage: chatMessage,
          lastCommonRead: 1,
        ),
      ),
    );
    expect(find.byIcon(MdiIcons.checkAll), findsOne);
  });
}

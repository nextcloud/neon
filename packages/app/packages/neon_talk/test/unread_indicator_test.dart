import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_talk/src/widgets/unread_indicator.dart';
import 'package:nextcloud/spreed.dart' as spreed;

import 'testing.dart';

void main() {
  testWidgets('Unread messages', (tester) async {
    final room = MockRoom();
    when(() => room.unreadMessages).thenReturn(42);
    when(() => room.unreadMention).thenReturn(false);
    when(() => room.unreadMentionDirect).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.group.value);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: TalkUnreadIndicator(
          room: room,
        ),
      ),
    );
    await expectLater(
      find.byType(TalkUnreadIndicator),
      matchesGoldenFile('goldens/unread_indicator_unread_messages.png'),
    );
  });

  testWidgets('Unread single user messages', (tester) async {
    final room = MockRoom();
    when(() => room.unreadMessages).thenReturn(42);
    when(() => room.unreadMention).thenReturn(false);
    when(() => room.unreadMentionDirect).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.oneToOne.value);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: TalkUnreadIndicator(
          room: room,
        ),
      ),
    );
    await expectLater(
      find.byType(TalkUnreadIndicator),
      matchesGoldenFile('goldens/unread_indicator_unread_single_user_messages.png'),
    );
  });

  testWidgets('Unread mention', (tester) async {
    final room = MockRoom();
    when(() => room.unreadMessages).thenReturn(42);
    when(() => room.unreadMention).thenReturn(true);
    when(() => room.unreadMentionDirect).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.group.value);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: TalkUnreadIndicator(
          room: room,
        ),
      ),
    );
    await expectLater(
      find.byType(TalkUnreadIndicator),
      matchesGoldenFile('goldens/unread_indicator_unread_mention.png'),
    );
  });

  testWidgets('Unread mention direct', (tester) async {
    final room = MockRoom();
    when(() => room.unreadMessages).thenReturn(42);
    when(() => room.unreadMention).thenReturn(true);
    when(() => room.unreadMentionDirect).thenReturn(true);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: TalkUnreadIndicator(
          room: room,
        ),
      ),
    );
    await expectLater(
      find.byType(TalkUnreadIndicator),
      matchesGoldenFile('goldens/unread_indicator_unread_mention_direct.png'),
    );
  });
}

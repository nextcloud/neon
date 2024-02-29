import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/widgets/message_preview.dart';
import 'package:nextcloud/spreed.dart' as spreed;

class MockChatMessage extends Mock implements spreed.ChatMessage {}

Widget wrapWidget(Widget child) => MaterialApp(
      localizationsDelegates: TalkLocalizations.localizationsDelegates,
      home: Material(
        child: child,
      ),
    );

void main() {
  testWidgets('Group self', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.message).thenReturn('message');
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment.name);

    await tester.pumpWidget(
      wrapWidget(
        TalkMessagePreview(
          actorId: 'test',
          roomType: spreed.RoomType.group,
          chatMessage: chatMessage,
        ),
      ),
    );
    expect(find.text('You: message', findRichText: true), findsOne);
  });

  testWidgets('Group other', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.actorDisplayName).thenReturn('Test');
    when(() => chatMessage.message).thenReturn('message');
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment.name);

    await tester.pumpWidget(
      wrapWidget(
        TalkMessagePreview(
          actorId: 'abc',
          roomType: spreed.RoomType.group,
          chatMessage: chatMessage,
        ),
      ),
    );
    expect(find.text('Test: message', findRichText: true), findsOne);
  });

  testWidgets('One to one self', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.message).thenReturn('message');
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment.name);

    await tester.pumpWidget(
      wrapWidget(
        TalkMessagePreview(
          actorId: 'test',
          roomType: spreed.RoomType.oneToOne,
          chatMessage: chatMessage,
        ),
      ),
    );
    expect(find.text('You: message', findRichText: true), findsOne);
  });

  testWidgets('One to one other', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.message).thenReturn('message');
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment.name);

    await tester.pumpWidget(
      wrapWidget(
        TalkMessagePreview(
          actorId: 'abc',
          roomType: spreed.RoomType.oneToOne,
          chatMessage: chatMessage,
        ),
      ),
    );
    expect(find.text('message', findRichText: true), findsOne);
  });

  testWidgets('System', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.message).thenReturn('message');
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.system.name);

    await tester.pumpWidget(
      wrapWidget(
        TalkMessagePreview(
          actorId: 'abc',
          roomType: spreed.RoomType.group,
          chatMessage: chatMessage,
        ),
      ),
    );
    expect(find.text('message', findRichText: true), findsOne);
  });

  testWidgets('Newline removed', (tester) async {
    final chatMessage = MockChatMessage();
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.message).thenReturn('message\n123');
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment.name);

    await tester.pumpWidget(
      wrapWidget(
        TalkMessagePreview(
          actorId: 'abc',
          roomType: spreed.RoomType.oneToOne,
          chatMessage: chatMessage,
        ),
      ),
    );
    expect(find.text('message 123', findRichText: true), findsOne);
  });
}

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/l10n/localizations_en.dart';
import 'package:neon_talk/src/widgets/actor_avatar.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:neon_talk/src/widgets/reactions.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';

import 'testing.dart';

Widget wrapWidget(Widget child) => TestApp(
      localizationsDelegates: TalkLocalizations.localizationsDelegates,
      supportedLocales: TalkLocalizations.supportedLocales,
      child: child,
    );

void main() {
  setUpAll(() {
    final storage = MockNeonStorage();
    when(() => storage.requestCache).thenReturn(null);
  });

  group('getActorDisplayName', () {
    final localizations = TalkLocalizationsEn();

    test('Guest without name', () {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.actorDisplayName).thenReturn('');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.guests);

      expect(getActorDisplayName(localizations, chatMessage), localizations.actorGuest);
    });

    test('Guest with name', () {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.actorDisplayName).thenReturn('test');

      expect(getActorDisplayName(localizations, chatMessage), 'test');
    });
  });

  group('TalkMessagePreview', () {
    testWidgets('Group self', (tester) async {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.message).thenReturn('message');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);

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
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);

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
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);

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
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);

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
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.system);

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
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);

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
  });

  group('TalkMessage', () {
    testWidgets('System', (tester) async {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.system);
      when(() => chatMessage.systemMessage).thenReturn('');
      when(() => chatMessage.message).thenReturn('');

      await tester.pumpWidget(
        wrapWidget(
          TalkMessage(
            chatMessage: chatMessage,
          ),
        ),
      );
      expect(find.byType(TalkSystemMessage), findsOne);
    });

    testWidgets('Comment', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

      final chatMessage = MockChatMessage();
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('');
      when(() => chatMessage.message).thenReturn('');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());

      await tester.pumpWidget(
        wrapWidget(
          NeonProvider<AccountsBloc>.value(
            value: accountsBloc,
            child: TalkMessage(
              chatMessage: chatMessage,
            ),
          ),
        ),
      );
      expect(find.byType(TalkCommentMessage), findsOne);
    });
  });

  group('TalkSystemMessage', () {
    testWidgets('Hide', (tester) async {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.systemMessage).thenReturn('reaction');

      await tester.pumpWidget(
        wrapWidget(
          TalkSystemMessage(
            chatMessage: chatMessage,
          ),
        ),
      );
      expect(find.byType(SizedBox), findsOne);
      expect(find.byType(RichText), findsNothing);
      await expectLater(find.byType(TalkSystemMessage), matchesGoldenFile('goldens/message_system_message_hide.png'));
    });

    testWidgets('Show', (tester) async {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.systemMessage).thenReturn('');
      when(() => chatMessage.message).thenReturn('test');

      await tester.pumpWidget(
        wrapWidget(
          TalkSystemMessage(
            chatMessage: chatMessage,
          ),
        ),
      );
      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(RichText), findsOne);
      await expectLater(find.byType(TalkSystemMessage), matchesGoldenFile('goldens/message_system_message_show.png'));
    });
  });

  testWidgets('TalkParentMessage', (tester) async {
    final account = MockAccount();
    when(() => account.id).thenReturn('');
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    final accountsBloc = MockAccountsBloc();
    when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

    final chatMessage = MockChatMessage();
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage.timestamp).thenReturn(0);
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage.actorDisplayName).thenReturn('test');
    when(() => chatMessage.message).thenReturn('abc');
    when(() => chatMessage.reactions).thenReturn(BuiltMap());

    await tester.pumpWidget(
      wrapWidget(
        NeonProvider<AccountsBloc>.value(
          value: accountsBloc,
          child: TalkParentMessage(
            parentChatMessage: chatMessage,
          ),
        ),
      ),
    );
    expect(find.byType(TalkCommentMessage), findsOne);
    await expectLater(find.byType(TalkParentMessage), matchesGoldenFile('goldens/message_parent_message.png'));
  });

  group('TalkCommentMessage', () {
    testWidgets('Default', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

      final previousChatMessage = MockChatMessage();
      when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => previousChatMessage.timestamp).thenReturn(0);
      when(() => previousChatMessage.actorId).thenReturn('test');

      final chatMessage = MockChatMessage();
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.message).thenReturn('abc');
      when(() => chatMessage.reactions).thenReturn(BuiltMap({'😀': 1, '😊': 23}));

      await tester.pumpWidget(
        wrapWidget(
          NeonProvider<AccountsBloc>.value(
            value: accountsBloc,
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              previousChatMessage: previousChatMessage,
            ),
          ),
        ),
      );
      expect(find.byType(TalkActorAvatar), findsNothing);
      expect(find.text('12:00 AM'), findsNothing);
      expect(find.text('test'), findsNothing);
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byType(TalkReactions), findsOne);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message.png'),
      );
    });

    testWidgets('As parent', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

      final chatMessage = MockChatMessage();
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.message).thenReturn('abc');

      await tester.pumpWidget(
        wrapWidget(
          NeonProvider<AccountsBloc>.value(
            value: accountsBloc,
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              isParent: true,
            ),
          ),
        ),
      );
      expect(find.byType(TalkActorAvatar), findsNothing);
      expect(find.text('12:00 AM'), findsNothing);
      expect(find.text('test'), findsOne);
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byType(TalkReactions), findsNothing);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_as_parent.png'),
      );
    });

    testWidgets('With parent', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

      final previousChatMessage = MockChatMessage();
      when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => previousChatMessage.timestamp).thenReturn(0);
      when(() => previousChatMessage.actorId).thenReturn('test');

      final parentChatMessage = MockChatMessage();
      when(() => parentChatMessage.timestamp).thenReturn(0);
      when(() => parentChatMessage.actorId).thenReturn('test');
      when(() => parentChatMessage.actorDisplayName).thenReturn('test');
      when(() => parentChatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => parentChatMessage.message).thenReturn('abc');

      final chatMessage = MockChatMessageWithParent();
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.message).thenReturn('abc');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());
      when(() => chatMessage.parent).thenReturn(parentChatMessage);

      await tester.pumpWidget(
        wrapWidget(
          NeonProvider<AccountsBloc>.value(
            value: accountsBloc,
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              previousChatMessage: previousChatMessage,
            ),
          ),
        ),
      );
      expect(find.byType(TalkParentMessage), findsOne);
      await expectLater(
        find.byType(TalkCommentMessage).first,
        matchesGoldenFile('goldens/message_comment_message_with_parent.png'),
      );
    });

    group('Separate messages', () {
      testWidgets('Actor', (tester) async {
        final account = MockAccount();
        when(() => account.id).thenReturn('');
        when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

        final accountsBloc = MockAccountsBloc();
        when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

        final previousChatMessage = MockChatMessage();
        when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => previousChatMessage.timestamp).thenReturn(0);
        when(() => previousChatMessage.actorId).thenReturn('123');

        final chatMessage = MockChatMessage();
        when(() => chatMessage.timestamp).thenReturn(0);
        when(() => chatMessage.actorId).thenReturn('test');
        when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
        when(() => chatMessage.actorDisplayName).thenReturn('test');
        when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => chatMessage.message).thenReturn('abc');
        when(() => chatMessage.reactions).thenReturn(BuiltMap({'😀': 1, '😊': 23}));

        await tester.pumpWidget(
          wrapWidget(
            NeonProvider<AccountsBloc>.value(
              value: accountsBloc,
              child: TalkCommentMessage(
                chatMessage: chatMessage,
                previousChatMessage: previousChatMessage,
              ),
            ),
          ),
        );
        expect(find.byType(TalkActorAvatar), findsOne);
        expect(find.text('12:00 AM'), findsOne);
        expect(find.text('test'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_actor.png'),
        );
      });

      testWidgets('Time', (tester) async {
        final account = MockAccount();
        when(() => account.id).thenReturn('');
        when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

        final accountsBloc = MockAccountsBloc();
        when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

        final previousChatMessage = MockChatMessage();
        when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => previousChatMessage.timestamp).thenReturn(0);
        when(() => previousChatMessage.actorId).thenReturn('test');

        final chatMessage = MockChatMessage();
        when(() => chatMessage.timestamp).thenReturn(300);
        when(() => chatMessage.actorId).thenReturn('test');
        when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
        when(() => chatMessage.actorDisplayName).thenReturn('test');
        when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => chatMessage.message).thenReturn('abc');
        when(() => chatMessage.reactions).thenReturn(BuiltMap({'😀': 1, '😊': 23}));

        await tester.pumpWidget(
          wrapWidget(
            NeonProvider<AccountsBloc>.value(
              value: accountsBloc,
              child: TalkCommentMessage(
                chatMessage: chatMessage,
                previousChatMessage: previousChatMessage,
              ),
            ),
          ),
        );
        expect(find.byType(TalkActorAvatar), findsOne);
        expect(find.text('12:05 AM'), findsOne);
        expect(find.text('test'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_time.png'),
        );
      });

      testWidgets('System message', (tester) async {
        final account = MockAccount();
        when(() => account.id).thenReturn('');
        when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

        final accountsBloc = MockAccountsBloc();
        when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

        final previousChatMessage = MockChatMessage();
        when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.system);
        when(() => previousChatMessage.timestamp).thenReturn(0);
        when(() => previousChatMessage.actorId).thenReturn('test');

        final chatMessage = MockChatMessage();
        when(() => chatMessage.timestamp).thenReturn(0);
        when(() => chatMessage.actorId).thenReturn('test');
        when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
        when(() => chatMessage.actorDisplayName).thenReturn('test');
        when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => chatMessage.message).thenReturn('abc');
        when(() => chatMessage.reactions).thenReturn(BuiltMap({'😀': 1, '😊': 23}));

        await tester.pumpWidget(
          wrapWidget(
            NeonProvider<AccountsBloc>.value(
              value: accountsBloc,
              child: TalkCommentMessage(
                chatMessage: chatMessage,
                previousChatMessage: previousChatMessage,
              ),
            ),
          ),
        );
        expect(find.byType(TalkActorAvatar), findsOne);
        expect(find.text('12:00 AM'), findsOne);
        expect(find.text('test'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_system_message.png'),
        );
      });
    });
  });
}

import 'package:built_collection/built_collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/l10n/localizations_en.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/widgets/actor_avatar.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:neon_talk/src/widgets/reactions.dart';
import 'package:neon_talk/src/widgets/read_indicator.dart';
import 'package:neon_talk/src/widgets/rich_object/deck_card.dart';
import 'package:neon_talk/src/widgets/rich_object/fallback.dart';
import 'package:neon_talk/src/widgets/rich_object/file.dart';
import 'package:neon_talk/src/widgets/rich_object/mention.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'testing.dart';

Widget wrapWidget({
  required Widget child,
  List<SingleChildWidget> providers = const [],
}) =>
    TestApp(
      localizationsDelegates: TalkLocalizations.localizationsDelegates,
      supportedLocales: TalkLocalizations.supportedLocales,
      providers: providers,
      child: child,
    );

void main() {
  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(Uri());

    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessagePreview(
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessagePreview(
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessagePreview(
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessagePreview(
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessagePreview(
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessagePreview(
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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkMessage(
            chatMessage: chatMessage,
            lastCommonRead: null,
          ),
        ),
      );
      expect(find.byType(TalkSystemMessage), findsOne);
    });

    testWidgets('Comment', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final chatMessage = MockChatMessage();
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('');
      when(() => chatMessage.message).thenReturn('');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
          ],
          child: TalkMessage(
            chatMessage: chatMessage,
            lastCommonRead: null,
          ),
        ),
      );
      expect(find.byType(TalkCommentMessage), findsOne);
    });
  });

  group('TalkSystemMessage', () {
    testWidgets('Normal', (tester) async {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.systemMessage).thenReturn('');
      when(() => chatMessage.message).thenReturn('test');
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkSystemMessage(
            chatMessage: chatMessage,
            previousChatMessage: null,
          ),
        ),
      );
      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(RichText), findsOne);
      await expectLater(find.byType(TalkSystemMessage), matchesGoldenFile('goldens/message_system_message_show.png'));
    });

    testWidgets('Grouping', (tester) async {
      final previousChatMessage = MockChatMessage();
      when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.system);

      final chatMessage = MockChatMessage();
      when(() => chatMessage.systemMessage).thenReturn('');
      when(() => chatMessage.message).thenReturn('test');
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          child: TalkSystemMessage(
            chatMessage: chatMessage,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.byType(SizedBox), findsNothing);
      expect(find.byType(RichText), findsOne);
      await expectLater(
        find.byType(TalkSystemMessage),
        matchesGoldenFile('goldens/message_system_message_grouping.png'),
      );
    });
  });

  testWidgets('TalkParentMessage', (tester) async {
    final account = MockAccount();
    when(() => account.id).thenReturn('');
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    final chatMessage = MockChatMessage();
    when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage.timestamp).thenReturn(0);
    when(() => chatMessage.actorId).thenReturn('test');
    when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage.actorDisplayName).thenReturn('test');
    when(() => chatMessage.message).thenReturn('abc');
    when(() => chatMessage.reactions).thenReturn(BuiltMap());
    when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

    await tester.pumpWidgetWithAccessibility(
      wrapWidget(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: TalkParentMessage(
          parentChatMessage: chatMessage,
          lastCommonRead: null,
        ),
      ),
    );
    expect(find.byType(TalkCommentMessage), findsOne);
    expect(find.byType(SelectionArea), findsNothing);
    await expectLater(find.byType(TalkParentMessage), matchesGoldenFile('goldens/message_parent_message.png'));
  });

  group('TalkCommentMessage', () {
    testWidgets('Self', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.username).thenReturn('test');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
      when(() => chatMessage.id).thenReturn(0);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
          ],
          child: TalkCommentMessage(
            chatMessage: chatMessage,
            lastCommonRead: 0,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.byType(TalkActorAvatar), findsNothing);
      expect(find.text('1:00 AM'), findsNothing);
      expect(find.byTooltip('1/1/1970 1:00 AM'), findsNothing);
      expect(find.text('test'), findsNothing);
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byType(TalkReactions), findsOne);
      expect(find.byType(TalkReadIndicator), findsOne);
      expect(find.byType(SelectionArea), findsOne);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_self.png'),
      );
    });

    testWidgets('Other', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.username).thenReturn('other');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

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
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
      when(() => chatMessage.id).thenReturn(0);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
          ],
          child: TalkCommentMessage(
            chatMessage: chatMessage,
            lastCommonRead: 0,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.byType(TalkActorAvatar), findsNothing);
      expect(find.text('1:00 AM'), findsNothing);
      expect(find.byTooltip('1/1/1970 1:00 AM'), findsNothing);
      expect(find.text('test'), findsNothing);
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byType(TalkReactions), findsOne);
      expect(find.byType(TalkReadIndicator), findsNothing);
      expect(find.byType(SelectionArea), findsOne);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_other.png'),
      );
    });

    testWidgets('Deleted', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final previousChatMessage = MockChatMessage();
      when(() => previousChatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => previousChatMessage.timestamp).thenReturn(0);
      when(() => previousChatMessage.actorId).thenReturn('test');

      final chatMessage = MockChatMessage();
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.commentDeleted);
      when(() => chatMessage.message).thenReturn('abc');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: TalkCommentMessage(
            chatMessage: chatMessage,
            lastCommonRead: null,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byIcon(AdaptiveIcons.cancel), findsOne);
      expect(find.byType(TalkReactions), findsNothing);
      expect(find.byType(SelectionArea), findsNothing);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_deleted.png'),
      );
    });

    testWidgets('As parent', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final chatMessage = MockChatMessage();
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.message).thenReturn('abc');
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: TalkCommentMessage(
            chatMessage: chatMessage,
            lastCommonRead: null,
            isParent: true,
          ),
        ),
      );
      expect(find.byType(TalkActorAvatar), findsNothing);
      expect(find.text('1:00 AM'), findsNothing);
      expect(find.byTooltip('1/1/1970 1:00 AM'), findsNothing);
      expect(find.text('test'), findsOne);
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byType(TalkReactions), findsNothing);
      expect(find.byType(SelectionArea), findsNothing);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_as_parent.png'),
      );
    });

    testWidgets('With parent', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

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
      when(() => parentChatMessage.messageParameters).thenReturn(BuiltMap());

      final chatMessage = MockChatMessageWithParent();
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.message).thenReturn('abc');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());
      when(() => chatMessage.parent).thenReturn(parentChatMessage);
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
          ],
          child: TalkCommentMessage(
            chatMessage: chatMessage,
            lastCommonRead: null,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.byType(TalkParentMessage), findsOne);
      expect(find.byType(TalkReactions), findsNothing);
      expect(find.byType(SelectionArea), findsOne);
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
        when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            ],
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              lastCommonRead: null,
              previousChatMessage: previousChatMessage,
            ),
          ),
        );
        expect(find.byType(TalkActorAvatar), findsOne);
        expect(find.text('1:00 AM'), findsOne);
        expect(find.byTooltip('1/1/1970 1:00 AM'), findsOne);
        expect(find.text('test'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        expect(find.byType(SelectionArea), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_actor.png'),
        );
      });

      testWidgets('Time', (tester) async {
        final account = MockAccount();
        when(() => account.id).thenReturn('');
        when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

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
        when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            ],
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              lastCommonRead: null,
              previousChatMessage: previousChatMessage,
            ),
          ),
        );
        expect(find.byType(TalkActorAvatar), findsOne);
        expect(find.text('1:05 AM'), findsOne);
        expect(find.text('test'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        expect(find.byType(SelectionArea), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_time.png'),
        );
      });

      testWidgets('System message', (tester) async {
        final account = MockAccount();
        when(() => account.id).thenReturn('');
        when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

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
        when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            ],
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              lastCommonRead: null,
              previousChatMessage: previousChatMessage,
            ),
          ),
        );
        expect(find.byType(TalkActorAvatar), findsOne);
        expect(find.text('1:00 AM'), findsOne);
        expect(find.byTooltip('1/1/1970 1:00 AM'), findsOne);
        expect(find.text('test'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        expect(find.byType(SelectionArea), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_system_message.png'),
        );
      });
    });

    group('Menu', () {
      late Account account;
      late spreed.ChatMessage chatMessage;
      late TalkRoomBloc roomBloc;

      setUp(() {
        account = MockAccount();
        when(() => account.id).thenReturn('');
        when(() => account.username).thenReturn('test');
        when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

        chatMessage = MockChatMessage();
        when(() => chatMessage.timestamp).thenReturn(0);
        when(() => chatMessage.actorId).thenReturn('test');
        when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
        when(() => chatMessage.actorDisplayName).thenReturn('test');
        when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => chatMessage.message).thenReturn('abc');
        when(() => chatMessage.reactions).thenReturn(BuiltMap());
        when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
        when(() => chatMessage.id).thenReturn(0);
        when(() => chatMessage.isReplyable).thenReturn(true);

        roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));
      });

      testWidgets('Add reaction', (tester) async {
        SharedPreferences.setMockInitialValues({});

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            ],
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              lastCommonRead: 0,
            ),
          ),
        );

        final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();
        await gesture.moveTo(tester.getCenter(find.byType(TalkCommentMessage)));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pumpAndSettle();

        await tester.runAsync(() async {
          await tester.tap(find.byIcon(Icons.add_reaction_outlined));
          await tester.pumpAndSettle();
          await tester.tap(find.byIcon(Icons.tag_faces));
          await tester.pumpAndSettle();
          await tester.tap(find.text('😂'));
          await tester.pumpAndSettle();

          verify(() => roomBloc.addReaction(chatMessage, '😂')).called(1);
        });
      });

      testWidgets('Reply', (tester) async {
        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            ],
            child: TalkCommentMessage(
              chatMessage: chatMessage,
              lastCommonRead: 0,
            ),
          ),
        );

        final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();
        await gesture.moveTo(tester.getCenter(find.byType(TalkCommentMessage)));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pumpAndSettle();

        await tester.runAsync(() async {
          await tester.tap(find.byIcon(Icons.reply));
          await tester.pumpAndSettle();

          verify(() => roomBloc.setReplyChatMessage(chatMessage)).called(1);
        });
      });
    });
  });

  group('buildRichObjectParameter', () {
    for (final isPreview in [true, false]) {
      group(isPreview ? 'As preview' : 'Complete', () {
        group('Mention', () {
          for (final type in ['user', 'call', 'guest', 'user-group', 'group']) {
            testWidgets(type, (tester) async {
              final userDetails = MockUserDetails();
              when(() => userDetails.groups).thenReturn(BuiltList());

              final userDetailsBloc = MockUserDetailsBloc();
              when(() => userDetailsBloc.userDetails)
                  .thenAnswer((_) => BehaviorSubject.seeded(Result.success(userDetails)));

              final account = MockAccount();
              when(() => account.username).thenReturn('username');
              when(() => account.client).thenReturn(NextcloudClient(Uri()));

              await tester.pumpWidgetWithAccessibility(
                TestApp(
                  providers: [
                    Provider<Account>.value(value: account),
                    NeonProvider<UserDetailsBloc>.value(value: userDetailsBloc),
                  ],
                  child: RichText(
                    text: buildRichObjectParameter(
                      parameter: spreed.RichObjectParameter(
                        (b) => b
                          ..type = type
                          ..id = ''
                          ..name = 'name'
                          ..iconUrl = '',
                      ),
                      textStyle: null,
                      isPreview: isPreview,
                    ),
                  ),
                ),
              );

              expect(find.byType(TalkRichObjectMention), isPreview ? findsNothing : findsOne);
              expect(find.text('name'), findsOne);
            });
          }
        });

        testWidgets('File', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: spreed.RichObjectParameter(
                    (b) => b
                      ..type = 'file'
                      ..id = ''
                      ..name = 'name',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(TalkRichObjectFile), isPreview ? findsNothing : findsOne);
          expect(find.text('name'), findsOne);
        });

        testWidgets('Deck card', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: spreed.RichObjectParameter(
                    (b) => b
                      ..type = 'deck-card'
                      ..id = ''
                      ..name = 'name'
                      ..boardname = 'boardname'
                      ..stackname = 'stackname',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(TalkRichObjectDeckCard), isPreview ? findsNothing : findsOne);
          expect(find.text('name'), findsOne);
        });

        testWidgets('Fallback', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: spreed.RichObjectParameter(
                    (b) => b
                      ..type = 'unknown'
                      ..id = ''
                      ..name = 'name',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(TalkRichObjectFallback), isPreview ? findsNothing : findsOne);
          expect(find.text('name'), findsOne);
        });
      });
    }
  });

  group('buildChatMessage', () {
    test('Preview without newlines', () {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.message).thenReturn('123\n456');
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      var span = buildChatMessage(chatMessage: chatMessage).children!.single as TextSpan;
      expect(span.text, '123\n456');

      span = buildChatMessage(chatMessage: chatMessage, isPreview: true).children!.single as TextSpan;
      expect(span.text, '123 456');
    });

    group('Unused parameters', () {
      group('Discard', () {
        for (final type in ['actor', 'user']) {
          test(type, () {
            final chatMessage = MockChatMessage();
            when(() => chatMessage.message).thenReturn('test');
            when(() => chatMessage.messageParameters).thenReturn(
              BuiltMap({
                type: spreed.RichObjectParameter(
                  (b) => b
                    ..type = ''
                    ..id = ''
                    ..name = '',
                ),
              }),
            );

            final spans = buildChatMessage(chatMessage: chatMessage).children!;
            expect((spans.single as TextSpan).text, 'test');
          });
        }
      });

      test('Display', () {
        final chatMessage = MockChatMessage();
        when(() => chatMessage.message).thenReturn('test');
        when(() => chatMessage.messageParameters).thenReturn(
          BuiltMap({
            'file': spreed.RichObjectParameter(
              (b) => b
                ..type = 'file'
                ..id = ''
                ..name = '',
            ),
          }),
        );

        final spans = buildChatMessage(chatMessage: chatMessage).children!;
        expect(spans, hasLength(3));
        expect((spans[0] as WidgetSpan).child, isA<TalkRichObjectFile>());
        expect((spans[1] as TextSpan).text, '\n');
        expect((spans[2] as TextSpan).text, 'test');
      });
    });

    test('Used parameters', () {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.message).thenReturn('123 {actor1} 456 {actor2} 789');
      when(() => chatMessage.messageParameters).thenReturn(
        BuiltMap({
          'actor1': spreed.RichObjectParameter(
            (b) => b
              ..type = 'user'
              ..id = ''
              ..name = '',
          ),
          'actor2': spreed.RichObjectParameter(
            (b) => b
              ..type = 'user'
              ..id = ''
              ..name = '',
          ),
        }),
      );

      final spans = buildChatMessage(chatMessage: chatMessage).children!;
      expect(spans, hasLength(5));
      expect((spans[0] as TextSpan).text, '123 ');
      expect((spans[1] as WidgetSpan).child, isA<TalkRichObjectMention>());
      expect((spans[2] as TextSpan).text, ' 456 ');
      expect((spans[3] as WidgetSpan).child, isA<TalkRichObjectMention>());
      expect((spans[4] as TextSpan).text, ' 789');
    });
  });
}

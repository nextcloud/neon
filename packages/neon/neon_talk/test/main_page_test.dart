import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/l10n/localizations_en.dart';
import 'package:neon_talk/src/blocs/talk.dart';
import 'package:neon_talk/src/dialogs/create_room.dart';
import 'package:neon_talk/src/pages/main.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:neon_talk/src/widgets/read_indicator.dart';
import 'package:neon_talk/src/widgets/unread_indicator.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:nextcloud/utils.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'testing.dart';

void main() {
  late spreed.Room room;
  late TalkBloc bloc;
  late Account account;

  setUpAll(() {
    registerFallbackValue(spreed.RoomType.group);

    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));
  });

  setUp(() {
    FakeNeonStorage.setup();

    room = MockRoom();
    when(() => room.actorId).thenReturn('test');
    when(() => room.displayName).thenReturn('test');
    when(() => room.type).thenReturn(spreed.RoomType.group.value);
    when(() => room.isCustomAvatar).thenReturn(false);
    when(() => room.unreadMention).thenReturn(false);
    when(() => room.unreadMentionDirect).thenReturn(false);

    bloc = MockTalkBloc();
    when(() => bloc.errors).thenAnswer((_) => StreamController<Object>().stream);
    when(() => bloc.rooms).thenAnswer((_) => BehaviorSubject.seeded(Result.success(BuiltList([room]))));

    account = MockAccount();
    when(() => account.id).thenReturn('');
    when(() => account.username).thenReturn('test');
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));
  });

  testWidgets('Errors', (tester) async {
    when(() => bloc.rooms).thenAnswer((_) => BehaviorSubject.seeded(Result.success(BuiltList([]))));

    final controller = StreamController<Object>();
    when(() => bloc.errors).thenAnswer((_) => controller.stream);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          Provider<Account>.value(value: account),
          NeonProvider<TalkBloc>.value(value: bloc),
        ],
        child: const TalkMainPage(),
      ),
    );

    controller.add(Exception());
    await tester.pumpAndSettle();

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/main_page_error.png'));

    await controller.close();
  });

  testWidgets('Without message preview', (tester) async {
    when(() => room.lastMessage).thenReturn((baseMessage: null, builtListNever: null, chatMessage: null));
    when(() => room.unreadMessages).thenReturn(0);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          Provider<Account>.value(value: account),
          NeonProvider<TalkBloc>.value(value: bloc),
        ],
        child: const TalkMainPage(),
      ),
    );

    expect(find.byType(TalkMessagePreview), findsNothing);
    await expectLater(find.byType(TalkMainPage), matchesGoldenFile('goldens/main_page_without_message_preview.png'));
  });

  group('Message preview', () {
    testWidgets('With unread messages', (tester) async {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.message).thenReturn('test');
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
      when(() => chatMessage.timestamp).thenReturn(tz.TZDateTime.now(tz.UTC).secondsSinceEpoch - 60 * 60);

      when(() => room.lastMessage).thenReturn((baseMessage: null, builtListNever: null, chatMessage: chatMessage));
      when(() => room.unreadMessages).thenReturn(1);

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          localizationsDelegates: TalkLocalizations.localizationsDelegates,
          supportedLocales: TalkLocalizations.supportedLocales,
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkBloc>.value(value: bloc),
          ],
          child: const TalkMainPage(),
        ),
      );

      expect(find.byType(TalkMessagePreview), findsOne);
      expect(find.byType(TalkUnreadIndicator), findsOne);
      expect(find.byType(TalkReadIndicator), findsNothing);
      expect(find.text('1h'), findsOne);
      await expectLater(
        find.byType(TalkMainPage),
        matchesGoldenFile('goldens/main_page_with_message_preview_with_unread_messages.png'),
      );
    });

    group('Without unread messages', () {
      testWidgets('Self', (tester) async {
        final chatMessage = MockChatMessage();
        when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => chatMessage.actorId).thenReturn('test');
        when(() => chatMessage.message).thenReturn('test');
        when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
        when(() => chatMessage.id).thenReturn(0);
        when(() => chatMessage.timestamp).thenReturn(tz.TZDateTime.now(tz.UTC).secondsSinceEpoch - 60 * 60);

        when(() => room.lastMessage).thenReturn((baseMessage: null, builtListNever: null, chatMessage: chatMessage));
        when(() => room.unreadMessages).thenReturn(0);
        when(() => room.lastCommonReadMessage).thenReturn(0);

        await tester.pumpWidgetWithAccessibility(
          TestApp(
            localizationsDelegates: TalkLocalizations.localizationsDelegates,
            supportedLocales: TalkLocalizations.supportedLocales,
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkBloc>.value(value: bloc),
            ],
            child: const TalkMainPage(),
          ),
        );

        expect(find.byType(TalkMessagePreview), findsOne);
        expect(find.byType(TalkUnreadIndicator), findsNothing);
        expect(find.byType(TalkReadIndicator), findsOne);
        expect(find.text('1h'), findsOne);
        await expectLater(
          find.byType(TalkMainPage),
          matchesGoldenFile('goldens/main_page_with_message_preview_without_unread_messages_self.png'),
        );
      });

      testWidgets('Other', (tester) async {
        final chatMessage = MockChatMessage();
        when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
        when(() => chatMessage.actorId).thenReturn('test');
        when(() => chatMessage.message).thenReturn('test');
        when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
        when(() => chatMessage.id).thenReturn(0);
        when(() => chatMessage.timestamp).thenReturn(tz.TZDateTime.now(tz.UTC).secondsSinceEpoch - 60 * 60);

        when(() => room.lastMessage).thenReturn((baseMessage: null, builtListNever: null, chatMessage: chatMessage));
        when(() => room.unreadMessages).thenReturn(0);
        when(() => room.lastCommonReadMessage).thenReturn(0);

        await tester.pumpWidgetWithAccessibility(
          TestApp(
            localizationsDelegates: TalkLocalizations.localizationsDelegates,
            supportedLocales: TalkLocalizations.supportedLocales,
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkBloc>.value(value: bloc),
            ],
            child: const TalkMainPage(),
          ),
        );

        expect(find.byType(TalkMessagePreview), findsOne);
        expect(find.byType(TalkUnreadIndicator), findsNothing);
        expect(find.byType(TalkReadIndicator), findsOne);
        expect(find.text('1h'), findsOne);
        await expectLater(
          find.byType(TalkMainPage),
          matchesGoldenFile('goldens/main_page_with_message_preview_without_unread_messages_other.png'),
        );
      });
    });
  });

  testWidgets('Create room', (tester) async {
    when(() => room.lastMessage).thenReturn((baseMessage: null, builtListNever: null, chatMessage: null));
    when(() => room.unreadMessages).thenReturn(0);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          Provider<Account>.value(value: account),
          NeonProvider<TalkBloc>.value(value: bloc),
        ],
        child: const TalkMainPage(),
      ),
    );

    await tester.runAsync(() async {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(TalkCreateRoomDialog), findsOne);

      await tester.tap(find.text(TalkLocalizationsEn().roomType(spreed.RoomType.public.name)));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 'test');
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(TalkCreateRoomDialog), findsNothing);

      verify(() => bloc.createRoom(spreed.RoomType.public, 'test', null)).called(1);
    });
  });
}

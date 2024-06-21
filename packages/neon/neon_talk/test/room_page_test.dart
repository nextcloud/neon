import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/pages/room.dart';
import 'package:neon_talk/src/theme.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'testing.dart';

void main() {
  late spreed.Room room;
  late TalkRoomBloc bloc;

  setUpAll(() {
    KeyboardVisibilityTesting.setVisibilityForTesting(true);

    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));
  });

  setUp(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    room = MockRoom();
    when(() => room.token).thenReturn('abcd');
    when(() => room.displayName).thenReturn('test');
    when(() => room.readOnly).thenReturn(0);
    when(() => room.isCustomAvatar).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.group.value);

    bloc = MockRoomBloc();
    when(() => bloc.errors).thenAnswer((_) => StreamController<Object>().stream);
    when(() => bloc.room).thenAnswer((_) => BehaviorSubject.seeded(Result.success(room)));
    when(() => bloc.messages)
        .thenAnswer((_) => BehaviorSubject.seeded(Result.success(BuiltList<spreed.ChatMessageWithParent>())));
    when(() => bloc.lastCommonRead).thenAnswer((_) => BehaviorSubject.seeded(0));
    when(() => bloc.replyTo).thenAnswer((_) => BehaviorSubject.seeded(null));
  });

  testWidgets('Status message', (tester) async {
    when(() => room.statusMessage).thenReturn('status');

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: const TalkRoomPage(),
      ),
    );

    expect(find.text('status'), findsOne);
  });

  testWidgets('Errors', (tester) async {
    final controller = StreamController<Object>();
    when(() => bloc.errors).thenAnswer((_) => controller.stream);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: const TalkRoomPage(),
      ),
    );

    controller.add(Exception());
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOne);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_error.png'));

    await controller.close();
  });

  testWidgets('Messages', (tester) async {
    final chatMessage1 = MockChatMessageWithParent();
    when(() => chatMessage1.id).thenReturn(1);
    when(() => chatMessage1.timestamp).thenReturn((1 * 24 - 1) * 60 * 60);
    when(() => chatMessage1.actorId).thenReturn('test');
    when(() => chatMessage1.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage1.actorDisplayName).thenReturn('test');
    when(() => chatMessage1.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage1.message).thenReturn('abc');
    when(() => chatMessage1.reactions).thenReturn(BuiltMap());
    when(() => chatMessage1.messageParameters).thenReturn(BuiltMap());
    when(() => chatMessage1.systemMessage).thenReturn('');

    final chatMessage2 = MockChatMessageWithParent();
    when(() => chatMessage2.id).thenReturn(2);
    when(() => chatMessage2.timestamp).thenReturn((2 * 24 - 1) * 60 * 60);
    when(() => chatMessage2.actorId).thenReturn('test');
    when(() => chatMessage2.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage2.actorDisplayName).thenReturn('test');
    when(() => chatMessage2.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage2.message).thenReturn('abc');
    when(() => chatMessage2.reactions).thenReturn(BuiltMap());
    when(() => chatMessage2.messageParameters).thenReturn(BuiltMap());
    when(() => chatMessage2.systemMessage).thenReturn('');

    final chatMessage3 = MockChatMessageWithParent();
    when(() => chatMessage3.id).thenReturn(3);
    when(() => chatMessage3.timestamp).thenReturn((3 * 24 - 1) * 60 * 60 - 1);
    when(() => chatMessage3.actorId).thenReturn('test');
    when(() => chatMessage3.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage3.actorDisplayName).thenReturn('test');
    when(() => chatMessage3.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage3.message).thenReturn('abc');
    when(() => chatMessage3.reactions).thenReturn(BuiltMap());
    when(() => chatMessage3.messageParameters).thenReturn(BuiltMap());
    when(() => chatMessage3.systemMessage).thenReturn('');

    when(() => bloc.messages).thenAnswer(
      (_) => BehaviorSubject.seeded(
        Result.success(
          BuiltList<spreed.ChatMessageWithParent>([
            chatMessage3,
            chatMessage2,
            chatMessage1,
          ]),
        ),
      ),
    );

    when(() => bloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

    final account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        providers: [
          Provider<Account>.value(value: account),
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: const TalkRoomPage(),
      ),
    );

    expect(find.byType(TalkMessage), findsExactly(3));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TalkMessage && widget.chatMessage == chatMessage2 && widget.previousChatMessage == chatMessage1,
      ),
      findsOne,
    );
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is TalkMessage && widget.chatMessage == chatMessage3 && widget.previousChatMessage == chatMessage2,
      ),
      findsOne,
    );
    expect(find.byType(Divider), findsExactly(2));
    expect(find.text('1/2/1970'), findsOne);
    expect(find.text('1/3/1970'), findsOne);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_messages.png'));
  });

  testWidgets('Read-only', (tester) async {
    when(() => room.readOnly).thenReturn(1);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: const TalkRoomPage(),
      ),
    );

    expect(find.byType(TypeAheadField), findsNothing);
    expect(find.byIcon(Icons.emoji_emotions_outlined), findsNothing);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_read_only.png'));
  });

  testWidgets('Reply', (tester) async {
    final replyTo = BehaviorSubject<spreed.$ChatMessageInterface?>.seeded(null);

    when(() => bloc.replyTo).thenAnswer((_) => replyTo);

    final account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        providers: [
          Provider<Account>.value(value: account),
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: const TalkRoomPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(TalkParentMessage), findsNothing);

    final message = MockChatMessage();
    when(() => message.messageType).thenReturn(spreed.MessageType.comment);
    when(() => message.timestamp).thenReturn(0);
    when(() => message.actorId).thenReturn('test');
    when(() => message.actorDisplayName).thenReturn('test');
    when(() => message.message).thenReturn('abc');
    when(() => message.messageParameters).thenReturn(BuiltMap());

    replyTo.add(message);
    await tester.pumpAndSettle();

    expect(find.byType(TalkParentMessage), findsOne);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_reply.png'));

    await tester.tap(find.byIcon(Icons.close));
    verify(() => bloc.removeReplyChatMessage()).called(1);

    unawaited(replyTo.close());
  });
}

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/pages/room.dart';
import 'package:neon_talk/src/theme.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'testing.dart';

void main() {
  late spreed.Room room;
  late TalkRoomBloc bloc;

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
  });

  testWidgets('Status message', (tester) async {
    when(() => room.statusMessage).thenReturn('status');

    await tester.pumpWidget(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        child: NeonProvider<TalkRoomBloc>.value(
          value: bloc,
          child: const TalkRoomPage(),
        ),
      ),
    );

    expect(find.text('status'), findsOne);
  });

  testWidgets('Errors', (tester) async {
    final controller = StreamController<Object>();
    when(() => bloc.errors).thenAnswer((_) => controller.stream);

    await tester.pumpWidget(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        child: NeonProvider<TalkRoomBloc>.value(
          value: bloc,
          child: const TalkRoomPage(),
        ),
      ),
    );

    controller.add(Exception());
    await tester.pumpAndSettle();

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_error.png'));

    await controller.close();
  });

  testWidgets('Messages', (tester) async {
    final chatMessage1 = MockChatMessageWithParent();
    when(() => chatMessage1.id).thenReturn(0);
    when(() => chatMessage1.timestamp).thenReturn(0);
    when(() => chatMessage1.actorId).thenReturn('test');
    when(() => chatMessage1.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage1.actorDisplayName).thenReturn('test');
    when(() => chatMessage1.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage1.message).thenReturn('abc');
    when(() => chatMessage1.reactions).thenReturn(BuiltMap());
    when(() => chatMessage1.parent).thenReturn(null);
    when(() => chatMessage1.messageParameters).thenReturn(BuiltMap());

    final chatMessage2 = MockChatMessageWithParent();
    when(() => chatMessage2.id).thenReturn(1);
    when(() => chatMessage2.timestamp).thenReturn(0);
    when(() => chatMessage2.actorId).thenReturn('test');
    when(() => chatMessage2.actorType).thenReturn(spreed.ActorType.users);
    when(() => chatMessage2.actorDisplayName).thenReturn('test');
    when(() => chatMessage2.messageType).thenReturn(spreed.MessageType.comment);
    when(() => chatMessage2.message).thenReturn('abc');
    when(() => chatMessage2.reactions).thenReturn(BuiltMap());
    when(() => chatMessage2.parent).thenReturn(null);
    when(() => chatMessage2.messageParameters).thenReturn(BuiltMap());

    when(() => bloc.messages).thenAnswer(
      (_) => BehaviorSubject.seeded(
        Result.success(
          BuiltList<spreed.ChatMessageWithParent>([
            chatMessage2,
            chatMessage1,
          ]),
        ),
      ),
    );

    final account = MockAccount();
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    final accountsBloc = MockAccountsBloc();
    when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));

    await tester.pumpWidget(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        child: NeonProvider<AccountsBloc>.value(
          value: accountsBloc,
          child: NeonProvider<TalkRoomBloc>.value(
            value: bloc,
            child: const TalkRoomPage(),
          ),
        ),
      ),
    );

    expect(find.byType(TalkMessage), findsExactly(2));
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_messages.png'));
  });

  testWidgets('Read-only', (tester) async {
    when(() => room.readOnly).thenReturn(1);

    await tester.pumpWidget(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        child: NeonProvider<TalkRoomBloc>.value(
          value: bloc,
          child: const TalkRoomPage(),
        ),
      ),
    );

    expect(find.byType(TextField), findsNothing);
    expect(find.byIcon(Icons.emoji_emotions_outlined), findsNothing);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_read_only.png'));
  });

  testWidgets('Cupertino no emoji button', (tester) async {
    await tester.pumpWidget(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        platform: TargetPlatform.iOS,
        child: NeonProvider<TalkRoomBloc>.value(
          value: bloc,
          child: const TalkRoomPage(),
        ),
      ),
    );

    expect(find.byType(TextField), findsOne);
    expect(find.byIcon(Icons.emoji_emotions_outlined), findsNothing);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/room_page_message_input_no_emoji_button.png'));
  });

  testWidgets('Emoji button', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        appThemes: const [
          TalkTheme(),
        ],
        child: NeonProvider<TalkRoomBloc>.value(
          value: bloc,
          child: const TalkRoomPage(),
        ),
      ),
    );

    expect(find.byType(TextField), findsOne);
    expect(find.byIcon(Icons.emoji_emotions_outlined), findsOne);

    await tester.enterText(find.byType(TextField), '123456');
    for (var i = 0; i < 3; i++) {
      await simulateKeyDownEvent(LogicalKeyboardKey.arrowLeft);
      await simulateKeyUpEvent(LogicalKeyboardKey.arrowLeft);
    }

    await tester.runAsync(() async {
      await tester.tap(find.byIcon(Icons.emoji_emotions_outlined));
    });
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.tag_faces));
    await tester.pumpAndSettle();
    await tester.tap(find.text('😀'));
    await tester.pumpAndSettle();

    await expectLater(find.byType(TextField), matchesGoldenFile('goldens/room_page_message_input_emoji.png'));

    await tester.testTextInput.receiveAction(TextInputAction.send);
    verify(() => bloc.sendMessage('123😀456')).called(1);
  });
}

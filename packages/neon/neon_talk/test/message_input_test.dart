import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/widgets/message_input.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'testing.dart';

Account mockTalkAccount() {
  return mockServer({
    RegExp(r'/ocs/v2\.php/apps/spreed/api/v1/chat/.*/mentions'): {
      'get': (match, queryParameters) async {
        await Future<void>.delayed(const Duration(seconds: 1));

        return Response(
          json.encode({
            'ocs': {
              'meta': {'status': '', 'statuscode': 0},
              'data': [
                {
                  'id': 'id',
                  'label': 'label',
                  'source': 'groups',
                },
              ],
            },
          }),
          200,
        );
      },
    },
  });
}

void main() {
  late TalkRoomBloc bloc;

  setUpAll(() {
    KeyboardVisibilityTesting.setVisibilityForTesting(true);
  });

  setUp(() {
    FakeNeonStorage.setup();

    bloc = MockRoomBloc();
    when(() => bloc.replyTo).thenAnswer((_) => BehaviorSubject.seeded(null));
  });

  testWidgets('Cupertino no emoji button', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        platform: TargetPlatform.iOS,
        child: const Material(
          child: TalkMessageInput(),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOne);
    expect(find.byIcon(Icons.emoji_emotions_outlined), findsNothing);
    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/message_input_no_emoji_button.png'));
  });

  testWidgets('Emoji button', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: const TalkMessageInput(),
      ),
    );

    expect(find.byType(TextFormField), findsOne);
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

    await expectLater(find.byType(TextField), matchesGoldenFile('goldens/message_input_emoji.png'));

    await tester.testTextInput.receiveAction(TextInputAction.send);
    verify(() => bloc.sendMessage('123😀456')).called(1);
  });

  testWidgets('Mention suggestions', (tester) async {
    final account = mockTalkAccount();

    final room = MockRoom();
    when(() => room.token).thenReturn('token');
    when(() => bloc.room).thenAnswer((_) => BehaviorSubject.seeded(Result.success(room)));

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
          Provider<Account>.value(value: account),
        ],
        child: const Align(
          alignment: Alignment.bottomCenter,
          child: TalkMessageInput(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '123 @gr');
    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsOne);
    expect(find.byIcon(AdaptiveIcons.group), findsOne);
    expect(find.text('label'), findsOne);
    expect(find.text('id'), findsOne);

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/message_input_mention_suggestions.png'));

    await tester.tap(find.byType(ListTile));
    await tester.testTextInput.receiveAction(TextInputAction.send);
    verify(() => bloc.sendMessage('123 @"id" ')).called(1);
  });

  testWidgets('Multiline', (tester) async {
    final account = mockTalkAccount();

    final room = MockRoom();
    when(() => room.token).thenReturn('token');
    when(() => bloc.room).thenAnswer((_) => BehaviorSubject.seeded(Result.success(room)));

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
          Provider<Account>.value(value: account),
        ],
        child: const Align(
          alignment: Alignment.bottomCenter,
          child: TalkMessageInput(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), '123456');

    for (var i = 0; i < 3; i++) {
      await simulateKeyDownEvent(LogicalKeyboardKey.arrowLeft);
      await simulateKeyUpEvent(LogicalKeyboardKey.arrowLeft);
    }

    await simulateKeyDownEvent(LogicalKeyboardKey.shift);
    await simulateKeyDownEvent(LogicalKeyboardKey.enter);
    await simulateKeyUpEvent(LogicalKeyboardKey.shift);
    await simulateKeyUpEvent(LogicalKeyboardKey.enter);

    await tester.pumpAndSettle();

    await expectLater(find.byType(TestApp), matchesGoldenFile('goldens/message_input_multiline.png'));

    await simulateKeyDownEvent(LogicalKeyboardKey.enter);
    await simulateKeyUpEvent(LogicalKeyboardKey.enter);

    verify(() => bloc.sendMessage('123\n456')).called(1);
  });
}

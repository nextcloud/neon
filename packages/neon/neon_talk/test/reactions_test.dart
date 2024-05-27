import 'package:built_collection/built_collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/widgets/reactions.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'testing.dart';

spreed.Reaction getReaction() {
  final reaction = MockReaction();
  when(() => reaction.actorDisplayName).thenReturn('actorDisplayName');

  return reaction;
}

void main() {
  late spreed.ChatMessage chatMessage;
  late TalkRoomBloc bloc;

  setUp(() {
    chatMessage = MockChatMessage();
    when(() => chatMessage.id).thenReturn(0);
    when(() => chatMessage.reactions).thenReturn(BuiltMap({'😀': 1, '😊': 2}));
    when(() => chatMessage.reactionsSelf).thenReturn(BuiltList(['😊']));

    bloc = MockRoomBloc();
    when(() => bloc.reactions).thenAnswer(
      (_) => BehaviorSubject.seeded(
        BuiltMap({
          0: BuiltMap<String, BuiltList<spreed.Reaction>>({
            '😀': BuiltList<spreed.Reaction>([getReaction()]),
            '😊': BuiltList<spreed.Reaction>([getReaction(), getReaction()]),
          }),
        }),
      ),
    );
  });

  testWidgets('Reactions', (tester) async {
    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byTooltip('actorDisplayName'), findsOne);
    expect(find.byTooltip('actorDisplayName, actorDisplayName'), findsOne);
    await expectLater(find.byType(TalkReactions), matchesGoldenFile('goldens/reactions.png'));
  });

  testWidgets('Add reaction', (tester) async {
    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    await tester.tap(find.text('😀'));

    verify(() => bloc.addReaction(chatMessage, '😀')).called(1);
  });

  testWidgets('Remove reaction', (tester) async {
    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    await tester.tap(find.text('😊'));

    verify(() => bloc.removeReaction(chatMessage, '😊')).called(1);
  });

  testWidgets('Add new reaction', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    await tester.runAsync(() async {
      await tester.tap(find.byIcon(Icons.add_reaction_outlined));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.tag_faces));
      await tester.pumpAndSettle();
      await tester.tap(find.text('😂'));
      await tester.pumpAndSettle();

      verify(() => bloc.addReaction(chatMessage, '😂')).called(1);
    });
  });

  testWidgets('Load reactions on hover', (tester) async {
    await tester.pumpWidget(
      TestApp(
        providers: [
          NeonProvider<TalkRoomBloc>.value(value: bloc),
        ],
        child: TalkReactions(
          chatMessage: chatMessage,
        ),
      ),
    );

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);
    await tester.pump();
    await gesture.moveTo(tester.getCenter(find.byType(TalkReactions)));
    await tester.pumpAndSettle();

    verify(() => bloc.loadReactions(chatMessage)).called(1);
  });
}

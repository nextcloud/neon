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
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talk_app/l10n/localizations.dart';
import 'package:talk_app/l10n/localizations_en.dart';
import 'package:talk_app/src/blocs/room.dart';
import 'package:talk_app/src/widgets/actor_avatar.dart';
import 'package:talk_app/src/widgets/message.dart';
import 'package:talk_app/src/widgets/reactions.dart';
import 'package:talk_app/src/widgets/read_indicator.dart';
import 'package:talk_app/src/widgets/reference_preview.dart';
import 'package:talk_app/src/widgets/rich_object/deck_card.dart';
import 'package:talk_app/src/widgets/rich_object/fallback.dart';
import 'package:talk_app/src/widgets/rich_object/file.dart';
import 'package:talk_app/src/widgets/rich_object/mention.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import 'testing.dart';

class MockOnReferenceClickedCallback extends Mock {
  void call(String reference);
}

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

core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data buildCapabilities(core.SpreedCapabilities spreedCapabilities) =>
    core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data(
      (b) => b
        ..version.update(
          (b) => b
            ..major = 0
            ..minor = 0
            ..micro = 0
            ..string = ''
            ..edition = ''
            ..extendedSupport = false,
        )
        ..capabilities = (
          commentsCapabilities: null,
          coreCapabilities: null,
          corePublicCapabilities: null,
          davCapabilities: null,
          dropAccountCapabilities: null,
          filesCapabilities: null,
          filesSharingCapabilities: null,
          filesTrashbinCapabilities: null,
          filesVersionsCapabilities: null,
          notesCapabilities: null,
          notificationsCapabilities: null,
          provisioningApiCapabilities: null,
          sharebymailCapabilities: null,
          spreedCapabilities: null,
          spreedPublicCapabilities: (
            builtListNever: null,
            spreedPublicCapabilities0: core.SpreedPublicCapabilities0(
              (b) => b.spreed.replace(spreedCapabilities),
            ),
          ) as core.SpreedPublicCapabilities,
          systemtagsCapabilities: null,
          tablesCapabilities: null,
          themingPublicCapabilities: null,
          userStatusCapabilities: null,
          weatherStatusCapabilities: null,
        ),
    );

void main() {
  late spreed.Room room;
  late ReferencesBloc referencesBloc;
  late CapabilitiesBloc capabilitiesBloc;
  late core.SpreedCapabilities capabilities;

  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(Uri());

    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Berlin'));
  });

  setUp(() {
    room = MockRoom();
    when(() => room.readOnly).thenReturn(0);
    when(() => room.permissions).thenReturn(spreed.ParticipantPermission.canSendMessageAndShareAndReact.binary);
    when(() => room.actorId).thenReturn('test');

    referencesBloc = MockReferencesBloc();
    when(() => referencesBloc.referenceRegex).thenAnswer((_) => BehaviorSubject.seeded(Result.success(null)));
    when(() => referencesBloc.references).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

    capabilities = core.SpreedCapabilities(
      (b) => b
        ..features.replace(['edit-messages'])
        ..config.update(
          (b) => b
            ..attachments.update(
              (b) => b.allowed = false,
            )
            ..call.update(
              (b) => b
                ..enabled = false
                ..breakoutRooms = false
                ..recording = false
                ..recordingConsent = 0
                ..canUploadBackground = false
                ..sipEnabled = false
                ..sipDialoutEnabled = false
                ..canEnableSip = false,
            )
            ..chat.update(
              (b) => b
                ..maxLength = 0
                ..readPrivacy = 0
                ..hasTranslationProviders = false
                ..typingPrivacy = 0,
            )
            ..conversations.update(
              (b) => b.canCreate = false,
            )
            ..previews.update(
              (b) => b..maxGifSize = 0,
            )
            ..signaling.update(
              (b) => b..sessionPingLimit = 0,
            ),
        )
        ..version = '',
    );

    capabilitiesBloc = MockCapabilitiesBloc();
    when(() => capabilitiesBloc.capabilities).thenAnswer(
      (_) => BehaviorSubject.seeded(
        Result.success(
          buildCapabilities(capabilities),
        ),
      ),
    );
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
            room: room,
            chatMessage: chatMessage,
            lastCommonRead: null,
          ),
        ),
      );
      expect(find.byType(TalkSystemMessage), findsOne);
    });

    testWidgets('Comment', (tester) async {
      final account = MockAccount();

      final chatMessage = MockChatMessage();
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('');
      when(() => chatMessage.message).thenReturn('');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
      when(() => chatMessage.isReplyable).thenReturn(true);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
            NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
          ],
          child: TalkMessage(
            room: room,
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
          NeonProvider<ReferencesBloc>.value(value: referencesBloc),
        ],
        child: TalkParentMessage(
          room: room,
          parentChatMessage: chatMessage,
          lastCommonRead: null,
        ),
      ),
    );
    expect(find.byType(TalkCommentMessage), findsOne);
    await expectLater(find.byType(TalkParentMessage), matchesGoldenFile('goldens/message_parent_message.png'));
  });

  group('TalkCommentMessage', () {
    testWidgets('Self', (tester) async {
      final account = MockAccount(username: 'test');

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
      when(() => chatMessage.isReplyable).thenReturn(true);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
            NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
          ],
          child: TalkCommentMessage(
            room: room,
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
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_self.png'),
      );
    });

    testWidgets('Other', (tester) async {
      final account = MockAccount();

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
      when(() => chatMessage.isReplyable).thenReturn(true);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
            NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
          ],
          child: TalkCommentMessage(
            room: room,
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
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_other.png'),
      );
    });

    testWidgets('Deleted', (tester) async {
      final account = MockAccount();

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
      when(() => chatMessage.isReplyable).thenReturn(true);

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
            NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
          ],
          child: TalkCommentMessage(
            room: room,
            chatMessage: chatMessage,
            lastCommonRead: null,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.text('abc', findRichText: true), findsOne);
      expect(find.byIcon(AdaptiveIcons.cancel), findsOne);
      expect(find.byType(TalkReactions), findsNothing);
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_deleted.png'),
      );
    });

    testWidgets('As parent', (tester) async {
      final account = MockAccount();

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
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
          ],
          child: TalkCommentMessage(
            room: room,
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
      await expectLater(
        find.byType(TalkCommentMessage),
        matchesGoldenFile('goldens/message_comment_message_as_parent.png'),
      );
    });

    testWidgets('With parent', (tester) async {
      final account = MockAccount();

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
      when(() => chatMessage.parent).thenReturn((chatMessage: parentChatMessage, deletedChatMessage: null));
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
      when(() => chatMessage.isReplyable).thenReturn(true);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
            NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
          ],
          child: TalkCommentMessage(
            room: room,
            chatMessage: chatMessage,
            lastCommonRead: null,
            previousChatMessage: previousChatMessage,
          ),
        ),
      );
      expect(find.byType(TalkParentMessage), findsOne);
      expect(find.byType(TalkReactions), findsNothing);
      await expectLater(
        find.byType(TalkCommentMessage).first,
        matchesGoldenFile('goldens/message_comment_message_with_parent.png'),
      );
    });

    testWidgets('With references', (tester) async {
      when(() => referencesBloc.referenceRegex).thenAnswer(
        (_) => BehaviorSubject.seeded(Result.success(RegExp('[a-z]+'))),
      );

      final openGraphObject = MockOpenGraphObject();
      when(() => openGraphObject.name).thenReturn('name');
      when(() => openGraphObject.link).thenReturn('/link');

      final reference = MockReference();
      when(() => reference.openGraphObject).thenReturn(openGraphObject);

      final brokenOpenGraphObject = MockOpenGraphObject();
      when(() => brokenOpenGraphObject.name).thenReturn('c');
      when(() => brokenOpenGraphObject.link).thenReturn('/link');

      final brokenReference = MockReference();
      when(() => brokenReference.openGraphObject).thenReturn(brokenOpenGraphObject);

      when(() => referencesBloc.references).thenAnswer(
        (_) => BehaviorSubject.seeded(
          BuiltMap({
            'a': Result.success(reference),
            'b': Result.success(reference),
            'c': Result.success(brokenReference),
          }),
        ),
      );

      final account = MockAccount();

      final chatMessage = MockChatMessageWithParent();
      when(() => chatMessage.id).thenReturn(0);
      when(() => chatMessage.timestamp).thenReturn(0);
      when(() => chatMessage.actorId).thenReturn('test');
      when(() => chatMessage.actorType).thenReturn(spreed.ActorType.users);
      when(() => chatMessage.actorDisplayName).thenReturn('test');
      when(() => chatMessage.messageType).thenReturn(spreed.MessageType.comment);
      when(() => chatMessage.message).thenReturn('a b c');
      when(() => chatMessage.reactions).thenReturn(BuiltMap());
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());
      when(() => chatMessage.isReplyable).thenReturn(true);

      final roomBloc = MockRoomBloc();
      when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

      await tester.pumpWidgetWithAccessibility(
        wrapWidget(
          providers: [
            Provider<Account>.value(value: account),
            NeonProvider<TalkRoomBloc>.value(value: roomBloc),
            NeonProvider<ReferencesBloc>.value(value: referencesBloc),
            NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
          ],
          child: TalkCommentMessage(
            room: room,
            chatMessage: chatMessage,
            lastCommonRead: null,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TalkReferencePreview), findsExactly(2));
      for (final url in ['a', 'b']) {
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is TalkReferencePreview && widget.url == url && widget.openGraphObject == openGraphObject,
          ),
          findsOne,
        );
      }

      await expectLater(
        find.byType(TalkCommentMessage).first,
        matchesGoldenFile('goldens/message_comment_message_with_references.png'),
      );
    });

    group('Separate messages', () {
      testWidgets('Actor', (tester) async {
        final account = MockAccount();

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
        when(() => chatMessage.isReplyable).thenReturn(true);

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
              NeonProvider<ReferencesBloc>.value(value: referencesBloc),
              NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
            ],
            child: TalkCommentMessage(
              room: room,
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
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_actor.png'),
        );
      });

      testWidgets('Time', (tester) async {
        final account = MockAccount();

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
        when(() => chatMessage.isReplyable).thenReturn(true);

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
              NeonProvider<ReferencesBloc>.value(value: referencesBloc),
              NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
            ],
            child: TalkCommentMessage(
              room: room,
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
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_time.png'),
        );
      });

      testWidgets('System message', (tester) async {
        final account = MockAccount();

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
        when(() => chatMessage.isReplyable).thenReturn(true);

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
              NeonProvider<ReferencesBloc>.value(value: referencesBloc),
              NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
            ],
            child: TalkCommentMessage(
              room: room,
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
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_system_message.png'),
        );
      });

      testWidgets('Edited', (tester) async {
        final account = MockAccount();

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
        when(() => chatMessage.lastEditTimestamp).thenReturn(0);
        when(() => chatMessage.lastEditActorDisplayName).thenReturn('test');
        when(() => chatMessage.isReplyable).thenReturn(true);

        final roomBloc = MockRoomBloc();
        when(() => roomBloc.reactions).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
              NeonProvider<ReferencesBloc>.value(value: referencesBloc),
              NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
            ],
            child: TalkCommentMessage(
              room: room,
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
        expect(find.text(' (edited)'), findsOne);
        expect(find.byTooltip('Last edited by test at 1/1/1970 1:00 AM'), findsOne);
        expect(find.text('abc', findRichText: true), findsOne);
        expect(find.byType(TalkReactions), findsOne);
        await expectLater(
          find.byType(TalkCommentMessage),
          matchesGoldenFile('goldens/message_comment_message_separate_edited.png'),
        );
      });
    });

    group('Menu', () {
      late Account account;
      late spreed.ChatMessage chatMessage;
      late TalkRoomBloc roomBloc;

      setUp(() {
        account = MockAccount();

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

      testWidgets('Close', (tester) async {
        SharedPreferences.setMockInitialValues({});

        when(() => room.readOnly).thenReturn(0);
        when(() => room.permissions).thenReturn(spreed.ParticipantPermission.canSendMessageAndShareAndReact.binary);
        when(() => room.actorId).thenReturn('test');

        await tester.pumpWidgetWithAccessibility(
          wrapWidget(
            providers: [
              Provider<Account>.value(value: account),
              NeonProvider<TalkRoomBloc>.value(value: roomBloc),
              NeonProvider<ReferencesBloc>.value(value: referencesBloc),
              NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
            ],
            child: TalkCommentMessage(
              room: room,
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
        expect(find.byIcon(Icons.add_reaction_outlined), findsOne);

        await tester.tap(find.byIcon(Icons.more_vert));
        await tester.pumpAndSettle();
        expect(find.byIcon(Icons.add_reaction_outlined), findsNothing);
      });

      group('Add reaction', () {
        testWidgets('Allowed', (tester) async {
          SharedPreferences.setMockInitialValues({});

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
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

        testWidgets('Read-only', (tester) async {
          SharedPreferences.setMockInitialValues({});

          when(() => room.readOnly).thenReturn(1);

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.add_reaction_outlined), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.add_reaction_outlined), findsNothing);
        });

        testWidgets('No permission', (tester) async {
          SharedPreferences.setMockInitialValues({});

          when(() => room.permissions).thenReturn(0);

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.add_reaction_outlined), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.add_reaction_outlined), findsNothing);
        });
      });

      group('Reply', () {
        testWidgets('Allowed', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          await tester.runAsync(() async {
            await tester.tap(find.byIcon(Icons.reply));
            await tester.pumpAndSettle();
            verify(() => roomBloc.setReplyChatMessage(chatMessage)).called(1);
          });
        });

        testWidgets('Read-only', (tester) async {
          when(() => room.readOnly).thenReturn(1);

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.reply), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.reply), findsNothing);
        });

        testWidgets('No permission', (tester) async {
          when(() => room.permissions).thenReturn(0);

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.reply), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.reply), findsNothing);
        });
      });

      group('Edit', () {
        testWidgets('Comment self', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
            await tester.tap(find.byIcon(Icons.edit));
            await tester.pumpAndSettle();
            verify(() => roomBloc.setEditChatMessage(chatMessage)).called(1);
          });

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          await tester.runAsync(() async {
            await tester.tap(find.byIcon(Icons.edit));
            await tester.pumpAndSettle();
            verify(() => roomBloc.setEditChatMessage(chatMessage)).called(1);
          });
        });

        testWidgets('Comment other', (tester) async {
          when(() => room.actorId).thenReturn('other');

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.edit), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.edit), findsNothing);
        });

        testWidgets('Deleted', (tester) async {
          when(() => chatMessage.messageType).thenReturn(spreed.MessageType.commentDeleted);

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.more_vert), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage), warnIfMissed: false);
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsNothing);
        });

        testWidgets('No feature', (tester) async {
          capabilities = capabilities.rebuild((b) => b.features.clear());

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.edit), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.edit), findsNothing);
        });
      });

      group('Delete', () {
        testWidgets('Comment self', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
            await tester.tap(find.byIcon(Icons.delete_forever));
            await tester.pumpAndSettle();
            verify(() => roomBloc.deleteMessage(chatMessage)).called(1);
          });

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          await tester.runAsync(() async {
            await tester.tap(find.byIcon(Icons.delete_forever));
            await tester.pumpAndSettle();
            verify(() => roomBloc.deleteMessage(chatMessage)).called(1);
          });
        });

        testWidgets('Comment other', (tester) async {
          when(() => room.actorId).thenReturn('other');

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.delete_forever), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage));
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsOne);
          expect(find.byIcon(Icons.delete_forever), findsNothing);
        });

        testWidgets('Deleted', (tester) async {
          when(() => chatMessage.messageType).thenReturn(spreed.MessageType.commentDeleted);

          await tester.pumpWidgetWithAccessibility(
            wrapWidget(
              providers: [
                Provider<Account>.value(value: account),
                NeonProvider<TalkRoomBloc>.value(value: roomBloc),
                NeonProvider<ReferencesBloc>.value(value: referencesBloc),
                NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
              ],
              child: TalkCommentMessage(
                room: room,
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
          expect(find.byIcon(Icons.more_vert), findsNothing);

          await tester.longPress(find.byType(TalkCommentMessage), warnIfMissed: false);
          await tester.pumpAndSettle();
          expect(find.byType(BottomSheet), findsNothing);
        });
      });
    });
  });

  group('buildRichObjectParameter', () {
    for (final isPreview in [true, false]) {
      group(isPreview ? 'As preview' : 'Complete', () {
        group('Mention', () {
          for (final type in [
            spreed.RichObjectParameter_Type.user,
            spreed.RichObjectParameter_Type.call,
            spreed.RichObjectParameter_Type.guest,
            spreed.RichObjectParameter_Type.userGroup,
            spreed.RichObjectParameter_Type.group,
          ]) {
            testWidgets(type.value, (tester) async {
              final userDetails = MockUserDetails();
              when(() => userDetails.groups).thenReturn(BuiltList());

              final userDetailsBloc = MockUserDetailsBloc();
              when(() => userDetailsBloc.userDetails)
                  .thenAnswer((_) => BehaviorSubject.seeded(Result.success(userDetails)));

              final account = MockAccount();

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
          final account = MockAccount();

          await tester.pumpWidgetWithAccessibility(
            TestApp(
              providers: [
                Provider<Account>.value(value: account),
              ],
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: spreed.RichObjectParameter(
                    (b) => b
                      ..type = spreed.RichObjectParameter_Type.file
                      ..id = '0'
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
                      ..type = spreed.RichObjectParameter_Type.deckCard
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
                      ..type = spreed.RichObjectParameter_Type.addressbook
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

      var span = buildChatMessage(
        chatMessage: chatMessage,
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!.single as TextSpan;
      expect(span.text, '123\n456');

      span = buildChatMessage(
        chatMessage: chatMessage,
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
        isPreview: true,
      ).children!.single as TextSpan;
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
                    ..type = spreed.RichObjectParameter_Type.user
                    ..id = ''
                    ..name = '',
                ),
              }),
            );

            final spans = buildChatMessage(
              chatMessage: chatMessage,
              references: BuiltList(),
              style: const TextStyle(),
              onReferenceClicked: (_) {},
            ).children!;
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
                ..type = spreed.RichObjectParameter_Type.file
                ..id = ''
                ..name = '',
            ),
          }),
        );

        final spans = buildChatMessage(
          chatMessage: chatMessage,
          references: BuiltList(),
          style: const TextStyle(),
          onReferenceClicked: (_) {},
        ).children!;
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
              ..type = spreed.RichObjectParameter_Type.user
              ..id = ''
              ..name = '',
          ),
          'actor2': spreed.RichObjectParameter(
            (b) => b
              ..type = spreed.RichObjectParameter_Type.user
              ..id = ''
              ..name = '',
          ),
        }),
      );

      final spans = buildChatMessage(
        chatMessage: chatMessage,
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!;
      expect(spans, hasLength(5));
      expect((spans[0] as TextSpan).text, '123 ');
      expect((spans[1] as WidgetSpan).child, isA<TalkRichObjectMention>());
      expect((spans[2] as TextSpan).text, ' 456 ');
      expect((spans[3] as WidgetSpan).child, isA<TalkRichObjectMention>());
      expect((spans[4] as TextSpan).text, ' 789');
    });

    test('References', () {
      final chatMessage = MockChatMessage();
      when(() => chatMessage.message).thenReturn('a 123 b 456 c');
      when(() => chatMessage.messageParameters).thenReturn(BuiltMap());

      final callback = MockOnReferenceClickedCallback();

      final spans = buildChatMessage(
        chatMessage: chatMessage,
        references: BuiltList(['123', '456']),
        style: const TextStyle(),
        onReferenceClicked: callback.call,
      ).children!;
      expect(spans, hasLength(5));

      expect((spans[0] as TextSpan).text, 'a ');

      final link1 = spans[1] as TextSpan;
      expect(link1.text, '123');
      (link1.recognizer! as TapGestureRecognizer).onTap!();
      verify(() => callback('123')).called(1);

      expect((spans[2] as TextSpan).text, ' b ');

      final link2 = spans[3] as TextSpan;
      expect(link2.text, '456');
      (link2.recognizer! as TapGestureRecognizer).onTap!();
      verify(() => callback('456')).called(1);

      expect((spans[4] as TextSpan).text, ' c');
    });
  });
}

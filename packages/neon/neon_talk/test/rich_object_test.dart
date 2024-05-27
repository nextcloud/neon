import 'package:built_collection/built_collection.dart';
import 'package:file_icons/file_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/widgets/rich_object/deck_card.dart';
import 'package:neon_talk/src/widgets/rich_object/fallback.dart';
import 'package:neon_talk/src/widgets/rich_object/file.dart';
import 'package:neon_talk/src/widgets/rich_object/file_preview.dart';
import 'package:neon_talk/src/widgets/rich_object/mention.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';

void main() {
  late Account account;
  late AccountsBloc accountsBloc;

  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(Uri());
  });

  setUp(() {
    account = MockAccount();
    when(() => account.username).thenReturn('username');
    when(() => account.client).thenReturn(
      NextcloudClient(
        Uri(),
        loginName: '',
        password: '',
      ),
    );
    when(() => account.completeUri(any())).thenAnswer((invocation) => invocation.positionalArguments[0]! as Uri);

    accountsBloc = MockAccountsBloc();
    when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));
  });

  testWidgets('Deck card', (tester) async {
    await tester.pumpWidget(
      TestApp(
        child: TalkRichObjectDeckCard(
          parameter: spreed.RichObjectParameter(
            (b) => b
              ..type = ''
              ..id = ''
              ..name = 'name'
              ..boardname = 'boardname'
              ..stackname = 'stackname',
          ),
        ),
      ),
    );
    expect(find.text('name'), findsOne);
    expect(find.text('boardname: stackname'), findsOne);
    await expectLater(
      find.byType(TalkRichObjectDeckCard),
      matchesGoldenFile('goldens/rich_object_deck_card.png'),
    );
  });

  group('Mention', () {
    testWidgets('user', (tester) async {
      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectMention(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = 'user'
                ..id = 'username'
                ..name = 'name',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(NeonUserAvatar), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectMention),
        matchesGoldenFile('goldens/rich_object_mention_user_highlight.png'),
      );

      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectMention(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = 'user'
                ..id = 'other'
                ..name = 'name',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(NeonUserAvatar), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectMention),
        matchesGoldenFile('goldens/rich_object_mention_user_other.png'),
      );
    });

    testWidgets('call', (tester) async {
      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectMention(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = 'call'
                ..id = ''
                ..name = 'name'
                ..iconUrl = '',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(NeonUriImage), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectMention),
        matchesGoldenFile('goldens/rich_object_mention_call.png'),
      );
    });

    testWidgets('guest', (tester) async {
      await tester.pumpWidget(
        TestApp(
          child: TalkRichObjectMention(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = 'guest'
                ..id = ''
                ..name = 'name',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byIcon(AdaptiveIcons.person), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectMention),
        matchesGoldenFile('goldens/rich_object_mention_guest.png'),
      );
    });

    for (final type in ['user-group', 'group']) {
      testWidgets(type, (tester) async {
        final userDetails = MockUserDetails();
        when(() => userDetails.groups).thenReturn(BuiltList(['group']));

        final userDetailsBloc = MockUserDetailsBloc();
        when(() => userDetailsBloc.userDetails).thenAnswer((_) => BehaviorSubject.seeded(Result.success(userDetails)));

        when(() => accountsBloc.activeUserDetailsBloc).thenReturn(userDetailsBloc);

        await tester.pumpWidget(
          TestApp(
            providers: [
              NeonProvider<AccountsBloc>.value(value: accountsBloc),
            ],
            child: TalkRichObjectMention(
              parameter: spreed.RichObjectParameter(
                (b) => b
                  ..type = type
                  ..id = 'group'
                  ..name = 'name',
              ),
              textStyle: null,
            ),
          ),
        );
        expect(find.byIcon(AdaptiveIcons.group), findsOne);
        expect(find.text('name'), findsOne);
        await expectLater(
          find.byType(TalkRichObjectMention),
          matchesGoldenFile('goldens/rich_object_mention_${type}_highlight.png'),
        );

        await tester.pumpWidget(
          TestApp(
            providers: [
              NeonProvider<AccountsBloc>.value(value: accountsBloc),
            ],
            child: TalkRichObjectMention(
              parameter: spreed.RichObjectParameter(
                (b) => b
                  ..type = type
                  ..id = 'other'
                  ..name = 'name',
              ),
              textStyle: null,
            ),
          ),
        );
        expect(find.byIcon(AdaptiveIcons.group), findsOne);
        expect(find.text('name'), findsOne);
        await expectLater(
          find.byType(TalkRichObjectMention),
          matchesGoldenFile('goldens/rich_object_mention_${type}_other.png'),
        );
      });
    }
  });

  group('File', () {
    testWidgets('With preview', (tester) async {
      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = '',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(TalkRichObjectFilePreview), findsOne);
    });

    testWidgets('Without preview', (tester) async {
      await tester.pumpWidget(
        TestApp(
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.no
                ..path = '',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(FileIcon), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectFile),
        matchesGoldenFile('goldens/rich_object_file_without_preview.png'),
      );
    });
  });

  group('File preview', () {
    testWidgets('Without dimensions', (tester) async {
      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = 'path',
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints.loose(const Size(double.infinity, 300));
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      const expectedCacheKey = 'preview-path--1--1';
      expect(
        find.byWidgetPredicate((widget) => widget is NeonApiImage && widget.cacheKey == expectedCacheKey),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('With dimensions', (tester) async {
      // Default device pixel ratio for tests is 3, so we don't need to set it manually to ensure the calculations are right.

      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = 'path'
                ..width = ($int: 900, string: null)
                ..height = ($int: 300, string: null),
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints.tight(const Size(300, 100));
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      const expectedCacheKey = 'preview-path-900-300';
      expect(
        find.byWidgetPredicate((widget) => widget is NeonApiImage && widget.cacheKey == expectedCacheKey),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('With dimensions too big', (tester) async {
      // Default device pixel ratio for tests is 3, so we don't need to set it manually to ensure the calculations are right.

      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = 'path'
                ..width = ($int: 6000, string: null)
                ..height = ($int: 2000, string: null),
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints.tight(const Size(900, 300));
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      const expectedCacheKey = 'preview-path-2700-900';
      expect(
        find.byWidgetPredicate((widget) => widget is NeonApiImage && widget.cacheKey == expectedCacheKey),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });
  });

  group('Fallback', () {
    testWidgets('Without icon', (tester) async {
      await tester.pumpWidget(
        TestApp(
          child: TalkRichObjectFallback(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = ''
                ..name = 'name',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(NeonUriImage), findsNothing);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectFallback),
        matchesGoldenFile('goldens/rich_object_fallback_without_icon.png'),
      );
    });

    testWidgets('With icon', (tester) async {
      await tester.pumpWidget(
        TestApp(
          providers: [
            NeonProvider<AccountsBloc>.value(value: accountsBloc),
          ],
          child: TalkRichObjectFallback(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = ''
                ..name = 'name'
                ..iconUrl = '',
            ),
            textStyle: null,
          ),
        ),
      );
      expect(find.byType(NeonUriImage), findsOne);
      expect(find.text('name'), findsOne);
      await expectLater(
        find.byType(TalkRichObjectFallback),
        matchesGoldenFile('goldens/rich_object_fallback_with_icon.png'),
      );
    });
  });
}

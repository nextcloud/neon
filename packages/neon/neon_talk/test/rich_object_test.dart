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
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  late Account account;

  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(Uri());
  });

  setUp(() {
    account = MockAccount();
    when(() => account.username).thenReturn('username');
    when(() => account.serverURL).thenReturn(Uri.parse('http://example.com'));
    when(() => account.client).thenReturn(
      NextcloudClient(
        Uri(),
        loginName: '',
        password: '',
      ),
    );
  });

  testWidgets('Deck card', (tester) async {
    final router = MockGoRouter();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        router: router,
        child: TalkRichObjectDeckCard(
          parameter: spreed.RichObjectParameter(
            (b) => b
              ..type = ''
              ..id = ''
              ..name = 'name'
              ..boardname = 'boardname'
              ..stackname = 'stackname'
              ..link = '/link',
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

    await tester.tap(find.byType(TalkRichObjectDeckCard));
    verify(() => router.go('/link')).called(1);
  });

  group('Mention', () {
    group('user', () {
      testWidgets('Self', (tester) async {
        await tester.pumpWidgetWithAccessibility(
          TestApp(
            providers: [
              Provider<Account>.value(value: account),
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
      });

      testWidgets('Other', (tester) async {
        await tester.pumpWidgetWithAccessibility(
          TestApp(
            providers: [
              Provider<Account>.value(value: account),
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
    });

    testWidgets('call', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
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
      await tester.pumpWidgetWithAccessibility(
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

        await tester.pumpWidgetWithAccessibility(
          TestApp(
            providers: [
              NeonProvider<UserDetailsBloc>.value(value: userDetailsBloc),
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

        await tester.pumpWidgetWithAccessibility(
          TestApp(
            providers: [
              NeonProvider<UserDetailsBloc>.value(value: userDetailsBloc),
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
    testWidgets('Opens link', (tester) async {
      final router = MockGoRouter();

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          router: router,
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.no
                ..path = ''
                ..link = '/link',
            ),
            textStyle: null,
          ),
        ),
      );

      await tester.tap(find.byType(TalkRichObjectFile));
      verify(() => router.go('/link')).called(1);
    });

    testWidgets('With preview', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
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
      await tester.pumpWidgetWithAccessibility(
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
    const pixelRatio = 3;
    const maxWidth = 800;
    const maxHeight = 600 ~/ 2;

    testWidgets('Without dimensions', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
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

      final expectedConstraints = BoxConstraints.loose(Size(maxWidth.toDouble(), maxHeight.toDouble()));
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
      const width = 900;
      const height = 300;

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = 'path'
                ..width = ($int: width, string: null)
                ..height = ($int: height, string: null),
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints.tight(const Size(width / pixelRatio, height / pixelRatio));
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      const expectedCacheKey = 'preview-path-$width-$height';
      expect(
        find.byWidgetPredicate((widget) => widget is NeonApiImage && widget.cacheKey == expectedCacheKey),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('With dimensions too big', (tester) async {
      const widthFactor = 2; // Make it too big
      const heightFactor = 4; // Make this even bigger

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = 'path'
                ..width = ($int: (maxWidth * widthFactor) * pixelRatio, string: null)
                ..height = ($int: (maxHeight * heightFactor) * pixelRatio, string: null),
            ),
            textStyle: null,
          ),
        ),
      );

      final size = Size(
        widthFactor * maxWidth / heightFactor,
        maxHeight.toDouble(),
      );
      final expectedConstraints = BoxConstraints.tight(size);
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      final expectedCacheKey =
          'preview-path-${(size.width * pixelRatio).toInt()}-${(size.height * pixelRatio).toInt()}';
      expect(
        find.byWidgetPredicate((widget) => widget is NeonApiImage && widget.cacheKey == expectedCacheKey),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('Full image for animated GIF', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: TalkRichObjectFile(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = spreed.RichObjectParameter_PreviewAvailable.yes
                ..path = 'path'
                ..mimetype = 'image/gif',
            ),
            textStyle: null,
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is NeonUriImage &&
              widget.uri.toString() == 'http://example.com/remote.php/dav/files/username/path',
        ),
        findsOne,
      );
    });
  });

  group('Fallback', () {
    testWidgets('Opens link', (tester) async {
      final router = MockGoRouter();

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          router: router,
          child: TalkRichObjectFallback(
            parameter: spreed.RichObjectParameter(
              (b) => b
                ..type = ''
                ..id = ''
                ..name = 'name'
                ..link = '/link',
            ),
            textStyle: null,
          ),
        ),
      );

      await tester.tap(find.byType(TalkRichObjectFallback));
      verify(() => router.go('/link')).called(1);
    });

    testWidgets('Without icon', (tester) async {
      await tester.pumpWidgetWithAccessibility(
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
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
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

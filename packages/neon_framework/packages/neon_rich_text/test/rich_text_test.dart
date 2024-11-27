import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_rich_text/neon_rich_text.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

const validBlurHash = 'LEHLk~WB2yk8pyo0adR*.7kCMdnj';

class MockOnReferenceClickedCallback extends Mock {
  void call(String reference);
}

void main() {
  late MockUrlLauncher urlLauncher;
  late Account account;

  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(const LaunchOptions());

    urlLauncher = MockUrlLauncher();
    // ignore: discarded_futures
    when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    UrlLauncherPlatform.instance = urlLauncher;
  });

  setUp(() {
    account = MockAccount();
  });

  testWidgets('Deck card', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: NeonRichObjectDeckCard(
          parameter: core.RichObjectParameter(
            (b) => b
              ..type = core.RichObjectParameter_Type.deckCard
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
      find.byType(NeonRichObjectDeckCard),
      matchesGoldenFile('goldens/rich_text_object_deck_card.png'),
    );

    await tester.tap(find.byType(NeonRichObjectDeckCard));
    verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
  });

  group('Mention', () {
    group('user', () {
      testWidgets('Self', (tester) async {
        await tester.pumpWidgetWithAccessibility(
          TestApp(
            providers: [
              Provider<Account>.value(value: account),
            ],
            child: NeonRichObjectMention(
              parameter: core.RichObjectParameter(
                (b) => b
                  ..type = core.RichObjectParameter_Type.user
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
          find.byType(NeonRichObjectMention),
          matchesGoldenFile('goldens/rich_text_object_mention_user_highlight.png'),
        );
      });

      testWidgets('Other', (tester) async {
        await tester.pumpWidgetWithAccessibility(
          TestApp(
            providers: [
              Provider<Account>.value(value: account),
            ],
            child: NeonRichObjectMention(
              parameter: core.RichObjectParameter(
                (b) => b
                  ..type = core.RichObjectParameter_Type.user
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
          find.byType(NeonRichObjectMention),
          matchesGoldenFile('goldens/rich_text_object_mention_user_other.png'),
        );
      });
    });

    testWidgets('call', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectMention(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.call
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
        find.byType(NeonRichObjectMention),
        matchesGoldenFile('goldens/rich_text_object_mention_call.png'),
      );
    });

    testWidgets('guest', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonRichObjectMention(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.guest
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
        find.byType(NeonRichObjectMention),
        matchesGoldenFile('goldens/rich_text_object_mention_guest.png'),
      );
    });

    testWidgets('user-group', (tester) async {
      final userDetails = MockUserDetails();
      when(() => userDetails.groups).thenReturn(BuiltList(['group']));

      final userDetailsBloc = MockUserDetailsBloc();
      when(() => userDetailsBloc.userDetails).thenAnswer((_) => BehaviorSubject.seeded(Result.success(userDetails)));

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            NeonProvider<UserDetailsBloc>.value(value: userDetailsBloc),
          ],
          child: NeonRichObjectMention(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.userGroup
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
        find.byType(NeonRichObjectMention),
        matchesGoldenFile('goldens/rich_text_object_mention_user-group_highlight.png'),
      );

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            NeonProvider<UserDetailsBloc>.value(value: userDetailsBloc),
          ],
          child: NeonRichObjectMention(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.userGroup
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
        find.byType(NeonRichObjectMention),
        matchesGoldenFile('goldens/rich_text_object_mention_user-group_other.png'),
      );
    });
  });

  group('File', () {
    const pixelRatio = 3;
    const maxWidth = 800;
    const maxHeight = 600 ~/ 2;

    testWidgets('Opens link', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'no'
                ..path = ''
                ..link = '/link',
            ),
            textStyle: null,
          ),
        ),
      );

      await tester.tap(find.byType(NeonRichObjectFile));
      verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
    });

    testWidgets('With blurhash', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'no'
                ..path = ''
                ..blurhash = validBlurHash,
            ),
            textStyle: null,
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) => widget is NeonApiImage && widget.blurHash == validBlurHash,
        ),
        findsOne,
      );
    });

    testWidgets('Without preview', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'no'
                ..path = 'path',
            ),
            textStyle: null,
          ),
        ),
      );

      expect(find.byTooltip('name'), findsNothing);
      expect(find.text('name'), findsOne);
    });

    testWidgets('Without dimensions', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path',
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints(
        minHeight: 100,
        maxHeight: maxHeight.toDouble(),
        minWidth: 100,
        maxWidth: maxWidth.toDouble(),
      );
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
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
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path'
                ..width = width.toString()
                ..height = height.toString(),
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
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path'
                ..width = ((maxWidth * widthFactor) * pixelRatio).toString()
                ..height = ((maxHeight * heightFactor) * pixelRatio).toString(),
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
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('Full image for animated GIF', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path'
                ..mimetype = 'image/gif'
                ..blurhash = validBlurHash,
            ),
            textStyle: null,
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is NeonUriImage &&
              widget.uri.toString() == 'https://cloud.example.com:8443/nextcloud/remote.php/dav/files/username/path' &&
              widget.blurHash == validBlurHash,
        ),
        findsOne,
      );
    });
  });

  group('Fallback', () {
    testWidgets('Opens link', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFallback(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.calendarEvent
                ..id = ''
                ..name = 'name'
                ..link = '/link',
            ),
            textStyle: null,
          ),
        ),
      );

      await tester.tap(find.byType(NeonRichObjectFallback));
      verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
    });

    testWidgets('Without icon', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonRichObjectFallback(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.addressbook
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
        find.byType(NeonRichObjectFallback),
        matchesGoldenFile('goldens/rich_text_object_fallback_without_icon.png'),
      );
    });

    testWidgets('With icon', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFallback(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.addressbook
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
        find.byType(NeonRichObjectFallback),
        matchesGoldenFile('goldens/rich_text_object_fallback_with_icon.png'),
      );
    });
  });

  group('buildRichObjectParameter', () {
    for (final isPreview in [true, false]) {
      group(isPreview ? 'As preview' : 'Complete', () {
        group('Mention', () {
          for (final type in [
            core.RichObjectParameter_Type.user,
            core.RichObjectParameter_Type.call,
            core.RichObjectParameter_Type.guest,
            core.RichObjectParameter_Type.userGroup,
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
                      parameter: core.RichObjectParameter(
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

              expect(find.byType(NeonRichObjectMention), isPreview ? findsNothing : findsOne);
              expect(find.text('name', findRichText: true), findsOne);
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
                  parameter: core.RichObjectParameter(
                    (b) => b
                      ..type = core.RichObjectParameter_Type.file
                      ..id = '0'
                      ..name = 'name',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(NeonRichObjectFile), isPreview ? findsNothing : findsOne);
          expect(find.text('name', findRichText: true), findsOne);
        });

        testWidgets('Deck card', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: core.RichObjectParameter(
                    (b) => b
                      ..type = core.RichObjectParameter_Type.deckCard
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

          expect(find.byType(NeonRichObjectDeckCard), isPreview ? findsNothing : findsOne);
          expect(find.text('name', findRichText: true), findsOne);
        });

        testWidgets('Fallback', (tester) async {
          await tester.pumpWidgetWithAccessibility(
            TestApp(
              child: RichText(
                text: buildRichObjectParameter(
                  parameter: core.RichObjectParameter(
                    (b) => b
                      ..type = core.RichObjectParameter_Type.addressbook
                      ..id = ''
                      ..name = 'name',
                  ),
                  textStyle: null,
                  isPreview: isPreview,
                ),
              ),
            ),
          );

          expect(find.byType(NeonRichObjectFallback), isPreview ? findsNothing : findsOne);
          expect(find.text('name', findRichText: true), findsOne);
        });
      });
    }
  });

  group('buildRichTextSpan', () {
    test('Preview without newlines', () {
      var span = buildRichTextSpan(
        text: '123\n456',
        parameters: BuiltMap(),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!.single as TextSpan;
      expect(span.text, '123\n456');

      span = buildRichTextSpan(
        text: '123\n456',
        parameters: BuiltMap(),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
        isPreview: true,
      ).children!.single as TextSpan;
      expect(span.text, '123 456');
    });

    group('Unused parameters', () {
      for (final type in core.RichObjectParameter_Type.values) {
        test(type, () {
          final spans = buildRichTextSpan(
            text: 'test',
            parameters: BuiltMap({
              type.value: BuiltMap<String, JsonObject>({
                'type': JsonObject(type.value),
                'id': JsonObject(1),
                'name': JsonObject(''),
              }),
            }),
            references: BuiltList(),
            style: const TextStyle(),
            onReferenceClicked: (_) {},
          ).children!;
          if (type == core.RichObjectParameter_Type.file) {
            expect(spans, hasLength(3));
            expect((spans[0] as WidgetSpan).child, isA<NeonRichObjectFile>());
            expect((spans[1] as TextSpan).text, '\n');
            expect((spans[2] as TextSpan).text, 'test');
          } else {
            expect((spans.single as TextSpan).text, 'test');
          }
        });
      }
    });

    test('Used parameters', () {
      final spans = buildRichTextSpan(
        text: '123 {actor1} 456 {actor2} 789',
        parameters: BuiltMap({
          'actor1': BuiltMap<String, JsonObject>({
            'type': JsonObject('user'),
            'id': JsonObject(''),
            'name': JsonObject(''),
          }),
          'actor2': BuiltMap<String, JsonObject>({
            'type': JsonObject('user'),
            'id': JsonObject(''),
            'name': JsonObject(''),
          }),
        }),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!;
      expect(spans, hasLength(5));
      expect((spans[0] as TextSpan).text, '123 ');
      expect((spans[1] as WidgetSpan).child, isA<NeonRichObjectMention>());
      expect((spans[2] as TextSpan).text, ' 456 ');
      expect((spans[3] as WidgetSpan).child, isA<NeonRichObjectMention>());
      expect((spans[4] as TextSpan).text, ' 789');
    });

    test('References', () {
      final callback = MockOnReferenceClickedCallback();

      final spans = buildRichTextSpan(
        text: 'a 123 b 456 c',
        parameters: BuiltMap(),
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

    test('Skip empty parts', () {
      final spans = buildRichTextSpan(
        text: '{actor}',
        parameters: BuiltMap({
          'actor': BuiltMap<String, JsonObject>({
            'type': JsonObject(core.RichObjectParameter_Type.user.name),
            'id': JsonObject(''),
            'name': JsonObject(''),
          }),
        }),
        references: BuiltList(),
        style: const TextStyle(),
        onReferenceClicked: (_) {},
      ).children!;
      expect(spans, hasLength(1));
      expect((spans[0] as WidgetSpan).child, isA<NeonRichObjectMention>());
    });
  });
}

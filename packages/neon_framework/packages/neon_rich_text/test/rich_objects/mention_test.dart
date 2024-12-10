import 'package:built_collection/built_collection.dart';
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

void main() {
  late Account account;

  setUpAll(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    account = MockAccount();
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
}

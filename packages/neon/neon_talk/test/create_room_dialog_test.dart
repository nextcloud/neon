import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/l10n/localizations_en.dart';
import 'package:neon_talk/src/dialogs/create_room.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';

Account mockAutocompleteAccount() {
  return mockServer({
    RegExp(r'/ocs/v2\.php/core/autocomplete/get'): {
      'get': (match, queryParameters) {
        final source = queryParameters['shareTypes[]']![0] == '0' ? 'users' : 'groups';
        return Response(
          json.encode(
            {
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': [
                  {
                    'id': 'test',
                    'label': 'Test',
                    'icon': '',
                    'source': source,
                    'status': '',
                    'subline': '',
                    'shareWithDisplayNameUnique': '',
                  },
                ],
              },
            },
          ),
          200,
        );
      },
    },
    RegExp(r'/index\.php/avatar/.*'): {
      'get': (match, queryParameters) => Response('', 404),
    },
  });
}

class AutocompleteResultFake extends Fake implements core.AutocompleteResult {}

void main() {
  late Account account;

  setUpAll(() {
    registerFallbackValue(AutocompleteResultFake());

    FakeNeonStorage.setup();

    account = mockAutocompleteAccount();
  });

  final localizations = TalkLocalizationsEn();
  for (final (name, type, typeName, iconMatcher, iconCount, source) in [
    (
      'One-to-one',
      spreed.RoomType.oneToOne,
      localizations.roomType(spreed.RoomType.oneToOne.name),
      find.byType(NeonUserAvatar),
      findsOne,
      'users',
    ),
    (
      'Group',
      spreed.RoomType.group,
      localizations.roomType(spreed.RoomType.group.name),
      find.byIcon(AdaptiveIcons.group),
      findsExactly(2),
      'groups',
    ),
  ]) {
    testWidgets(name, (tester) async {
      final userStatusBloc = MockUserStatusBloc();
      when(() => userStatusBloc.statuses).thenAnswer(
        (_) => BehaviorSubject.seeded(
          BuiltMap({
            'test': Result.success(
              user_status.Public(
                (b) => b
                  ..userId = 'test'
                  ..status = user_status.$Type.online,
              ),
            ),
          }),
        ),
      );

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            NeonProvider<UserStatusBloc>.value(value: userStatusBloc),
            Provider<Account>.value(value: account),
          ],
          localizationsDelegates: TalkLocalizations.localizationsDelegates,
          supportedLocales: TalkLocalizations.supportedLocales,
          child: const SizedBox(),
        ),
      );

      final BuildContext context = tester.element(find.byType(SizedBox));

      final future = showDialog<TalkCreateRoomDetails>(
        context: context,
        builder: (context) => const TalkCreateRoomDialog(),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text(typeName));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField), 't');
      await tester.pumpAndSettle();

      expect(iconMatcher, iconCount);
      await tester.tap(find.text('Test'));
      await tester.pumpAndSettle();

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final value = (await future)!;
      expect(value.type, type);
      expect(value.roomName, null);
      expect(
        value.invite,
        core.AutocompleteResult(
          (b) => b
            ..id = 'test'
            ..label = 'Test'
            ..icon = ''
            ..source = source
            ..status = (autocompleteResultStatus0: null, string: '')
            ..subline = ''
            ..shareWithDisplayNameUnique = '',
        ),
      );
    });
  }

  testWidgets('Public', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      const TestApp(
        localizationsDelegates: TalkLocalizations.localizationsDelegates,
        supportedLocales: TalkLocalizations.supportedLocales,
        child: SizedBox(),
      ),
    );

    final BuildContext context = tester.element(find.byType(SizedBox));

    final future = showDialog<TalkCreateRoomDetails>(
      context: context,
      builder: (context) => const TalkCreateRoomDialog(),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(TalkLocalizations.of(context).roomType(spreed.RoomType.public.name)));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField), 'test');
    await tester.pumpAndSettle();

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    final value = (await future)!;
    expect(value.type, spreed.RoomType.public);
    expect(value.roomName, 'test');
    expect(value.invite, null);
  });
}

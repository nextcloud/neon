import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/testing/mocks.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:rxdart/rxdart.dart';

void main() {
  setUp(() {
    final storage = MockNeonStorage();
    when(() => storage.requestCache).thenReturn(null);
  });

  for (final (withStatus, matcher) in [(false, findsNothing), (true, findsOne)]) {
    testWidgets('${withStatus ? 'With' : 'Without'} status', (tester) async {
      final account = MockAccount();
      when(() => account.id).thenReturn('test');
      when(() => account.username).thenReturn('test');
      when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

      final userStatusBloc = MockUserStatusBloc();
      when(() => userStatusBloc.statuses).thenAnswer(
        (_) => BehaviorSubject.seeded(
          BuiltMap({
            'test': Result<user_status.$PublicInterface>(
              user_status.Public(
                (b) => b
                  ..userId = 'test'
                  ..status = user_status.$Type.online,
              ),
              null,
              isLoading: false,
              isCached: false,
            ),
          }),
        ),
      );

      final accountsBloc = MockAccountsBloc();
      when(() => accountsBloc.activeAccount).thenAnswer((_) => BehaviorSubject.seeded(account));
      when(() => accountsBloc.getUserStatusBlocFor(account)).thenReturn(userStatusBloc);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: NeonLocalizations.localizationsDelegates,
          home: NeonProvider<AccountsBloc>.value(
            value: accountsBloc,
            child: NeonUserAvatar(
              showStatus: withStatus,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(NeonUserStatusIndicator), matcher);
    });
  }

  group('Status indicator', () {
    for (final (status, icon, textMatcher, iconMatcher) in [
      (user_status.$Type.offline, '😀', findsOne, findsNothing),
      (user_status.$Type.offline, null, findsNothing, findsOne),
      (user_status.$Type.online, '😀', findsOne, findsNothing),
      (user_status.$Type.online, null, findsNothing, findsOne),
      (user_status.$Type.dnd, '😀', findsNothing, findsOne),
      (user_status.$Type.dnd, null, findsNothing, findsOne),
    ]) {
      testWidgets('${status.value} ${icon != null ? 'with' : 'without'} emoji', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: NeonUserStatusIndicator(
              result: Result<user_status.$PublicInterface>(
                user_status.Public(
                  (b) => b
                    ..userId = 'test'
                    ..status = status
                    ..icon = icon,
                ),
                null,
                isLoading: false,
                isCached: false,
              ),
              size: 1,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(Text), textMatcher);
        expect(find.byType(NeonUserStatusIcon), iconMatcher);
      });
    }
  });
}

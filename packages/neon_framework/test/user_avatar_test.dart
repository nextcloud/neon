import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:rxdart/rxdart.dart';

void main() {
  setUp(() {
    FakeNeonStorage.setup();
  });

  group('NeonUserAvatar', () {
    testWidgets('With UserStatusBloc', (tester) async {
      final account = MockAccount();

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

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonUserAvatar(
            account: account,
            userStatusBloc: userStatusBloc,
          ),
        ),
      );

      expect(find.byType(NeonUserStatusIndicator), findsOne);
    });

    testWidgets('With user status', (tester) async {
      final account = MockAccount();

      final userStatus = user_status.Public(
        (b) => b
          ..userId = 'test'
          ..status = user_status.$Type.online,
      );

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonUserAvatar(
            account: account,
            userStatus: userStatus,
          ),
        ),
      );

      expect(find.byType(NeonUserStatusIndicator), findsOne);
    });

    testWidgets('Without UserStatusBloc and user status', (tester) async {
      final account = MockAccount();

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          child: NeonUserAvatar(
            account: account,
          ),
        ),
      );

      expect(find.byType(NeonUserStatusIndicator), findsNothing);
    });
  });

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
        await tester.pumpWidgetWithAccessibility(
          TestApp(
            child: NeonUserStatusIndicator(
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

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/widgets/room_avatar.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';

import 'testing.dart';

void main() {
  setUp(() {
    FakeNeonStorage.setup();
  });

  testWidgets('Custom avatar', (tester) async {
    final account = MockAccount();
    when(() => account.id).thenReturn('');
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    final room = MockRoom();
    when(() => room.isCustomAvatar).thenReturn(true);
    when(() => room.token).thenReturn('abc123');
    when(() => room.avatarVersion).thenReturn('');

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: TalkRoomAvatar(
          room: room,
        ),
      ),
    );
    expect(find.byType(NeonApiImage), findsOne);
  });

  testWidgets('One to one', (tester) async {
    final account = MockAccount();
    when(() => account.id).thenReturn('');
    when(() => account.client).thenReturn(NextcloudClient(Uri.parse('')));

    final userStatusBloc = MockUserStatusBloc();
    when(() => userStatusBloc.statuses).thenAnswer((_) => BehaviorSubject.seeded(BuiltMap()));

    final room = MockRoom();
    when(() => room.isCustomAvatar).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.oneToOne.value);
    when(() => room.name).thenReturn('');

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          NeonProvider<UserStatusBloc>.value(value: userStatusBloc),
          Provider<Account>.value(value: account),
        ],
        child: TalkRoomAvatar(
          room: room,
        ),
      ),
    );
    expect(find.byType(NeonUserAvatar), findsOne);
  });

  testWidgets('Other', (tester) async {
    final account = MockAccount();

    final room = MockRoom();
    when(() => room.isCustomAvatar).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.group.value);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: TalkRoomAvatar(
          room: room,
        ),
      ),
    );
    expect(find.byIcon(AdaptiveIcons.group), findsOne);
  });
}

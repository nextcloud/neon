import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:provider/provider.dart';
import 'package:talk_app/src/widgets/room_avatar.dart';

import 'testing.dart';

void main() {
  setUp(() {
    FakeNeonStorage.setup();
  });

  testWidgets('Custom avatar', (tester) async {
    final account = MockAccount();

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

    final room = MockRoom();
    when(() => room.isCustomAvatar).thenReturn(false);
    when(() => room.type).thenReturn(spreed.RoomType.oneToOne.value);
    when(() => room.name).thenReturn('');
    when(() => room.status).thenReturn('online');

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
    expect(find.byType(NeonUserAvatar), findsOne);
    expect(find.byType(NeonUserStatusIcon), findsOne);
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

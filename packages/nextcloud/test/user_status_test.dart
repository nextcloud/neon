import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group(
    'user_status',
    () {
      late DockerImage image;
      setUpAll(() async => image = await getDockerImage());

      late DockerContainer container;
      late TestNextcloudClient client;
      setUp(() async {
        container = await getDockerContainer(image);
        client = await getTestClient(container);
      });
      tearDown(() => container.destroy());

      test('Find all predefined statuses', () async {
        final expectedStatusIDs = ['meeting', 'commuting', 'remote-work', 'sick-leave', 'vacationing'];
        final response = await client.userStatus.predefinedStatus.findAll();
        expect(response.ocs.data, hasLength(5));
        final responseIDs = response.ocs.data.map((final status) => status.id);
        expect(expectedStatusIDs.map(responseIDs.contains).contains(false), false);
        for (final status in response.ocs.data) {
          expect(status.icon, isNotNull);
          expect(status.message, isNotNull);
        }

        final meeting = response.ocs.data.singleWhere((final s) => s.id == 'meeting').clearAt!;
        expect(meeting.type, UserStatusClearAt_Type.period);
        expect(meeting.time.$int, 3600);

        final commuting = response.ocs.data.singleWhere((final s) => s.id == 'commuting').clearAt!;
        expect(commuting.type, UserStatusClearAt_Type.period);
        expect(commuting.time.$int, 1800);

        final remoteWork = response.ocs.data.singleWhere((final s) => s.id == 'remote-work').clearAt!;
        expect(remoteWork.type, UserStatusClearAt_Type.endOf);
        expect(remoteWork.time.clearAtTimeType, UserStatusClearAtTimeType.day);

        final sickLeave = response.ocs.data.singleWhere((final s) => s.id == 'sick-leave').clearAt!;
        expect(sickLeave.type, UserStatusClearAt_Type.endOf);
        expect(sickLeave.time.clearAtTimeType, UserStatusClearAtTimeType.day);

        final vacationing = response.ocs.data.singleWhere((final s) => s.id == 'vacationing').clearAt;
        expect(vacationing, null);
      });

      test('Set status', () async {
        final response = await client.userStatus.userStatus.setStatus(statusType: 'online');

        expect(response.ocs.data.public.userId, 'user1');
        expect(response.ocs.data.public.message, null);
        expect(response.ocs.data.private1.messageId, null);
        expect(response.ocs.data.private1.messageIsPredefined, false);
        expect(response.ocs.data.public.icon, null);
        expect(response.ocs.data.public.clearAt, null);
        expect(response.ocs.data.public.status, 'online');
        expect(response.ocs.data.private1.statusIsUserDefined, true);
      });

      test('Get status', () async {
        // There seems to be a bug in Nextcloud which makes getting the status fail before it has been set once.
        // The error message from Nextcloud is "Could not create folder"
        await client.userStatus.userStatus.setStatus(statusType: 'online');

        final response = await client.userStatus.userStatus.getStatus();
        expect(response.ocs.data.public.userId, 'user1');
        expect(response.ocs.data.public.message, null);
        expect(response.ocs.data.private1.messageId, null);
        expect(response.ocs.data.private1.messageIsPredefined, false);
        expect(response.ocs.data.public.icon, null);
        expect(response.ocs.data.public.clearAt, null);
        expect(response.ocs.data.public.status, 'online');
        expect(response.ocs.data.private1.statusIsUserDefined, true);
      });

      test('Find all statuses', () async {
        var response = await client.userStatus.statuses.findAll();
        expect(response.ocs.data, hasLength(0));

        await client.userStatus.userStatus.setStatus(statusType: 'online');

        response = await client.userStatus.statuses.findAll();
        expect(response.ocs.data, hasLength(1));
        expect(response.ocs.data[0].userId, 'user1');
        expect(response.ocs.data[0].message, null);
        expect(response.ocs.data[0].icon, null);
        expect(response.ocs.data[0].clearAt, null);
        expect(response.ocs.data[0].status, 'online');
      });

      test('Find status', () async {
        // Same as getting status
        await client.userStatus.userStatus.setStatus(statusType: 'online');

        final response = await client.userStatus.statuses.find(userId: 'user1');
        expect(response.ocs.data.userId, 'user1');
        expect(response.ocs.data.message, null);
        expect(response.ocs.data.icon, null);
        expect(response.ocs.data.clearAt, null);
        expect(response.ocs.data.status, 'online');
      });

      test('Set predefined message', () async {
        final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
        final response = await client.userStatus.userStatus.setPredefinedMessage(
          messageId: 'meeting',
          clearAt: clearAt,
        );
        expect(response.ocs.data.public.userId, 'user1');
        expect(response.ocs.data.public.message, null);
        expect(response.ocs.data.private1.messageId, 'meeting');
        expect(response.ocs.data.private1.messageIsPredefined, true);
        expect(response.ocs.data.public.icon, null);
        expect(response.ocs.data.public.clearAt, clearAt);
        expect(response.ocs.data.public.status, 'offline');
        expect(response.ocs.data.private1.statusIsUserDefined, false);
      });

      test('Set custom message', () async {
        final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
        final response = await client.userStatus.userStatus.setCustomMessage(
          statusIcon: '😀',
          message: 'bla',
          clearAt: clearAt,
        );
        expect(response.ocs.data.public.userId, 'user1');
        expect(response.ocs.data.public.message, 'bla');
        expect(response.ocs.data.private1.messageId, null);
        expect(response.ocs.data.private1.messageIsPredefined, false);
        expect(response.ocs.data.public.icon, '😀');
        expect(response.ocs.data.public.clearAt, clearAt);
        expect(response.ocs.data.public.status, 'offline');
        expect(response.ocs.data.private1.statusIsUserDefined, false);
      });

      test('Clear message', () async {
        final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
        await client.userStatus.userStatus.setCustomMessage(
          statusIcon: '😀',
          message: 'bla',
          clearAt: clearAt,
        );
        await client.userStatus.userStatus.clearMessage();

        final response = await client.userStatus.userStatus.getStatus();
        expect(response.ocs.data.public.userId, 'user1');
        expect(response.ocs.data.public.message, null);
        expect(response.ocs.data.private1.messageId, null);
        expect(response.ocs.data.private1.messageIsPredefined, false);
        expect(response.ocs.data.public.icon, null);
        expect(response.ocs.data.public.clearAt, null);
        expect(response.ocs.data.public.status, 'offline');
        expect(response.ocs.data.private1.statusIsUserDefined, false);
      });

      test('Heartbeat', () async {
        final response = await client.userStatus.heartbeat.heartbeat(status: 'online');
        expect(response.ocs.data.public.userId, 'user1');
        expect(response.ocs.data.public.message, null);
        expect(response.ocs.data.private1.messageId, null);
        expect(response.ocs.data.private1.messageIsPredefined, false);
        expect(response.ocs.data.public.icon, null);
        expect(response.ocs.data.public.clearAt, null);
        expect(response.ocs.data.public.status, 'online');
        expect(response.ocs.data.private1.statusIsUserDefined, false);
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}

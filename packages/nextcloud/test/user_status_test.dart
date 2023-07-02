import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

Future main() async {
  await run(await getDockerImage());
}

Future run(final DockerImage image) async {
  group('user_status', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(container);
    });
    tearDown(() => container.destroy());

    test('Find all predefined statuses', () async {
      final expectedStatusIDs = ['meeting', 'commuting', 'remote-work', 'sick-leave', 'vacationing'];
      final response = await client.userStatus.getPredefinedStatuses();
      expect(response.ocs.data, hasLength(5));
      final responseIDs = response.ocs.data.map((final status) => status.id);
      expect(expectedStatusIDs.map(responseIDs.contains).contains(false), false);
      for (final status in response.ocs.data) {
        expect(status.icon, isNotNull);
        expect(status.message, isNotNull);
      }

      final meeting = response.ocs.data.singleWhere((final s) => s.id == 'meeting').clearAt!.clearAt!;
      expect(meeting.type, UserStatusClearAt_Type.period);
      expect(meeting.time.$int, 3600);

      final commuting = response.ocs.data.singleWhere((final s) => s.id == 'commuting').clearAt!.clearAt!;
      expect(commuting.type, UserStatusClearAt_Type.period);
      expect(commuting.time.$int, 1800);

      final remoteWork = response.ocs.data.singleWhere((final s) => s.id == 'remote-work').clearAt!.clearAt!;
      expect(remoteWork.type, UserStatusClearAt_Type.endOf);
      expect(remoteWork.time.clearAtTime0, UserStatusClearAt_Time0.day);

      final sickLeave = response.ocs.data.singleWhere((final s) => s.id == 'sick-leave').clearAt!.clearAt!;
      expect(sickLeave.type, UserStatusClearAt_Type.endOf);
      expect(sickLeave.time.clearAtTime0, UserStatusClearAt_Time0.day);

      final vacationing = response.ocs.data.singleWhere((final s) => s.id == 'vacationing').clearAt;
      expect(vacationing, null);
    });

    test('Set status', () async {
      final response = await client.userStatus.setStatus(statusType: UserStatusType.online);

      expect(response.ocs.data.status!.publicStatus.userId, 'user1');
      expect(response.ocs.data.status!.publicStatus.message, null);
      expect(response.ocs.data.status!.status1.messageId, null);
      expect(response.ocs.data.status!.status1.messageIsPredefined, false);
      expect(response.ocs.data.status!.publicStatus.icon, null);
      expect(response.ocs.data.status!.publicStatus.clearAt, null);
      expect(response.ocs.data.status!.publicStatus.status, UserStatusType.online);
      expect(response.ocs.data.status!.status1.statusIsUserDefined, true);
    });

    test('Get status', () async {
      // There seems to be a bug in Nextcloud which makes getting the status fail before it has been set once.
      // The error message from Nextcloud is "Could not create folder"
      await client.userStatus.setStatus(statusType: UserStatusType.online);

      final response = await client.userStatus.getStatus();
      expect(response.ocs.data.status!.publicStatus.userId, 'user1');
      expect(response.ocs.data.status!.publicStatus.message, null);
      expect(response.ocs.data.status!.status1.messageId, null);
      expect(response.ocs.data.status!.status1.messageIsPredefined, false);
      expect(response.ocs.data.status!.publicStatus.icon, null);
      expect(response.ocs.data.status!.publicStatus.clearAt, null);
      expect(response.ocs.data.status!.publicStatus.status, UserStatusType.online);
      expect(response.ocs.data.status!.status1.statusIsUserDefined, true);
    });

    test('Find all statuses', () async {
      var response = await client.userStatus.getPublicStatuses();
      expect(response.ocs.data, hasLength(0));

      await client.userStatus.setStatus(statusType: UserStatusType.online);

      response = await client.userStatus.getPublicStatuses();
      expect(response.ocs.data, hasLength(1));
      expect(response.ocs.data[0].userId, 'user1');
      expect(response.ocs.data[0].message, null);
      expect(response.ocs.data[0].icon, null);
      expect(response.ocs.data[0].clearAt, null);
      expect(response.ocs.data[0].status, UserStatusType.online);
    });

    test('Find status', () async {
      // Same as getting status
      await client.userStatus.setStatus(statusType: UserStatusType.online);

      final response = await client.userStatus.getPublicStatus(userId: 'user1');
      expect(response.ocs.data.publicStatus!.userId, 'user1');
      expect(response.ocs.data.publicStatus!.message, null);
      expect(response.ocs.data.publicStatus!.icon, null);
      expect(response.ocs.data.publicStatus!.clearAt, null);
      expect(response.ocs.data.publicStatus!.status, UserStatusType.online);
    });

    test('Set predefined message', () async {
      final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
      final response = await client.userStatus.setPredefinedMessage(
        messageId: 'meeting',
        clearAt: clearAt,
      );
      expect(response.ocs.data.status!.publicStatus.userId, 'user1');
      expect(response.ocs.data.status!.publicStatus.message, null);
      expect(response.ocs.data.status!.status1.messageId, 'meeting');
      expect(response.ocs.data.status!.status1.messageIsPredefined, true);
      expect(response.ocs.data.status!.publicStatus.icon, null);
      expect(response.ocs.data.status!.publicStatus.clearAt!.$int, clearAt);
      expect(response.ocs.data.status!.publicStatus.status, UserStatusType.offline);
      expect(response.ocs.data.status!.status1.statusIsUserDefined, false);
    });

    test('Set custom message', () async {
      final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
      final response = await client.userStatus.setCustomMessage(
        statusIcon: '😀',
        message: 'bla',
        clearAt: clearAt,
      );
      expect(response.ocs.data.status!.publicStatus.userId, 'user1');
      expect(response.ocs.data.status!.publicStatus.message, 'bla');
      expect(response.ocs.data.status!.status1.messageId, null);
      expect(response.ocs.data.status!.status1.messageIsPredefined, false);
      expect(response.ocs.data.status!.publicStatus.icon, '😀');
      expect(response.ocs.data.status!.publicStatus.clearAt!.$int, clearAt);
      expect(response.ocs.data.status!.publicStatus.status, UserStatusType.offline);
      expect(response.ocs.data.status!.status1.statusIsUserDefined, false);
    });

    test('Clear message', () async {
      final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
      await client.userStatus.setCustomMessage(
        statusIcon: '😀',
        message: 'bla',
        clearAt: clearAt,
      );
      await client.userStatus.clearMessage();

      final response = await client.userStatus.getStatus();
      expect(response.ocs.data.status!.publicStatus.userId, 'user1');
      expect(response.ocs.data.status!.publicStatus.message, null);
      expect(response.ocs.data.status!.status1.messageId, null);
      expect(response.ocs.data.status!.status1.messageIsPredefined, false);
      expect(response.ocs.data.status!.publicStatus.icon, null);
      expect(response.ocs.data.status!.publicStatus.clearAt, null);
      expect(response.ocs.data.status!.publicStatus.status, UserStatusType.offline);
      expect(response.ocs.data.status!.status1.statusIsUserDefined, false);
    });

    test('Heartbeat', () async {
      final response = await client.userStatus.heartbeat(status: UserStatusType.online);
      expect(response.ocs.data.status!.publicStatus.userId, 'user1');
      expect(response.ocs.data.status!.publicStatus.message, null);
      expect(response.ocs.data.status!.status1.messageId, null);
      expect(response.ocs.data.status!.status1.messageIsPredefined, false);
      expect(response.ocs.data.status!.publicStatus.icon, null);
      expect(response.ocs.data.status!.publicStatus.clearAt, null);
      expect(response.ocs.data.status!.publicStatus.status, UserStatusType.online);
      expect(response.ocs.data.status!.status1.statusIsUserDefined, false);
    });
  });
}

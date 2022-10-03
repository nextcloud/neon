import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

Future main() async {
  final dockerImageName = await TestHelper.prepareDockerImage();

  group('user_status', () {
    late TestNextcloudClient client;
    setUp(() async => client = await TestHelper.getPreparedClient(dockerImageName));
    tearDown(() => client.destroy());

    test('Find all predefined statuses', () async {
      final expectedStatusIDs = ['meeting', 'commuting', 'remote-work', 'sick-leave', 'vacationing'];
      final response = await client.userStatus.findAllPredefinedStatuses();
      expect(response.ocs!.data, hasLength(5));
      final responseIDs = response.ocs!.data!.map((final status) => status.id!);
      expect(expectedStatusIDs.map(responseIDs.contains).contains(false), false);
      for (final status in response.ocs!.data!) {
        expect(status.icon, isNotNull);
        expect(status.message, isNotNull);
      }

      final meeting = response.ocs!.data!.singleWhere((final s) => s.id == 'meeting').clearAt!.userStatusClearAt!;
      expect(meeting.type, UserStatusClearAtType.period);
      expect(meeting.time!.int_, 3600);

      final commuting = response.ocs!.data!.singleWhere((final s) => s.id == 'commuting').clearAt!.userStatusClearAt!;
      expect(commuting.type, UserStatusClearAtType.period);
      expect(commuting.time!.int_, 1800);

      final remoteWork =
          response.ocs!.data!.singleWhere((final s) => s.id == 'remote-work').clearAt!.userStatusClearAt!;
      expect(remoteWork.type, UserStatusClearAtType.endOf);
      expect(remoteWork.time!.userStatusClearAtTime0, UserStatusClearAtTime0.day);

      final sickLeave = response.ocs!.data!.singleWhere((final s) => s.id == 'sick-leave').clearAt!.userStatusClearAt!;
      expect(sickLeave.type, UserStatusClearAtType.endOf);
      expect(sickLeave.time!.userStatusClearAtTime0, UserStatusClearAtTime0.day);

      expect(response.ocs!.data!.singleWhere((final s) => s.id == 'vacationing').clearAt, null);
    });

    test('Set status', () async {
      final response = await client.userStatus.setStatus(statusType: UserStatusType.online);

      expect(response.ocs!.data!.userStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatus!.message, null);
      expect(response.ocs!.data!.userStatus!.messageId, null);
      expect(response.ocs!.data!.userStatus!.messageIsPredefined, false);
      expect(response.ocs!.data!.userStatus!.icon, null);
      expect(response.ocs!.data!.userStatus!.clearAt, null);
      expect(response.ocs!.data!.userStatus!.status, UserStatusType.online);
      expect(response.ocs!.data!.userStatus!.statusIsUserDefined, true);
    });

    test('Get status', () async {
      // There seems to be a bug in Nextcloud which makes getting the status fail before it has been set once.
      // The error message from Nextcloud is "Could not create folder"
      await client.userStatus.setStatus(statusType: UserStatusType.online);

      final response = await client.userStatus.getStatus();
      expect(response.ocs!.data!.userStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatus!.message, null);
      expect(response.ocs!.data!.userStatus!.messageId, null);
      expect(response.ocs!.data!.userStatus!.messageIsPredefined, false);
      expect(response.ocs!.data!.userStatus!.icon, null);
      expect(response.ocs!.data!.userStatus!.clearAt, null);
      expect(response.ocs!.data!.userStatus!.status, UserStatusType.online);
      expect(response.ocs!.data!.userStatus!.statusIsUserDefined, true);
    });

    test('Find all statuses', () async {
      var response = await client.userStatus.findAllStatuses();
      expect(response.ocs!.data, hasLength(0));

      await client.userStatus.setStatus(statusType: UserStatusType.online);

      response = await client.userStatus.findAllStatuses();
      expect(response.ocs!.data, hasLength(1));
      expect(response.ocs!.data![0].userId, 'user1');
      expect(response.ocs!.data![0].message, null);
      expect(response.ocs!.data![0].icon, null);
      expect(response.ocs!.data![0].clearAt, null);
      expect(response.ocs!.data![0].status, UserStatusType.online);
    });

    test('Find status', () async {
      // Same as getting status
      await client.userStatus.setStatus(statusType: UserStatusType.online);

      final response = await client.userStatus.findStatus(userId: 'user1');
      expect(response.ocs!.data!.userStatusPublicUserStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatusPublicUserStatus!.message, null);
      expect(response.ocs!.data!.userStatusPublicUserStatus!.icon, null);
      expect(response.ocs!.data!.userStatusPublicUserStatus!.clearAt, null);
      expect(response.ocs!.data!.userStatusPublicUserStatus!.status, UserStatusType.online);
    });

    test('Set predefined message', () async {
      final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
      final response = await client.userStatus.setPredefinedMessage(
        messageId: 'meeting',
        clearAt: clearAt,
      );
      expect(response.ocs!.data!.userStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatus!.message, null);
      expect(response.ocs!.data!.userStatus!.messageId, 'meeting');
      expect(response.ocs!.data!.userStatus!.messageIsPredefined, true);
      expect(response.ocs!.data!.userStatus!.icon, null);
      expect(response.ocs!.data!.userStatus!.clearAt!.int_, clearAt);
      expect(response.ocs!.data!.userStatus!.status, UserStatusType.offline);
      expect(response.ocs!.data!.userStatus!.statusIsUserDefined, false);
    });

    test('Set custom message', () async {
      final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
      final response = await client.userStatus.setCustomMessage(
        statusIcon: '😀',
        message: 'bla',
        clearAt: clearAt,
      );
      expect(response.ocs!.data!.userStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatus!.message, 'bla');
      expect(response.ocs!.data!.userStatus!.messageId, null);
      expect(response.ocs!.data!.userStatus!.messageIsPredefined, false);
      expect(response.ocs!.data!.userStatus!.icon, '😀');
      expect(response.ocs!.data!.userStatus!.clearAt!.int_, clearAt);
      expect(response.ocs!.data!.userStatus!.status, UserStatusType.offline);
      expect(response.ocs!.data!.userStatus!.statusIsUserDefined, false);
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
      expect(response.ocs!.data!.userStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatus!.message, null);
      expect(response.ocs!.data!.userStatus!.messageId, null);
      expect(response.ocs!.data!.userStatus!.messageIsPredefined, false);
      expect(response.ocs!.data!.userStatus!.icon, null);
      expect(response.ocs!.data!.userStatus!.clearAt, null);
      expect(response.ocs!.data!.userStatus!.status, UserStatusType.offline);
      expect(response.ocs!.data!.userStatus!.statusIsUserDefined, false);
    });

    test('Heartbeat', () async {
      await client.userStatus.heartbeat(status: UserStatusType.online);

      final response = await client.userStatus.getStatus();
      expect(response.ocs!.data!.userStatus!.userId, 'user1');
      expect(response.ocs!.data!.userStatus!.message, null);
      expect(response.ocs!.data!.userStatus!.messageId, null);
      expect(response.ocs!.data!.userStatus!.messageIsPredefined, false);
      expect(response.ocs!.data!.userStatus!.icon, null);
      expect(response.ocs!.data!.userStatus!.clearAt, null);
      expect(response.ocs!.data!.userStatus!.status, UserStatusType.online);
      expect(response.ocs!.data!.userStatus!.statusIsUserDefined, false);
    });
  });
}

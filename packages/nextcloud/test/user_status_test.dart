import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';
import 'package:test_api/src/backend/invoker.dart';

void main() {
  presets(
    'server',
    'user_status',
    (preset) {
      late DockerContainer container;
      late NextcloudClient client;
      setUp(() async {
        container = await DockerContainer.create(preset);
        client = await TestNextcloudClient.create(container);
      });
      tearDown(() async {
        if (Invoker.current!.liveTest.errors.isNotEmpty) {
          print(await container.allLogs());
        }
        container.destroy();
      });

      group('Predefined status', () {
        test('Find all', () async {
          final expectedStatusIDs = ['meeting', 'commuting', 'remote-work', 'sick-leave', 'vacationing'];
          final response = await client.userStatus.predefinedStatus.findAll();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data, hasLength(5));
          final responseIDs = response.body.ocs.data.map((status) => status.id);
          expect(expectedStatusIDs.map(responseIDs.contains).contains(false), false);
          for (final status in response.body.ocs.data) {
            expect(status.icon, isNotNull);
            expect(status.message, isNotNull);
          }

          final meeting = response.body.ocs.data.singleWhere((s) => s.id == 'meeting').clearAt!;
          expect(meeting.type, user_status.ClearAt_Type.period);
          expect(meeting.time.$int, 3600);

          final commuting = response.body.ocs.data.singleWhere((s) => s.id == 'commuting').clearAt!;
          expect(commuting.type, user_status.ClearAt_Type.period);
          expect(commuting.time.$int, 1800);

          final remoteWork = response.body.ocs.data.singleWhere((s) => s.id == 'remote-work').clearAt!;
          expect(remoteWork.type, user_status.ClearAt_Type.endOf);
          expect(remoteWork.time.clearAtTimeType, user_status.ClearAtTimeType.day);

          final sickLeave = response.body.ocs.data.singleWhere((s) => s.id == 'sick-leave').clearAt!;
          expect(sickLeave.type, user_status.ClearAt_Type.endOf);
          expect(sickLeave.time.clearAtTimeType, user_status.ClearAtTimeType.day);

          final vacationing = response.body.ocs.data.singleWhere((s) => s.id == 'vacationing').clearAt;
          expect(vacationing, null);
        });
      });

      group('User status', () {
        test('Set', () async {
          final response = await client.userStatus.userStatus.setStatus(statusType: 'online');
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, null);
          expect(response.body.ocs.data.messageId, null);
          expect(response.body.ocs.data.messageIsPredefined, false);
          expect(response.body.ocs.data.icon, null);
          expect(response.body.ocs.data.clearAt, null);
          expect(response.body.ocs.data.status, 'online');
          expect(response.body.ocs.data.statusIsUserDefined, true);
        });

        test('Get', () async {
          // There seems to be a bug in Nextcloud which makes getting the status fail before it has been set once.
          // The error message from Nextcloud is "Could not create folder"
          await client.userStatus.userStatus.setStatus(statusType: 'online');

          final response = await client.userStatus.userStatus.getStatus();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, null);
          expect(response.body.ocs.data.messageId, null);
          expect(response.body.ocs.data.messageIsPredefined, false);
          expect(response.body.ocs.data.icon, null);
          expect(response.body.ocs.data.clearAt, null);
          expect(response.body.ocs.data.status, 'online');
          expect(response.body.ocs.data.statusIsUserDefined, true);
        });

        test('Find', () async {
          // Same as getting status
          await client.userStatus.userStatus.setStatus(statusType: 'online');

          final response = await client.userStatus.statuses.find(userId: 'user1');
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, null);
          expect(response.body.ocs.data.icon, null);
          expect(response.body.ocs.data.clearAt, null);
          expect(response.body.ocs.data.status, 'online');
        });

        test('Set predefined message', () async {
          final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
          final response = await client.userStatus.userStatus.setPredefinedMessage(
            messageId: 'meeting',
            clearAt: clearAt,
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, null);
          expect(response.body.ocs.data.messageId, 'meeting');
          expect(response.body.ocs.data.messageIsPredefined, true);
          expect(response.body.ocs.data.icon, null);
          expect(response.body.ocs.data.clearAt, clearAt);
          expect(response.body.ocs.data.status, 'offline');
          expect(response.body.ocs.data.statusIsUserDefined, false);
        });

        test('Set custom message', () async {
          final clearAt = DateTime.now().millisecondsSinceEpoch ~/ 1000 + 60;
          final response = await client.userStatus.userStatus.setCustomMessage(
            statusIcon: '😀',
            message: 'bla',
            clearAt: clearAt,
          );
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, 'bla');
          expect(response.body.ocs.data.messageId, null);
          expect(response.body.ocs.data.messageIsPredefined, false);
          expect(response.body.ocs.data.icon, '😀');
          expect(response.body.ocs.data.clearAt, clearAt);
          expect(response.body.ocs.data.status, 'offline');
          expect(response.body.ocs.data.statusIsUserDefined, false);
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
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, null);
          expect(response.body.ocs.data.messageId, null);
          expect(response.body.ocs.data.messageIsPredefined, false);
          expect(response.body.ocs.data.icon, null);
          expect(response.body.ocs.data.clearAt, null);
          expect(response.body.ocs.data.status, 'offline');
          expect(response.body.ocs.data.statusIsUserDefined, false);
        });
      });

      group('Statuses', () {
        test('Find all', () async {
          var response = await client.userStatus.statuses.findAll();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect(response.body.ocs.data, hasLength(0));

          await client.userStatus.userStatus.setStatus(statusType: 'online');

          response = await client.userStatus.statuses.findAll();
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());
          expect(response.body.ocs.data, hasLength(1));
          expect(response.body.ocs.data[0].userId, 'user1');
          expect(response.body.ocs.data[0].message, null);
          expect(response.body.ocs.data[0].icon, null);
          expect(response.body.ocs.data[0].clearAt, null);
          expect(response.body.ocs.data[0].status, 'online');
        });
      });

      group('Heartbeat', () {
        test('Heartbeat', () async {
          final response = await client.userStatus.heartbeat.heartbeat(status: 'online');
          expect(response.statusCode, 200);
          expect(() => response.headers, isA<void>());

          expect(response.body.ocs.data.userId, 'user1');
          expect(response.body.ocs.data.message, null);
          expect(response.body.ocs.data.messageId, null);
          expect(response.body.ocs.data.messageIsPredefined, false);
          expect(response.body.ocs.data.icon, null);
          expect(response.body.ocs.data.clearAt, null);
          expect(response.body.ocs.data.status, 'online');
          expect(response.body.ocs.data.statusIsUserDefined, false);
        });
      });
    },
    retry: retryCount,
    timeout: timeout,
  );
}

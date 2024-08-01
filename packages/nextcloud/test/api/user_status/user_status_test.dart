import 'package:built_value_test/matcher.dart';
import 'package:nextcloud/src/utils/date_time.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:nextcloud_test/nextcloud_test.dart';
import 'package:test/test.dart';

void main() {
  presets('server', 'user_status', (tester) {
    setUp(() async {
      await tester.client.userStatus.userStatus.setStatus(
        $body: user_status.UserStatusSetStatusRequestApplicationJson(
          (b) => b..statusType = user_status.$Type.online.value,
        ),
      );
      await tester.client.userStatus.userStatus.clearMessage();

      resetFixture();
    });

    group('Predefined status', () {
      test('Find all', () async {
        final expectedStatusIDs = ['meeting', 'commuting', 'remote-work', 'sick-leave', 'vacationing'];
        final response = await tester.client.userStatus.predefinedStatus.findAll();
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
        final response = await tester.client.userStatus.userStatus.setStatus(
          $body: user_status.UserStatusSetStatusRequestApplicationJson(
            (b) => b..statusType = user_status.$Type.online.value,
          ),
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, null);
        expect(response.body.ocs.data.messageId, null);
        expect(response.body.ocs.data.messageIsPredefined, false);
        expect(response.body.ocs.data.icon, null);
        expect(response.body.ocs.data.clearAt, null);
        expect(response.body.ocs.data.status, user_status.$Type.online);
        expect(response.body.ocs.data.statusIsUserDefined, true);
      });

      test('Get', () async {
        final response = await tester.client.userStatus.userStatus.getStatus();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, null);
        expect(response.body.ocs.data.messageId, null);
        expect(response.body.ocs.data.messageIsPredefined, false);
        expect(response.body.ocs.data.icon, null);
        expect(response.body.ocs.data.clearAt, null);
        expect(response.body.ocs.data.status, user_status.$Type.online);
        expect(response.body.ocs.data.statusIsUserDefined, true);
      });

      test('Find', () async {
        final response = await tester.client.userStatus.statuses.find(userId: 'user1');
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, null);
        expect(response.body.ocs.data.icon, null);
        expect(response.body.ocs.data.clearAt, null);
        expect(response.body.ocs.data.status, user_status.$Type.online);
      });

      test('Set predefined message', () async {
        final clearAt = DateTime.timestamp().secondsSinceEpoch + 60;
        final response = await tester.client.userStatus.userStatus.setPredefinedMessage(
          $body: user_status.UserStatusSetPredefinedMessageRequestApplicationJson(
            (b) => b
              ..messageId = 'meeting'
              ..clearAt = clearAt,
          ),
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, null);
        expect(response.body.ocs.data.messageId, 'meeting');
        expect(response.body.ocs.data.messageIsPredefined, true);
        expect(response.body.ocs.data.icon, null);
        expect(response.body.ocs.data.clearAt, clearAt);
        expect(response.body.ocs.data.status, user_status.$Type.online);
        expect(response.body.ocs.data.statusIsUserDefined, true);
      });

      test('Set custom message', () async {
        final clearAt = DateTime.timestamp().secondsSinceEpoch + 60;
        final response = await tester.client.userStatus.userStatus.setCustomMessage(
          $body: user_status.UserStatusSetCustomMessageRequestApplicationJson(
            (b) => b
              ..statusIcon = '😀'
              ..message = 'bla'
              ..clearAt = clearAt,
          ),
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, 'bla');
        expect(response.body.ocs.data.messageId, null);
        expect(response.body.ocs.data.messageIsPredefined, false);
        expect(response.body.ocs.data.icon, '😀');
        expect(response.body.ocs.data.clearAt, clearAt);
        expect(response.body.ocs.data.status, user_status.$Type.online);
        expect(response.body.ocs.data.statusIsUserDefined, true);
      });

      test('Clear message', () async {
        final clearAt = DateTime.timestamp().secondsSinceEpoch + 60;
        await tester.client.userStatus.userStatus.setCustomMessage(
          $body: user_status.UserStatusSetCustomMessageRequestApplicationJson(
            (b) => b
              ..statusIcon = '😀'
              ..message = 'bla'
              ..clearAt = clearAt,
          ),
        );
        await tester.client.userStatus.userStatus.clearMessage();

        final response = await tester.client.userStatus.userStatus.getStatus();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, null);
        expect(response.body.ocs.data.messageId, null);
        expect(response.body.ocs.data.messageIsPredefined, false);
        expect(response.body.ocs.data.icon, null);
        expect(response.body.ocs.data.clearAt, null);
        expect(response.body.ocs.data.status, user_status.$Type.online);
        expect(response.body.ocs.data.statusIsUserDefined, true);
      });
    });

    group('Statuses', () {
      test('Find all', () async {
        final response = await tester.client.userStatus.statuses.findAll();
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());
        expect(response.body.ocs.data, isNotEmpty);
        expect(
          response.body.ocs.data,
          containsOnce(
            equalsBuilt(
              user_status.Public(
                (b) => b
                  ..userId = 'user1'
                  ..status = user_status.$Type.online,
              ),
            ),
          ),
        );
      });
    });

    group('Heartbeat', () {
      test('Heartbeat', () async {
        final response = await tester.client.userStatus.heartbeat.heartbeat(
          $body: user_status.HeartbeatHeartbeatRequestApplicationJson(
            (b) => b..status = user_status.$Type.online.value,
          ),
        );
        expect(response.statusCode, 200);
        expect(() => response.headers, isA<void>());

        expect(response.body.ocs.data.userId, 'user1');
        expect(response.body.ocs.data.message, null);
        expect(response.body.ocs.data.messageId, null);
        expect(response.body.ocs.data.messageIsPredefined, false);
        expect(response.body.ocs.data.icon, null);
        expect(response.body.ocs.data.clearAt, null);
        expect(response.body.ocs.data.status, user_status.$Type.online);
        expect(response.body.ocs.data.statusIsUserDefined, true);
      });
    });
  });
}

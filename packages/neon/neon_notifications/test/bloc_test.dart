import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_notifications/src/blocs/notifications.dart';

Account mockNotificationsAccount() {
  final notifications = List.generate(
    3,
    (i) => {
      'notification_id': i,
      'app': '',
      'user': '',
      'datetime': '',
      'object_type': '',
      'object_id': '',
      'subject': '',
      'message': '',
      'link': '',
    },
  );

  return mockServer({
    RegExp(r'/ocs/v2\.php/apps/notifications/api/v2/notifications/([0-9]+)'): {
      'delete': (match, queryParameters) {
        final id = int.parse(match.group(1)!);
        notifications.removeWhere((n) => n['notification_id'] == id);

        return Response(
          json.encode({
            'ocs': {
              'meta': {'status': '', 'statuscode': 0},
              'data': <dynamic, dynamic>{},
            },
          }),
          200,
        );
      },
    },
    RegExp(r'/ocs/v2\.php/apps/notifications/api/v2/notifications'): {
      'get': (match, queryParameters) => Response(
            json.encode({
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': notifications,
              },
            }),
            200,
          ),
      'delete': (match, queryParameters) {
        notifications.clear();

        return Response(
          json.encode({
            'ocs': {
              'meta': {'status': '', 'statuscode': 0},
              'data': <dynamic, dynamic>{},
            },
          }),
          200,
        );
      },
    },
  });
}

void main() {
  late Account account;
  late NotificationsBloc bloc;

  setUpAll(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    account = mockNotificationsAccount();
    bloc = NotificationsBloc(
      account: account,
    );
  });

  tearDown(() {
    bloc.dispose();
  });

  test('refresh', () async {
    expect(
      bloc.notifications.transformResult((e) => BuiltList<int>(e.map((n) => n.notificationId))),
      emitsInOrder([
        Result<BuiltList<int>>.loading(),
        Result.success(BuiltList<int>([0, 1, 2])),
        Result.success(BuiltList<int>([0, 1, 2])).asLoading(),
        Result.success(BuiltList<int>([0, 1, 2])),
      ]),
    );
    expect(
      bloc.unreadCounter,
      emitsInOrder([
        3,
        3,
        3,
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await bloc.refresh();
  });

  test('deleteAllNotifications', () async {
    expect(
      bloc.notifications.transformResult((e) => BuiltList<int>(e.map((n) => n.notificationId))),
      emitsInOrder([
        Result<BuiltList<int>>.loading(),
        Result.success(BuiltList<int>([0, 1, 2])),
        Result.success(BuiltList<int>([0, 1, 2])).asLoading(),
        Result.success(BuiltList<int>([])),
      ]),
    );
    expect(
      bloc.unreadCounter,
      emitsInOrder([
        3,
        3,
        0,
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.deleteAllNotifications();
  });

  test('deleteNotification', () async {
    expect(
      bloc.notifications.transformResult((e) => BuiltList<int>(e.map((n) => n.notificationId))),
      emitsInOrder([
        Result<BuiltList<int>>.loading(),
        Result.success(BuiltList<int>([0, 1, 2])),
        Result.success(BuiltList<int>([0, 1, 2])).asLoading(),
        Result.success(BuiltList<int>([0, 2])),
      ]),
    );
    expect(
      bloc.unreadCounter,
      emitsInOrder([
        3,
        3,
        2,
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.deleteNotification(1);
  });
}

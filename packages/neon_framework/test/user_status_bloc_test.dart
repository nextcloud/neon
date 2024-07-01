import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;

Account mockUserStatusAccount() {
  var messageIsPredefined = false;
  var statusIsUserDefined = false;
  var status = 'offline';
  String? messageId;
  String? message;
  String? icon;
  int? clearAt;

  Response predefinedStatusesResponse() => Response(
        json.encode({
          'ocs': {
            'meta': {'status': '', 'statuscode': 0},
            'data': [
              {
                'id': 'predefined',
                'icon': 'icon',
                'message': 'message',
              },
            ],
          },
        }),
        200,
      );

  Response statusResponse() => Response(
        json.encode(
          {
            'ocs': {
              'meta': {'status': '', 'statuscode': 0},
              'data': {
                'userId': 'test',
                'messageIsPredefined': messageIsPredefined,
                'statusIsUserDefined': statusIsUserDefined,
                'status': status,
                if (message != null) 'message': message,
                if (icon != null) 'icon': icon,
                if (clearAt != null) 'clearAt': clearAt,
                if (messageId != null) 'messageId': messageId,
              },
            },
          },
        ),
        200,
      );

  Response emptyResponse() => Response(
        json.encode(
          {
            'ocs': {
              'meta': {'status': '', 'statuscode': 0},
              'data': <dynamic>[],
            },
          },
        ),
        200,
      );

  return mockServer({
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/predefined_statuses'): {
      'get': (match, queryParameters) => predefinedStatusesResponse(),
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/message/predefined'): {
      'put': (match, queryParameters) {
        messageId = queryParameters['messageId']!.single;
        messageIsPredefined = true;
        clearAt = int.parse(queryParameters['clearAt']!.single);
        return statusResponse();
      },
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/message/custom'): {
      'put': (match, queryParameters) {
        messageId = null;
        message = queryParameters['message']!.single;
        messageIsPredefined = false;
        icon = queryParameters['statusIcon']!.single;
        clearAt = int.parse(queryParameters['clearAt']!.single);
        return statusResponse();
      },
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/status'): {
      'put': (match, queryParameters) {
        status = queryParameters['statusType']!.single;
        statusIsUserDefined = true;
        return statusResponse();
      },
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/message'): {
      'delete': (match, queryParameters) {
        messageId = null;
        messageIsPredefined = false;
        message = null;
        icon = null;
        clearAt = null;
        return emptyResponse();
      },
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/statuses/(.*)'): {
      'get': (match, queryParameters) => statusResponse(),
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/heartbeat'): {
      'put': (match, queryParameters) {
        // Hardcoded behavior for testing
        if (status == 'offline') {
          return Response('', 204);
        } else if (status == 'dnd') {
          return Response('', 201);
        }

        status = queryParameters['status']!.single;
        statusIsUserDefined = false;
        return statusResponse();
      },
    },
  });
}

void main() {
  late Account account;
  late UserStatusBloc bloc;

  setUpAll(() {
    final platform = MockNeonPlatform();
    when(() => platform.canUseWindowManager).thenReturn(false);
    NeonPlatform.instance = platform;

    FakeNeonStorage.setup();
  });

  setUp(() {
    account = mockUserStatusAccount();
    bloc = UserStatusBloc(
      account: account,
    );
  });

  tearDown(() {
    bloc.dispose();
  });

  test('refresh', () async {
    expect(
      bloc.predefinedStatuses.transformResult((e) => e.single.id),
      emitsInOrder([
        Result<String>.loading(),
        Result.success('predefined'),
        Result.success('predefined').asLoading(),
        Result.success('predefined'),
      ]),
    );
    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await bloc.refresh();
  });

  test('Get predefined statuses', () async {
    expect(
      bloc.predefinedStatuses.transformResult((e) => e.single.id),
      emitsInOrder([
        Result<String>.loading(),
        Result.success('predefined'),
      ]),
    );
  });

  test('Load', () async {
    expect(
      bloc.status.transformResult((e) => e.status),
      emitsInOrder([
        Result<user_status.$Type>.loading(),
        Result.success(user_status.$Type.offline),
        Result.success(user_status.$Type.offline).asLoading(),
        Result.success(user_status.$Type.offline),
        Result.success(user_status.$Type.online),
        Result.success(user_status.$Type.online).asLoading(),
        Result.success(user_status.$Type.online),
        Result.success(user_status.$Type.dnd),
        Result.success(user_status.$Type.dnd).asLoading(),
        Result<String>.error(DynamiteStatusCodeException(http.Response('', 201))),
      ]),
    );

    bloc.load('test');

    // Without force nothing happens
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.load('test');

    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.load('test', force: true);

    // Trigger heartbeat 204
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.setStatusType(user_status.$Type.online.value);
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.load('test', force: true);

    // Trigger error
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.setStatusType(user_status.$Type.dnd.value);
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.load('test', force: true);
  });

  test('Set status type', () async {
    bloc.setStatusType(user_status.$Type.dnd.value);

    expect(bloc.status.transformResult((e) => e.status), emits(Result.success(user_status.$Type.dnd)));
  });

  test('Set predefined message', () async {
    await Future<void>.delayed(const Duration(milliseconds: 1));

    final clearAt = tz.TZDateTime.from(
      DateTime.timestamp().copyWith(millisecond: 0, microsecond: 0).add(const Duration(hours: 1)),
      tz.UTC,
    );
    bloc.setPredefinedMessage(
      id: 'predefined',
      clearAt: clearAt,
    );

    expect(
      bloc.status.transformResult(
        (e) => (
          e.message,
          e.icon,
          e.clearAt != null ? DateTimeUtils.fromSecondsSinceEpoch(tz.UTC, e.clearAt!) : null,
        ),
      ),
      emits(Result.success(('message', 'icon', clearAt))),
    );
  });

  test('Set custom message', () async {
    final clearAt = tz.TZDateTime.from(
      DateTime.timestamp().copyWith(millisecond: 0, microsecond: 0).add(const Duration(hours: 1)),
      tz.UTC,
    );
    bloc.setCustomMessage(
      message: 'message',
      icon: 'icon',
      clearAt: clearAt,
    );

    expect(
      bloc.status.transformResult(
        (e) => (
          e.message,
          e.icon,
          e.clearAt != null ? DateTimeUtils.fromSecondsSinceEpoch(tz.UTC, e.clearAt!) : null,
        ),
      ),
      emits(Result.success(('message', 'icon', clearAt))),
    );
  });

  test('Clear message', () async {
    final clearAt = tz.TZDateTime.from(
      DateTime.timestamp().copyWith(millisecond: 0, microsecond: 0).add(const Duration(hours: 1)),
      tz.UTC,
    );
    bloc
      ..setCustomMessage(
        message: 'message',
        icon: 'icon',
        clearAt: clearAt,
      )
      ..clearMessage();

    expect(
      bloc.status.transformResult(
        (e) => (e.message, e.icon, e.clearAt != null ? DateTimeUtils.fromSecondsSinceEpoch(tz.UTC, e.clearAt!) : null),
      ),
      emitsInOrder([
        Result.success(('message', 'icon', clearAt)),
        Result.success(('message', 'icon', clearAt)).asLoading(),
        Result.success((null, null, null)),
      ]),
    );
  });
}

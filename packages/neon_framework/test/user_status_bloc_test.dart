import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/user_status.dart' as user_status;

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

  final requests = <RegExp, Map<String, Response Function(RegExpMatch match, Map<String, String> queryParameters)>>{
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/predefined_statuses'): {
      'get': (match, queryParameters) => predefinedStatusesResponse(),
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/message/predefined'): {
      'put': (match, queryParameters) {
        messageId = queryParameters['messageId'];
        messageIsPredefined = true;
        clearAt = int.parse(queryParameters['clearAt']!);
        return statusResponse();
      },
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/message/custom'): {
      'put': (match, queryParameters) {
        messageId = null;
        message = queryParameters['message'];
        messageIsPredefined = false;
        icon = queryParameters['statusIcon'];
        clearAt = int.parse(queryParameters['clearAt']!);
        return statusResponse();
      },
    },
    RegExp(r'/ocs/v2\.php/apps/user_status/api/v1/user_status/status'): {
      'put': (match, queryParameters) {
        status = queryParameters['statusType']!;
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

        status = queryParameters['status']!;
        statusIsUserDefined = false;
        return statusResponse();
      },
    },
  };

  return Account(
    serverURL: Uri.parse('https://example.com'),
    username: 'test',
    password: 'test',
    httpClient: MockClient((request) async {
      for (final entry in requests.entries) {
        final match = entry.key.firstMatch(request.url.path);
        if (match != null) {
          final call = entry.value[request.method];
          if (call != null) {
            return call(match, request.url.queryParameters);
          }
        }
      }

      throw Exception(request);
    }),
  );
}

void main() {
  late Account account;
  late UserStatusBloc bloc;

  setUpAll(() {
    final platform = MockNeonPlatform();
    when(() => platform.canUseWindowManager).thenReturn(false);
    NeonPlatform.mocked(platform);

    final storage = MockNeonStorage();
    when(() => storage.requestCache).thenReturn(null);
  });

  setUp(() {
    account = mockUserStatusAccount();
    bloc = UserStatusBloc(account);
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
    // ignore: unawaited_futures
    expectLater(
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
        Result<String>.error(
          await DynamiteStatusCodeException.fromResponse(StreamedResponse(Stream.value(utf8.encode('')), 201)),
        ),
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
    final clearAt = DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000;
    bloc.setPredefinedMessage(
      id: 'predefined',
      clearAt: clearAt,
    );

    expect(
      bloc.status.transformResult((e) => (e.message, e.icon, e.clearAt)),
      emits(Result.success(('message', 'icon', clearAt))),
    );
  });

  test('Set custom message', () async {
    final clearAt = DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000;
    bloc.setCustomMessage(
      message: 'message',
      icon: 'icon',
      clearAt: clearAt,
    );

    expect(
      bloc.status.transformResult((e) => (e.message, e.icon, e.clearAt)),
      emits(Result.success(('message', 'icon', clearAt))),
    );
  });

  test('Clear message', () async {
    final clearAt = DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000;
    bloc
      ..setCustomMessage(
        message: 'message',
        icon: 'icon',
        clearAt: clearAt,
      )
      ..clearMessage();

    expect(
      bloc.status.transformResult((e) => (e.message, e.icon, e.clearAt)),
      emitsInOrder([
        Result.success(('message', 'icon', clearAt)),
        Result.success(('message', 'icon', clearAt)).asLoading(),
        Result.success((null, null, null)),
      ]),
    );
  });
}

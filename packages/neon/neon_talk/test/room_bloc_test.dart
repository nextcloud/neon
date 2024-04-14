import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_talk/src/blocs/room.dart';

import 'testing.dart';

Account mockTalkAccount() {
  var messageCount = 3;

  return mockServer({
    RegExp(r'/ocs/v2\.php/apps/spreed/api/v4/room/abcd/participants/active'): {
      'post': (match, queryParameters) => Response(
            json.encode({
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': getRoom(
                  token: 'abcd',
                ),
              },
            }),
            200,
          ),
      'delete': (match, queryParameters) => Response(
            json.encode({
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': <dynamic>[],
              },
            }),
            200,
          ),
    },
    RegExp(r'/ocs/v2\.php/apps/spreed/api/v1/chat/abcd'): {
      'get': (match, queryParameters) => Response(
            json.encode({
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': List.generate(messageCount, (i) => getChatMessage(id: messageCount - i - 1)),
              },
            }),
            200,
          ),
      'post': (match, queryParameters) => Response(
            json.encode({
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': getChatMessage(id: messageCount++),
              },
            }),
            201,
          ),
    },
  });
}

void main() {
  late Account account;
  late TalkRoomBloc bloc;

  setUpAll(() {
    final storage = MockNeonStorage();
    when(() => storage.requestCache).thenReturn(null);
  });

  setUp(() {
    final room = MockRoom();
    when(() => room.token).thenReturn('abcd');

    account = mockTalkAccount();
    bloc = TalkRoomBloc(
      account: account,
      room: room,
    );
  });

  tearDown(() async {
    // Wait for all events to be processed
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.dispose();
  });

  test('refresh', () async {
    expect(
      bloc.room.transformResult((e) => e.token),
      emitsInOrder([
        Result.success('abcd').asLoading(),
        Result.success('abcd'),
        Result.success('abcd').asLoading(),
        Result.success('abcd'),
      ]),
    );

    expect(
      bloc.messages.transformResult((e) => BuiltList<int>(e.map((m) => m.id))),
      emitsInOrder([
        Result<BuiltList<int>>.loading(),
        Result.success(BuiltList<int>([2, 1, 0])),
        Result.success(BuiltList<int>([2, 1, 0])).asLoading(),
        Result.success(BuiltList<int>([2, 1, 0])),
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await bloc.refresh();
  });

  test('sendMessage', () async {
    expect(
      bloc.messages.transformResult((e) => BuiltList<int>(e.map((m) => m.id))),
      emitsInOrder([
        Result<BuiltList<int>>.loading(),
        Result.success(BuiltList<int>([2, 1, 0])),
        Result.success(BuiltList<int>([3, 2, 1, 0])),
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.sendMessage('');
  });
}

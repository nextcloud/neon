import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_talk/src/blocs/talk.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;

import 'testing.dart';

Account mockTalkAccount() {
  var roomCount = 3;

  return mockServer({
    RegExp(r'/ocs/v2\.php/apps/spreed/api/v4/room'): {
      'get': (match, queryParameters) => Response(
            json.encode({
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': [
                  for (var i = 0; i < roomCount; i++)
                    getRoom(
                      id: i,
                      unreadMessages: i,
                    ),
                ],
              },
            }),
            200,
          ),
      'post': (match, queryParameters) {
        roomCount++;

        return Response(
          json.encode({
            'ocs': {
              'meta': {'status': '', 'statuscode': 0},
              'data': getRoom(
                id: roomCount - 1,
                unreadMessages: roomCount - 1,
              ),
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
  late TalkBloc bloc;

  setUp(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    account = mockTalkAccount();
    bloc = TalkBloc(
      account: account,
    );
  });

  tearDown(() async {
    // Wait for all events to be processed
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.dispose();
  });

  test('refresh', () async {
    expect(
      bloc.rooms.transformResult((e) => BuiltList<int>(e.map((r) => r.id))),
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

  test('createRoom', () async {
    expect(
      bloc.rooms.transformResult((e) => BuiltList<int>(e.map((r) => r.id))),
      emitsInOrder([
        Result<BuiltList<int>>.loading(),
        Result.success(BuiltList<int>([0, 1, 2])),
        Result.success(BuiltList<int>([0, 1, 2])).asLoading(),
        Result.success(BuiltList<int>([0, 1, 2, 3])),
      ]),
    );
    expect(
      bloc.unreadCounter,
      emitsInOrder([
        3,
        3,
        6,
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));

    bloc.createRoom(
      spreed.RoomType.oneToOne,
      null,
      core.AutocompleteResult(
        (b) => b
          ..id = 'test'
          ..label = ''
          ..icon = ''
          ..source = 'users'
          ..status = (autocompleteResultStatus0: null, string: '')
          ..subline = ''
          ..shareWithDisplayNameUnique = '',
      ),
    );
  });

  test('updateRoom', () async {
    expect(
      bloc.rooms.transformResult((e) => BuiltList<String>(e.map((r) => r.displayName))),
      emitsInOrder([
        Result<BuiltList<String>>.loading(),
        Result.success(BuiltList<String>(['0', '1', '2'])),
        Result.success(BuiltList<String>(['update', '1', '2'])),
      ]),
    );

    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));

    final room = MockRoom();
    when(() => room.id).thenReturn(0);
    when(() => room.displayName).thenReturn('update');
    when(() => room.unreadMessages).thenReturn(0);

    bloc.updateRoom(room);
  });
}

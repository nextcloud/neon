import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_talk/src/blocs/talk.dart';

import 'testing.dart';

Account mockTalkAccount() => mockServer({
      RegExp(r'/ocs/v2\.php/apps/spreed/api/v4/room'): {
        'get': (match, queryParameters) => Response(
              json.encode({
                'ocs': {
                  'meta': {'status': '', 'statuscode': 0},
                  'data': [
                    getRoom(
                      id: 0,
                      unreadMessages: 0,
                    ),
                    getRoom(
                      id: 1,
                      unreadMessages: 1,
                    ),
                    getRoom(
                      id: 2,
                      unreadMessages: 2,
                    ),
                  ],
                },
              }),
              200,
            ),
      },
    });

void main() {
  late Account account;
  late TalkBloc bloc;

  setUpAll(() {
    final storage = MockNeonStorage();
    when(() => storage.requestCache).thenReturn(null);
  });

  setUp(() {
    account = mockTalkAccount();
    bloc = TalkBloc(
      account: account,
    );
  });

  tearDown(() {
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
}

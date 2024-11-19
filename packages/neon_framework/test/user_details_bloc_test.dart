import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';

Account mockUserDetailsAccount() => mockServer({
      RegExp(r'/ocs/v2\.php/cloud/users/test'): {
        'put': (match, bodyBytes) => Response(
              json.encode(
                {
                  'ocs': {
                    'meta': {'status': '', 'statuscode': 0},
                    'data': <dynamic, dynamic>{},
                  },
                },
              ),
              200,
              headers: {'content-type': 'application/json'},
            ),
      },
      RegExp(r'/ocs/v2\.php/cloud/user'): {
        'get': (match, request) => Response(
              json.encode(
                {
                  'ocs': {
                    'meta': {'status': '', 'statuscode': 0},
                    'data': {
                      'additional_mail': <dynamic>[],
                      'address': '',
                      'backend': '',
                      'backendCapabilities': {
                        'setDisplayName': false,
                        'setPassword': false,
                      },
                      'biography': '',
                      'display-name': '',
                      'displayname': '',
                      'fediverse': '',
                      'groups': <dynamic>[],
                      'headline': '',
                      'id': 'test',
                      'language': '',
                      'lastLogin': 0,
                      'locale': '',
                      'manager': '',
                      'organisation': '',
                      'phone': '',
                      'profile_enabled': '',
                      'quota': {
                        'free': 0,
                        'relative': 0,
                        'total': 0,
                        'used': 0,
                      },
                      'role': '',
                      'subadmin': <dynamic>[],
                      'twitter': '',
                      'website': 'https://example.com',
                    },
                  },
                },
              ),
              200,
              headers: {'content-type': 'application/json'},
            ),
      },
    });

void main() {
  late Account account;
  late UserDetailsBloc bloc;

  setUp(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    account = mockUserDetailsAccount();
    bloc = UserDetailsBloc(
      account: account,
    );
  });

  tearDown(() {
    bloc.dispose();
  });

  test('refresh', () async {
    expect(
      bloc.userDetails.transformResult((e) => e.id),
      emitsInOrder([
        Result<String>.loading(),
        Result.success('test'),
        Result.success('test').asLoading(),
        Result.success('test'),
      ]),
    );
    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await bloc.refresh();
  });

  test('updateProperty', () async {
    expect(
      bloc.userDetails.transformResult((e) => e.website),
      emitsInOrder([
        Result<String>.loading(),
        Result.success('https://example.com'),
        Result.success('https://example.com').asLoading(),
        Result.success('https://example.org'),
      ]),
    );
    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));

    bloc.updateProperty('website', 'https://example.org');
  });
}

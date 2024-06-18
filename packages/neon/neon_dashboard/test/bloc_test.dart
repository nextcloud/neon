import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:neon_dashboard/src/blocs/dashboard.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';

Account mockDashboardAccount() => mockServer({
      RegExp(r'/ocs/v2\.php/apps/dashboard/api/v1/widgets'): {
        'get': (match, queryParameters) => Response(
              json.encode({
                'ocs': {
                  'meta': {'status': '', 'statuscode': 0},
                  'data': {
                    for (final entry in {
                      'empty': <dynamic>[],
                      'v1': [1],
                      'v2': [2],
                      'v1v2': [1, 2],
                    }.entries)
                      entry.key: {
                        'id': entry.key,
                        'title': '',
                        'order': 0,
                        'icon_class': '',
                        'icon_url': '',
                        'item_icons_round': false,
                        'item_api_versions': entry.value,
                        'reload_interval': 0,
                      },
                  },
                },
              }),
              200,
            ),
      },
      RegExp(r'/ocs/v2\.php/apps/dashboard/api/v1/widget-items'): {
        'get': (match, queryParameters) => Response(
              json.encode({
                'ocs': {
                  'meta': {'status': '', 'statuscode': 0},
                  'data': {
                    for (final key in queryParameters['widgets[]']!)
                      key: [
                        {
                          'subtitle': '',
                          'title': key,
                          'link': '',
                          'iconUrl': '',
                          'overlayIconUrl': '',
                          'sinceId': '',
                        },
                      ],
                    'tooMany1': [
                      for (var i = 0; i < 8; i++)
                        {
                          'subtitle': '',
                          'title': '$i',
                          'link': '',
                          'iconUrl': '',
                          'overlayIconUrl': '',
                          'sinceId': '',
                        },
                    ],
                  },
                },
              }),
              200,
            ),
      },
      RegExp(r'/ocs/v2\.php/apps/dashboard/api/v2/widget-items'): {
        'get': (match, queryParameters) => Response(
              json.encode({
                'ocs': {
                  'meta': {'status': '', 'statuscode': 0},
                  'data': {
                    for (final key in queryParameters['widgets[]']!)
                      key: {
                        'items': [
                          {
                            'subtitle': '',
                            'title': key,
                            'link': '',
                            'iconUrl': '',
                            'overlayIconUrl': '',
                            'sinceId': '',
                          },
                        ],
                        'emptyContentMessage': '',
                        'halfEmptyContentMessage': '',
                      },
                    'tooMany2': {
                      'items': [
                        for (var i = 0; i < 8; i++)
                          {
                            'subtitle': '',
                            'title': '$i',
                            'link': '',
                            'iconUrl': '',
                            'overlayIconUrl': '',
                            'sinceId': '',
                          },
                      ],
                      'emptyContentMessage': '',
                      'halfEmptyContentMessage': '',
                    },
                  },
                },
              }),
              200,
            ),
      },
    });

void main() {
  late Account account;
  late DashboardBloc bloc;

  setUpAll(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    account = mockDashboardAccount();
    bloc = DashboardBloc(
      account: account,
    );
  });

  tearDown(() async {
    // Wait for all events to be processed
    await Future<void>.delayed(const Duration(milliseconds: 1));
    bloc.dispose();
  });

  test('refresh', () async {
    final widgets = BuiltList<String>([
      'v1',
      'v2',
      'v1v2',
    ]);
    expect(
      bloc.widgets.transformResult((e) => BuiltList<String>(e.map((w) => w.id))),
      emitsInOrder([
        Result<BuiltList<String>>.loading(),
        Result.success(widgets),
      ]),
    );

    final items = BuiltList<String>([
      'v1',
      for (var i = 0; i < 7; i++) '$i',
      'v2',
      'v1v2',
      for (var i = 0; i < 7; i++) '$i',
    ]);
    expect(
      bloc.items
          .transformResult(
            (e) => BuiltList<String>([
              for (final items in e.values)
                for (final item in items.items) item.title,
            ]),
          )
          .distinct(),
      emitsInOrder([
        Result(BuiltList<String>(), null, isLoading: true, isCached: false),
        Result.success(items),
        Result.success(items).asLoading(),
        Result.success(items),
      ]),
    );
    // The delay is necessary to avoid a race condition with loading twice at the same time
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await bloc.refresh();
  });
}

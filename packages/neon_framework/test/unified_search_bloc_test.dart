import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/blocs/unified_search.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

Account mockUnifiedSearchAccount() => mockServer({
      RegExp(r'/ocs/v2\.php/search/providers/(.*)/search'): {
        'get': (match, queryParameters) {
          final term = queryParameters['term']!.single;
          if (term == 'error') {
            return Response('', 400);
          }
          final count = int.parse(term);
          return Response(
            json.encode(
              {
                'ocs': {
                  'meta': {'status': '', 'statuscode': 0},
                  'data': {
                    'name': match.group(1)!,
                    'isPaginated': false,
                    'entries': [
                      for (var i = 0; i < count; i++)
                        {
                          'thumbnailUrl': '',
                          'title': '$i',
                          'subline': '',
                          'resourceUrl': '',
                          'icon': '',
                          'rounded': false,
                          'attributes': <dynamic>[],
                        },
                    ],
                  },
                },
              },
            ),
            200,
          );
        },
      },
      RegExp(r'/ocs/v2\.php/search/providers'): {
        'get': (match, queryParameters) => Response(
              json.encode(
                {
                  'ocs': {
                    'meta': {'status': '', 'statuscode': 0},
                    'data': [
                      for (final id in ['a', 'b', 'c'])
                        {
                          'id': id,
                          'appId': '',
                          'name': '',
                          'icon': '',
                          'order': 0,
                          'inAppSearch': false,
                        },
                    ],
                  },
                },
              ),
              200,
            ),
      },
    });

void main() {
  final error = DynamiteStatusCodeException(http.Response('', 400));

  late AppImplementation appImplementation;
  late BehaviorSubject<AppImplementation> activeApp;
  late AppsBloc appsBloc;
  late Account account;
  late UnifiedSearchBloc bloc;

  setUp(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    appImplementation = MockAppImplementation();
    when(() => appImplementation.id).thenReturn('test');
    activeApp = BehaviorSubject<AppImplementation>.seeded(appImplementation);
    appsBloc = MockAppsBloc();
    when(() => appsBloc.activeApp).thenAnswer((_) => activeApp);

    account = mockUnifiedSearchAccount();
    bloc = UnifiedSearchBloc(
      activeAppSubject: appsBloc.activeApp,
      account: account,
    );
  });

  tearDown(() {
    unawaited(activeApp.close());
    bloc.dispose();
  });

  group('search', () {
    for (final entry in {
      '0': null,
      '2': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
      'error': Result<BuiltList<String>>.error(error),
    }.entries) {
      test(entry.key, () {
        expect(
          bloc.providers.transformResult((providers) => BuiltList<String>(providers!.map((provider) => provider.id))),
          emitsInOrder([
            Result.success(null),
            Result.success(null).asLoading(),
            Result.success(BuiltList<String>(['a', 'b', 'c'])),
          ]),
        );
        expect(
          bloc.results.map(
            (results) => BuiltMap<String, Result<BuiltList<String>>>(
              Map.fromEntries(
                results.entries.map(
                  (e) => MapEntry(
                    e.key,
                    e.value.transform(
                      (result) => BuiltList<String>(
                        result.entries.map((entry) => entry.title),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          emitsInOrder([
            BuiltMap<String, Result<BuiltList<String>>>(),
            BuiltMap<String, Result<BuiltList<String>>>({
              'a': Result<BuiltList<String>>.loading(),
              'b': Result<BuiltList<String>>.loading(),
              'c': Result<BuiltList<String>>.loading(),
            }),
            BuiltMap<String, Result<BuiltList<String>>>({
              if (entry.key != '0') 'a': entry.value,
              'b': Result<BuiltList<String>>.loading(),
              'c': Result<BuiltList<String>>.loading(),
            }),
            BuiltMap<String, Result<BuiltList<String>>>({
              if (entry.key != '0') 'a': entry.value,
              if (entry.key != '0') 'b': entry.value,
              'c': Result<BuiltList<String>>.loading(),
            }),
            BuiltMap<String, Result<BuiltList<String>>>({
              if (entry.key != '0') 'a': entry.value,
              if (entry.key != '0') 'b': entry.value,
              if (entry.key != '0') 'c': entry.value,
            }),
          ]),
        );

        bloc.search(entry.key);
      });
    }
  });

  test('Active app change resets', () {
    expect(
      bloc.results,
      emitsInOrder([
        BuiltMap<String, Result<core.UnifiedSearchResult>>(),
        BuiltMap<String, Result<core.UnifiedSearchResult>>(),
      ]),
    );

    activeApp.add(MockAppImplementation());
  });

  test('Extended search', () async {
    when(() => appImplementation.id).thenReturn('a');

    expect(
      bloc.providers.transformResult((providers) => BuiltList<String>(providers!.map((provider) => provider.id))),
      emitsInOrder([
        Result.success(null),
        Result.success(null).asLoading(),
        Result.success(BuiltList<String>(['a', 'b', 'c'])),
      ]),
    );
    expect(
      bloc.results.map(
        (results) => BuiltMap<String, Result<BuiltList<String>>>(
          Map.fromEntries(
            results.entries.map(
              (e) => MapEntry(
                e.key,
                e.value.transform(
                  (result) => BuiltList<String>(
                    result.entries.map((entry) => entry.title),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      emitsInOrder([
        BuiltMap<String, Result<BuiltList<String>>>(),
        BuiltMap<String, Result<BuiltList<String>>>({
          'a': Result<BuiltList<String>>.loading(),
        }),
        BuiltMap<String, Result<BuiltList<String>>>({
          'a': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
        }),
        BuiltMap<String, Result<BuiltList<String>>>({
          'a': Result<BuiltList<String>>.loading(),
          'b': Result<BuiltList<String>>.loading(),
          'c': Result<BuiltList<String>>.loading(),
        }),
        BuiltMap<String, Result<BuiltList<String>>>({
          'a': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
          'b': Result<BuiltList<String>>.loading(),
          'c': Result<BuiltList<String>>.loading(),
        }),
        BuiltMap<String, Result<BuiltList<String>>>({
          'a': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
          'b': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
          'c': Result<BuiltList<String>>.loading(),
        }),
        BuiltMap<String, Result<BuiltList<String>>>({
          'a': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
          'b': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
          'c': Result<BuiltList<String>>.success(BuiltList(['0', '1'])),
        }),
      ]),
    );
    expect(
      bloc.isExtendedSearch,
      emitsInOrder([
        null,
        false,
        true,
      ]),
    );

    bloc.search('2');

    await Future<void>.delayed(const Duration(milliseconds: 1));

    bloc.enableExtendedSearch();
  });

  test('Reset', () {
    expect(
      bloc.results,
      emitsInOrder([
        BuiltMap<String, Result<core.UnifiedSearchResult>>(),
        BuiltMap<String, Result<core.UnifiedSearchResult>>(),
      ]),
    );
    expect(
      bloc.isExtendedSearch,
      emitsInOrder([
        null,
        null,
      ]),
    );

    bloc.search('');
  });
}

// ignore_for_file: prefer_asserts_with_message

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/utils/validators.dart';
import 'package:neon_framework/src/widgets/autocomplete.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';

Account mockAutocompleteAccount() {
  return mockServer({
    RegExp(r'/ocs/v2\.php/core/autocomplete/get'): {
      'get': (match, queryParameters) {
        assert(queryParameters['itemType']!.single == 'itemType');
        assert(queryParameters['itemId']!.single == 'itemId');
        assert(queryParameters['shareTypes[]']![0] == '0');
        assert(queryParameters['shareTypes[]']![1] == '1');
        assert(queryParameters['limit']!.single == '10');

        return Response(
          json.encode(
            {
              'ocs': {
                'meta': {'status': '', 'statuscode': 0},
                'data': [
                  {
                    'id': '',
                    'label': 'test',
                    'icon': '',
                    'source': '',
                    'status': '',
                    'subline': '',
                    'shareWithDisplayNameUnique': '',
                  },
                ],
              },
            },
          ),
          200,
        );
      },
    },
  });
}

class MockOnSelectedCallbackFunction extends Mock {
  FutureOr<void> call(core.AutocompleteResult result);
}

class AutocompleteResultFake extends Fake implements core.AutocompleteResult {}

void main() {
  late Account account;

  setUpAll(() {
    registerFallbackValue(AutocompleteResultFake());

    FakeNeonStorage.setup();

    account = mockAutocompleteAccount();
  });

  testWidgets('Autocomplete', (tester) async {
    final callback = MockOnSelectedCallbackFunction();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: Builder(
          builder: (context) => NeonAutocomplete(
            itemType: 'itemType',
            itemId: 'itemId',
            shareTypes: const [
              core.ShareType.user,
              core.ShareType.group,
            ],
            validator: (input) => validateNotEmpty(context, input),
            resultBuilder: (context, result, onSelected) {
              return InkWell(
                onTap: () {
                  onSelected(result);
                },
                child: Text(result.label),
              );
            },
            onSelected: callback.call,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    verifyNever(() => callback(any()));

    await tester.enterText(find.byType(TextFormField), 't');
    await tester.pumpAndSettle();

    await tester.tap(find.text('test'), warnIfMissed: false);
    await tester.pumpAndSettle();

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    verify(
      () => callback(
        core.AutocompleteResult(
          (b) => b
            ..id = ''
            ..label = 'test'
            ..icon = ''
            ..source = ''
            ..status = (autocompleteResultStatus0: null, string: '')
            ..subline = ''
            ..shareWithDisplayNameUnique = '',
        ),
      ),
    ).called(1);
  });
}

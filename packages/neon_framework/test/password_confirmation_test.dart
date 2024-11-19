import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/utils/password_confirmation.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/testing.dart';
import 'package:provider/provider.dart';

void main() {
  final now = DateTime.timestamp();
  late Account account;

  setUp(() {
    account = mockServer({
      RegExp(r'/ocs/v2\.php/core/apppassword/confirm'): {
        'put': (match, bodyBytes) => http.Response(
              json.encode({
                'ocs': {
                  'meta': {'status': '', 'statuscode': 0},
                  'data': <dynamic, dynamic>{
                    'lastLogin': 0,
                  },
                },
              }),
              200,
              headers: {'content-type': 'application/json'},
            ),
      },
    });

    FakeNeonStorage.setup();
  });

  testWidgets('Success', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: const SizedBox(),
      ),
    );
    final context = tester.element(find.byType(SizedBox));

    var future = confirmPassword(
      context,
      now: now.subtract(const Duration(minutes: 29)),
    );
    await tester.pumpAndSettle();
    expect(find.byType(NeonPasswordConfirmationDialog), findsOne);

    await tester.runAsync(() async {
      await tester.enterText(find.byType(TextFormField), 'password');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    });

    expect(await future, true);

    expect(
      await confirmPassword(
        context,
        now: now,
      ),
      true,
    );

    future = confirmPassword(
      context,
      now: now.add(const Duration(minutes: 1)),
    );
    await tester.pumpAndSettle();
    expect(find.byType(NeonPasswordConfirmationDialog), findsOne);

    await tester.runAsync(() async {
      await tester.enterText(find.byType(TextFormField), 'password');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    });

    expect(await future, true);
  });

  testWidgets('Cancel', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          Provider<Account>.value(value: account),
        ],
        child: const SizedBox(),
      ),
    );
    final context = tester.element(find.byType(SizedBox));

    final future = confirmPassword(
      context,
      now: now.subtract(const Duration(minutes: 29)),
    );
    await tester.pumpAndSettle();
    expect(find.byType(NeonPasswordConfirmationDialog), findsOne);

    Navigator.of(context).pop();

    expect(await future, false);
  });
}

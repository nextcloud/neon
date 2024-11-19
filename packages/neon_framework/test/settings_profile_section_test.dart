import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/src/widgets/settings_profile_field.dart';
import 'package:neon_framework/src/widgets/settings_profile_section.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:provider/provider.dart';

class MockStringStringCallbackFunction extends Mock {
  void call(String key, String value);
}

void main() {
  late final provisioning_api.UserDetails userDetails;
  late Account account;

  setUpAll(() {
    userDetails = MockUserDetails();
    when(() => userDetails.toJson()).thenReturn({
      'displayname': '123',
      'displaynameScope': 'v2-private',
      'email': '',
      'emailScope': 'v2-private',
      'phone': '',
      'phoneScope': 'v2-private',
      'address': '',
      'addressScope': 'v2-private',
      'website': '',
      'websiteScope': 'v2-private',
      'twitter': '',
      'twitterScope': 'v2-private',
      'fediverse': '',
      'fediverseScope': 'v2-private',
      'organisation': '',
      'organisationScope': 'v2-private',
      'role': '',
      'roleScope': 'v2-private',
      'headline': '',
      'headlineScope': 'v2-private',
      'biography': '',
      'biographyScope': 'v2-private',
    });

    FakeNeonStorage.setup();
  });

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
  });

  testWidgets('Update scope', (tester) async {
    final callback = MockStringStringCallbackFunction();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [Provider<Account>.value(value: account)],
        child: SingleChildScrollView(
          child: NeonSettingsProfileSection(
            userDetails: userDetails,
            onUpdateProperty: callback.call,
          ),
        ),
      ),
    );
    expect(find.byType(NeonSettingsProfileField), findsExactly(11));

    await tester.tap(find.byIcon(Icons.phone_android).first);
    await tester.pumpAndSettle();

    await tester.runAsync(() async {
      await tester.tap(find.byIcon(Icons.web));
      await tester.pumpAndSettle();

      expect(find.byType(NeonPasswordConfirmationDialog), findsOne);

      await tester.enterText(find.byType(TextFormField), 'password');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    });

    verify(() => callback('displaynameScope', 'v2-published')).called(1);
  });

  testWidgets('Update value', (tester) async {
    final callback = MockStringStringCallbackFunction();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [Provider<Account>.value(value: account)],
        child: SingleChildScrollView(
          child: NeonSettingsProfileSection(
            userDetails: userDetails,
            onUpdateProperty: callback.call,
          ),
        ),
      ),
    );
    expect(find.byType(NeonSettingsProfileField), findsExactly(11));

    await tester.enterText(find.byType(TextField).first, '456');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(find.byType(NeonPasswordConfirmationDialog), findsOne);

    await tester.runAsync(() async {
      await tester.enterText(find.byType(TextFormField), 'password');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
    });

    verify(() => callback('displayname', '456')).called(1);
  });
}

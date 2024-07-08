import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:neon_framework/src/blocs/maintenance_mode.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/testing.dart';

Account mockMaintenanceModeAccount() {
  return mockServer({
    RegExp(r'/status\.php'): {
      'get': (match, bodyBytes) {
        return Response(
          json.encode({
            'installed': false,
            'maintenance': true,
            'needsDbUpgrade': false,
            'version': '',
            'versionstring': '',
            'edition': '',
            'productname': '',
            'extendedSupport': false,
          }),
          200,
          headers: {'content-type': 'application/json'},
        );
      },
    },
  });
}

void main() {
  late Account account;
  late MaintenanceModeBloc bloc;

  setUp(() {
    FakeNeonStorage.setup();
  });

  setUp(() {
    account = mockMaintenanceModeAccount();
    bloc = MaintenanceModeBloc(
      account: account,
    );
  });

  tearDown(() {
    bloc.dispose();
  });

  test('refresh', () async {
    expect(bloc.onMaintenanceMode, emits(null));
    await Future<void>.delayed(const Duration(milliseconds: 1));
    await bloc.refresh();
  });
}

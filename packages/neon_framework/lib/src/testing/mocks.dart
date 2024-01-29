// ignore_for_file: avoid_implementing_value_types, public_member_api_docs, missing_override_of_must_be_overridden

import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/settings.dart';
import 'package:neon_framework/src/blocs/apps.dart';
import 'package:neon_framework/src/blocs/capabilities.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/src/settings/models/exportable.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:neon_framework/src/utils/account_options.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountMock extends Mock implements Account {}

class AppImplementationMock extends Mock implements AppImplementation {}

class AccountsBlocMock extends Mock implements AccountsBloc {}

class MockNeonPlatform extends Mock implements NeonPlatform {}

class DisposableMock extends Mock implements Disposable {}

class MockUserStatusBloc extends Mock implements UserStatusBloc {}

class MockAppsBloc extends Mock implements AppsBloc {}

class MockCapabilitiesBloc extends Mock implements CapabilitiesBloc {}

class MockStorage extends Mock implements SettingsStorage {}

class AccountOptionsMock extends Mock implements AccountOptions {}

class ExporterMock extends Mock implements Exportable {}

class OptionMock extends Mock implements ToggleOption {}

class AppImplementationOptionsMock extends Mock implements AppImplementationOptions {}

class MockedCache extends Mock implements Cache {}

class SharedPreferencesMock extends Mock implements SharedPreferences {}

class MockCallbackFunction<T> extends Mock {
  FutureOr<T> call();
}

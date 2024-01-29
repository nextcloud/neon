// ignore_for_file: avoid_implementing_value_types, public_member_api_docs, missing_override_of_must_be_overridden

import 'dart:async';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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

class MockAccount extends Mock implements Account {}

class MockAppImplementation extends Mock implements AppImplementation {}

class MockAccountsBloc extends Mock implements AccountsBloc {}

class MockNeonPlatform extends Mock implements NeonPlatform {}

class MockDisposable extends Mock implements Disposable {}

class MockUserStatusBloc extends Mock implements UserStatusBloc {}

class MockAppsBloc extends Mock implements AppsBloc {}

class MockCapabilitiesBloc extends Mock implements CapabilitiesBloc {}

class MockStorage extends Mock implements SettingsStorage {}

class MockAccountOptions extends Mock implements AccountOptions {}

class MockExporter extends Mock implements Exportable {}

class MockOption extends Mock implements ToggleOption {}

class MockAppImplementationOptions extends Mock implements AppImplementationOptions {}

class MockCache extends Mock implements Cache {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockCallbackFunction<T> extends Mock {
  FutureOr<T> call();
}

class MockCacheManager extends Mock implements DefaultCacheManager {}

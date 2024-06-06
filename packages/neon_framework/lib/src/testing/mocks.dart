// ignore_for_file: avoid_implementing_value_types, public_member_api_docs, missing_override_of_must_be_overridden

import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/settings.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/capabilities.dart';
import 'package:neon_framework/src/models/account_cache.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/src/settings/models/exportable.dart';
import 'package:neon_framework/src/storage/persistence.dart';
import 'package:neon_framework/src/utils/account_options.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

class MockAccount extends Mock implements Account {
  @internal
  @override
  Uri completeUri(Uri uri) => uri;
}

class MockAccountCache<T extends Disposable> extends Mock implements AccountCache<T> {}

class MockAppImplementation<T extends Bloc, R extends AppImplementationOptions> extends Mock
    implements AppImplementation<T, R> {}

class MockAccountsBloc extends Mock implements AccountsBloc {}

class MockNeonPlatform extends Mock implements NeonPlatform {}

class MockDisposable extends Mock implements Disposable {}

class MockUserStatusBloc extends Mock implements UserStatusBloc {}

class MockAppsBloc extends Mock implements AppsBloc {}

class MockCapabilitiesBloc extends Mock implements CapabilitiesBloc {}

class MockStorage extends Mock implements SettingsStore {}

class MockAccountOptions extends Mock implements AccountOptions {}

class MockExporter extends Mock implements Exportable {}

class MockOption extends Mock implements ToggleOption {}

class MockAppImplementationOptions extends Mock implements AppImplementationOptions {}

class MockRequestCache extends Mock implements RequestCache {}

class MockNeonStorage extends Mock implements NeonStorage {
  MockNeonStorage() {
    NeonStorage.mocked(this);
  }
}

class FakeNeonStorage extends Fake implements NeonStorage {
  FakeNeonStorage.setup() {
    NeonStorage.mocked(this);
  }

  @override
  Null get requestCache => null;

  @override
  Null cookieStore({required String accountID, required Uri serverURL}) => null;
}

class MockCachedPersistence<T extends Object> extends Mock implements CachedPersistence<T> {}

class MockPersistence<T extends Object> extends Mock implements Persistence<T> {}

class MockSettingsStore extends Mock implements SettingsStore {}

class MockSharedPreferencesPlatform extends Mock implements SharedPreferencesStorePlatform {
  @override
  bool get isMock => true;
}

class MockCallbackFunction<T> extends Mock {
  T call();
}

class MockUserDetailsBloc extends Mock implements UserDetailsBloc {}

class MockUserDetails extends Mock implements provisioning_api.UserDetails {}

class MockSelectOption<T> extends Mock implements SelectOption<T> {}

class MockGoRouter extends Mock implements GoRouter {}

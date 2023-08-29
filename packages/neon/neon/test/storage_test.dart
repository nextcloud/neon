import 'package:neon/src/settings/models/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  test('AppStorage', () async {
    expect(() => NeonStorage.database, throwsA(isA<StateError>()));

    SharedPreferences.setMockInitialValues({});
    await NeonStorage.init();

    expect(NeonStorage.database, isA<SharedPreferences>());
  });
}

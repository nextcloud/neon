import 'package:neon_framework/src/platform/platform.dart';
import 'package:test/test.dart';

void main() {
  test('NeonPlatform', () async {
    expect(() => NeonPlatform.instance, throwsA(isA<StateError>()));

    await NeonPlatform.setup();

    expect(NeonPlatform.instance, isA<NeonPlatform>());
  });
}

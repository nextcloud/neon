import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/testing.dart';

void main() {
  test('Disposable extensions', () {
    final disposable0 = MockDisposable();
    final disposable1 = MockDisposable();
    final disposable3 = MockDisposable();

    final list = [
      disposable0,
      disposable1,
      disposable3,
    ];

    // ignore: cascade_invocations
    list.disposeAll();

    verify(disposable0.dispose).called(1);
    verify(disposable1.dispose).called(1);
    verify(disposable3.dispose).called(1);

    final map = {
      'disposable0': disposable0,
      'disposable1': disposable1,
      'disposable3': disposable3,
    };

    // ignore: cascade_invocations
    map.disposeAll();

    verify(disposable0.dispose).called(1);
    verify(disposable1.dispose).called(1);
    verify(disposable3.dispose).called(1);
  });
}

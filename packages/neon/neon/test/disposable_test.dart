// ignore_for_file: cascade_invocations

import 'package:mocktail/mocktail.dart';
import 'package:neon/src/models/disposable.dart';
import 'package:test/test.dart';

class DisposableMock extends Mock implements Disposable {}

void main() {
  test('Disposable extensions', () {
    final disposable0 = DisposableMock();
    final disposable1 = DisposableMock();
    final disposable3 = DisposableMock();

    final list = [
      disposable0,
      disposable1,
      disposable3,
    ];

    list.disposeAll();

    verify(disposable0.dispose).called(1);
    verify(disposable1.dispose).called(1);
    verify(disposable3.dispose).called(1);

    final map = {
      'disposable0': disposable0,
      'disposable1': disposable1,
      'disposable3': disposable3,
    };

    map.disposeAll();

    verify(disposable0.dispose).called(1);
    verify(disposable1.dispose).called(1);
    verify(disposable3.dispose).called(1);
  });
}

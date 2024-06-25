import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/models/account_cache.dart';
import 'package:neon_framework/testing.dart';

void main() {
  final disposable0 = MockDisposable();
  final disposable1 = MockDisposable();
  final account0 = MockAccount();
  final account1 = MockAccount();

  group('AccountCache', () {
    test('map functionality', () {
      final cache = AccountCache<MockDisposable>();

      expect(cache[account0], isNull);

      cache[account0] = disposable0;
      expect(cache[account0], disposable0);

      expect(cache[account0] ??= disposable1, disposable0);
      expect(cache[account1] ??= disposable1, disposable1);
    });

    test('prune', () {
      final cache = AccountCache<MockDisposable>();
      cache[account0] = disposable0;
      cache[account1] = disposable1;

      cache.pruneAgainst([account0]);

      expect(cache[account0], disposable0);
      expect(cache[account1], isNull);
      verify(disposable1.dispose).called(1);
    });

    test('dispose', () {
      final cache = AccountCache<MockDisposable>();
      cache[account0] = disposable0;
      cache[account1] = disposable1;

      cache.dispose();

      expect(cache[account0], isNull);
      expect(cache[account1], isNull);
      verify(disposable0.dispose).called(1);
      verify(disposable1.dispose).called(1);
    });

    test('remove', () {
      final cache = AccountCache<MockDisposable>();
      cache[account0] = disposable0;
      cache[account1] = disposable1;

      cache.remove(null);

      expect(cache[account0], disposable0);
      expect(cache[account1], disposable1);

      cache.remove(account0);
      expect(cache[account0], isNull);
      verify(disposable0.dispose).called(1);
    });
  });
}

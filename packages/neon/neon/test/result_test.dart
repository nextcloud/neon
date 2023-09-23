// ignore_for_file: inference_failure_on_instance_creation

import 'package:neon/blocs.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    test('Equality', () {
      const data = 'someData';

      const a = Result(
        data,
        null,
        isLoading: true,
        isCached: false,
      );
      const b = Result(
        data,
        null,
        isLoading: true,
        isCached: true,
      );

      expect(a, equals(a), reason: 'identical');
      expect(a, equals(b), reason: 'ignore cached state in equality');

      expect(a.hashCode, equals(a.hashCode), reason: 'identical');
      expect(a.hashCode, isNot(equals(b.hashCode)), reason: 'hashCode should respect the cached state');
    });

    test('Transform to loading', () {
      const data = 'someData';

      final a = Result.success(data);
      const b = Result(
        data,
        null,
        isLoading: true,
        isCached: false,
      );

      expect(a, isNot(equals(b)));
      expect(a.asLoading(), equals(b));
    });

    test('data check', () {
      const data = 'someData';

      final a = Result.loading();
      final b = Result.success(data);
      const c = Result(
        data,
        null,
        isLoading: false,
        isCached: true,
      );

      expect(a.hasData, false);
      expect(b.hasData, true);

      expect(() => a.requireData, throwsStateError);
      expect(b.requireData, equals(data));

      expect(b.hasUncachedData, true);
      expect(c.hasUncachedData, false);
    });

    test('error check', () {
      const error = 'someError';

      final a = Result.error(error);

      expect(a.hasError, true);
    });

    test('transform', () {
      const data = 1;

      final a = Result.success(data);

      String transformer(final int data) => data.toString();

      expect(a.transform(transformer), equals(Result.success(data.toString())));
    });
  });
}

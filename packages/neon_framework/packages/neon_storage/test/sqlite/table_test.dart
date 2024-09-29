import 'package:neon_storage/neon_sqlite.dart';
import 'package:test/test.dart';

class _TestTable extends Table {
  @override
  String get name => throw UnimplementedError();

  @override
  int get version => throw UnimplementedError();
}

void main() {
  group('Table', () {
    test('can be implemented', () {
      expect(_TestTable(), isNotNull);
    });
  });
}

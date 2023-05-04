import 'package:dynamite/dynamite.dart';
import 'package:test/test.dart';

void main() {
  group(TypeResultList, () {
    test('name', () {
      final subType = TypeResultBase('String');
      final listType = TypeResultList('BuiltList', subType);

      expect(listType.name, 'BuiltList<String>');
    });
  });

  group(TypeResultMap, () {
    test('name', () {
      final subType = TypeResultBase('int');
      final listType = TypeResultMap('BuiltMap', subType);

      expect(listType.name, 'BuiltMap<String, int>');
    });
  });

  group(TypeResultObject, () {
    test('name', () {
      final subType = TypeResultBase('String');
      final listType = TypeResultObject('CustomType', generics: [subType]);

      expect(listType.name, 'CustomType<String>');
    });
  });

  group(TypeResultBase, () {
    test('name', () {
      final type = TypeResultBase('String');

      expect(type.name, 'String');
    });
  });
}

import 'package:dynamite/dynamite.dart';
import 'package:test/test.dart';

void main() {
  group(TypeResultList, () {
    test('name', () {
      final subType = TypeResultBase('String');
      final type = TypeResultList('BuiltList', subType);

      expect(type.name, 'BuiltList<String>');
      expect(type.fullType, 'FullType(BuiltList, [FullType(String)])');
    });
  });

  group(TypeResultMap, () {
    test('name', () {
      final subType = TypeResultBase('int');
      final type = TypeResultMap('BuiltMap', subType);

      expect(type.name, 'BuiltMap<String, int>');
      expect(type.fullType, 'FullType(BuiltMap, [FullType(String), FullType(int)])');
    });
  });

  group(TypeResultObject, () {
    test('name', () {
      final subType = TypeResultBase('String');
      final type = TypeResultObject('CustomType', generics: [subType]);

      expect(type.name, 'CustomType<String>');
      expect(type.fullType, 'FullType(CustomType, [FullType(String)])');
    });
  });

  group(TypeResultBase, () {
    test('name', () {
      final type = TypeResultBase('String');

      expect(type.name, 'String');
      expect(type.fullType, 'FullType(String)');
    });
  });
}

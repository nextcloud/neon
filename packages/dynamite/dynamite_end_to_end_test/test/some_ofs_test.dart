import 'package:built_value/json_object.dart';
import 'package:dynamite_end_to_end_test/some_ofs.openapi.dart';
import 'package:test/test.dart';

void main() {
  test('Array with unspecified items', () {
    final object = OneOfUnspecifiedArray(
      (final b) => b
        ..data = JsonObject(['attribute', 'attributeValue'])
        ..base.update(
          (final b) => b..attribute = 'attributeValue',
        ),
    );

    final json = {'attribute': 'attributeValue'};

    expect(object.toJson(), equals(json));
    expect(OneOfUnspecifiedArray.fromJson(json), equals(object));
  });

  test(
    'Array with String items',
    () {
      final object = OneOfStringArray(
        (final b) => b
          ..data = JsonObject(['attributeValue', 'attributeValue', 'attributeValue'])
          ..builtListString.replace(['attributeValue', 'attributeValue', 'attributeValue']),
      );

      final json = {
        'builtListString': ['attributeValue', 'attributeValue', 'attributeValue'],
      };

      expect(object.toJson(), equals(json));
      expect(OneOfStringArray.fromJson(json), equals(object));
    },
    skip: true,
  );
}

import 'package:built_value/json_object.dart';
import 'package:dynamite_end_to_end_test/nested_ofs.openapi.dart';
import 'package:test/test.dart';

void main() {
  test('BaseNestedAllOf', () {
    final object = BaseNestedAllOf(
      (final b) => b
        ..attribute = 'attributeValue'
        ..attributeAllOf = 'attributeAllOfValue'
        ..attributeNestedAllOf = 'attributeNestedAllOf'
        ..base.update(
          (final b) => b..attribute = 'baseAttributeValue',
        )
        ..baseAnyOf1.update(
          (final b) => b..attributeAnyOf = 'baseAnyOfAttributeAnyOfValue',
        )
        ..baseOneOf1.update(
          (final b) => b..attributeOneOf = 'baseAnyOfAttributeOneOfValue',
        ),
    );

    final json = {
      'attribute': 'attributeValue',
      'attribute-allOf': 'attributeAllOfValue',
      'base': {'attribute': 'baseAttributeValue'},
      'baseOneOf1': {'attribute-oneOf': 'baseAnyOfAttributeOneOfValue'},
      'baseAnyOf1': {'attribute-anyOf': 'baseAnyOfAttributeAnyOfValue'},
      'attribute-nested-allOf': 'attributeNestedAllOf',
    };

    expect(object.toJson(), equals(json));
    expect(BaseNestedAllOf.fromJson(json), equals(object));
  });

  test('BaseNestedOneOf', () {
    final object = BaseNestedOneOf(
      (final b) => b
        ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
        ..baseAllOf.update((final b) {})
        ..baseOneOf.update(
          (final b) => b
            ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
            ..base.update((final b) {})
            ..baseOneOf1.attributeOneOf = 'baseOneOfAttributeOneOfValue',
        )
        ..baseAnyOf.update(
          (final b) => b
            ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
            ..base.update((final b) {})
            ..baseAnyOf1.update((final b) {}),
        )
        ..baseNestedOneOf3.update((final b) {}),
    );

    final json = {
      'attribute-oneOf': 'baseOneOfAttributeOneOfValue',
    };

    expect(object.toJson(), equals(json));
    expect(BaseNestedOneOf.fromJson(json), equals(object));
  });

  test('BaseNestedAnyOf', () {
    final object = BaseNestedAnyOf(
      (final b) => b
        ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
        ..baseAllOf.update((final b) {})
        ..baseOneOf.update(
          (final b) => b
            ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
            ..base.update((final b) {})
            ..baseOneOf1.attributeOneOf = 'baseOneOfAttributeOneOfValue',
        )
        ..baseAnyOf.update(
          (final b) => b
            ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
            ..base.update((final b) {})
            ..baseAnyOf1.update((final b) {}),
        )
        ..baseNestedAnyOf3.update((final b) {}),
    );

    final json = {
      'attribute-oneOf': 'baseOneOfAttributeOneOfValue',
    };

    expect(object.toJson(), equals(json));
    expect(BaseNestedAnyOf.fromJson(json), equals(object));
  });
}

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
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
        ..baseOneOf.update(
          (final b) => b
            ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
            ..baseOneOf1.attributeOneOf = 'baseOneOfAttributeOneOfValue',
        ),
    );

    final json = {
      'attribute-oneOf': 'baseOneOfAttributeOneOfValue',
    };

    expect(BaseNestedOneOf.fromJson(json), equals(object));
    expect(object.toJson(), equals(json));
  });

  test('BaseNestedAnyOf', () {
    final object = BaseNestedAnyOf(
      (final b) => b
        ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
        ..baseOneOf.update(
          (final b) => b
            ..data = JsonObject(['attribute-oneOf', 'baseOneOfAttributeOneOfValue'])
            ..baseOneOf1.attributeOneOf = 'baseOneOfAttributeOneOfValue',
        ),
    );

    final json = {
      'attribute-oneOf': 'baseOneOfAttributeOneOfValue',
    };

    expect(object.toJson(), equals(json));
    expect(BaseNestedAnyOf.fromJson(json), equals(object));
  });

  test('BaseOneOf', () {
    final object = BaseOneOf(
      (final b) => b
        ..data = JsonObject(['attribute-oneOf', 'attributeOneOfValue'])
        ..baseOneOf1.attributeOneOf = 'attributeOneOfValue',
    );
    var json = {'attribute-oneOf': 'attributeOneOfValue'};
    expect(BaseOneOf.fromJson(json), equals(object));
    expect(object.toJson(), equals(json));

    final builder = BaseOneOfBuilder()
      ..data = JsonObject(['attribute-oneOf', 'attributeOneOfValue'])
      ..baseOneOf1.attributeOneOf = 'attributeOneOfValue'
      ..base.attribute = 'baseAttributeValue';
    json = {
      'attribute-oneOf': 'attributeOneOfValue',
      'attribute': 'baseAttributeValue',
    };
    expect(builder.build, throwsA(isA<StateError>()));
    expect(() => BaseOneOf.fromJson(json), throwsA(isA<DeserializationError>()));

    json = {};
    expect(() => BaseOneOf.fromJson(json), throwsA(isA<DeserializationError>()));
  });

  test('BaseAnyOf', () {
    var object = BaseAnyOf(
      (final b) => b
        ..data = JsonObject(['attribute-anyOf', 'attributeAnyOfValue'])
        ..baseAnyOf1.attributeAnyOf = 'attributeAnyOfValue',
    );
    var json = {'attribute-anyOf': 'attributeAnyOfValue'};
    expect(BaseAnyOf.fromJson(json), equals(object));
    expect(object.toJson(), equals(json));

    object = BaseAnyOf(
      (final b) => b
        ..data = JsonObject(['attribute-anyOf', 'attributeAnyOfValue', 'attribute', 'baseAttributeValue'])
        ..baseAnyOf1.attributeAnyOf = 'attributeAnyOfValue'
        ..base.attribute = 'baseAttributeValue',
    );
    json = {
      'attribute-anyOf': 'attributeAnyOfValue',
      'attribute': 'baseAttributeValue',
    };
    expect(BaseAnyOf.fromJson(json), equals(object));
    expect(object.toJson(), equals(json));

    json = {};
    expect(() => BaseAnyOf.fromJson(json), throwsA(isA<DeserializationError>()));
  });
}

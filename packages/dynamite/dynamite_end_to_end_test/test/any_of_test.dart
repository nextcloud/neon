import 'package:dynamite_end_to_end_test/any_of.openapi.dart';
import 'package:test/test.dart';

void main() {
  test('ObjectAnyOf', () {
    ObjectAnyOf object = (
      objectAnyOf0: ObjectAnyOf0((final b) => b..attribute1AnyOf = 'attribute1AnyOf'),
      objectAnyOf1: null,
    );

    Object? json = {'attribute1-anyOf': 'attribute1AnyOf'};

    expect(object.toJson(), equals(json));
    expect($ObjectAnyOf0ObjectAnyOf1Extension.fromJson(json), equals(object));

    object = (
      objectAnyOf0: null,
      objectAnyOf1: ObjectAnyOf1((final b) => b..attribute2AnyOf = 'attribute2AnyOf'),
    );

    json = {'attribute2-anyOf': 'attribute2AnyOf'};

    expect(object.toJson(), equals(json));
    expect($ObjectAnyOf0ObjectAnyOf1Extension.fromJson(json), equals(object));
  });

  test('MixedAnyOf', () {
    MixedAnyOf object = (
      mixedAnyOf1: MixedAnyOf1((final b) => b..attributeAnyOf = 'attributeAnyOf'),
      string: null,
    );

    Object? json = {'attribute-anyOf': 'attributeAnyOf'};

    expect(object.toJson(), equals(json));
    expect($MixedAnyOf1StringExtension.fromJson(json), equals(object));

    object = (
      mixedAnyOf1: null,
      string: 'string',
    );

    json = 'string';

    expect(object.toJson(), equals(json));
    expect($MixedAnyOf1StringExtension.fromJson(json), equals(object));
  });

  test('OneObjectAnyOf', () {
    final object = OneObjectAnyOf((final b) => b..attributeAnyOf = 'attributeAnyOf');

    final json = {'attribute-anyOf': 'attributeAnyOf'};

    expect(object.toJson(), equals(json));
    expect(OneObjectAnyOf.fromJson(json), equals(object));
    expect(object, isA<OneObjectAnyOf>());
  });

  test('OneValueAnyOf', () {
    const object = 'string';
    expect(object, isA<OneValueAnyOf>());
  });

  test('AnyOfIntDouble', () {
    AnyOfIntDouble object = (
      $double: 0.5971645863260784,
      $int: null,
    );

    Object? json = 0.5971645863260784;

    expect(object.toJson(), equals(json));
    expect($DoubleIntExtension.fromJson(json), equals(object));

    object = (
      $double: null,
      $int: 361,
    );

    json = 361;

    expect(object.toJson(), equals(json));
    expect($DoubleIntExtension.fromJson(json), equals(object));
  });

  test('AnyOfIntDoubleOther', () {
    AnyOfIntDoubleOther object = (
      $double: 0.5971645863260784,
      $int: null,
      string: null,
    );

    Object? json = 0.5971645863260784;

    expect(object.toJson(), equals(json));
    expect($DoubleIntStringExtension.fromJson(json), equals(object));

    object = (
      $double: null,
      $int: 361,
      string: null,
    );

    json = 361;

    expect(object.toJson(), equals(json));
    expect($DoubleIntStringExtension.fromJson(json)..validateAnyOf(), equals(object));

    object = (
      $double: null,
      $int: null,
      string: 'string',
    );

    json = 'string';

    expect(object.toJson(), equals(json));
    expect($DoubleIntStringExtension.fromJson(json), equals(object));
  });
}

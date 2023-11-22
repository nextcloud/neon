import 'package:dynamite_end_to_end_test/one_of.openapi.dart';
import 'package:test/test.dart';

void main() {
  test('ObjectOneOf', () {
    ObjectOneOf object = (
      objectOneOf0: ObjectOneOf0((final b) => b..attribute1OneOf = 'attribute1OneOf'),
      objectOneOf1: null,
    );

    Object? json = {'attribute1-oneOf': 'attribute1OneOf'};

    expect(object.toJson(), equals(json));
    expect($ObjectOneOf0ObjectOneOf1Extension.fromJson(json), equals(object));

    object = (
      objectOneOf0: null,
      objectOneOf1: ObjectOneOf1((final b) => b..attribute2OneOf = 'attribute2OneOf'),
    );

    json = {'attribute2-oneOf': 'attribute2OneOf'};

    expect(object.toJson(), equals(json));
    expect($ObjectOneOf0ObjectOneOf1Extension.fromJson(json), equals(object));
  });

  test('MixedOneOf', () {
    MixedOneOf object = (
      mixedOneOf1: MixedOneOf1((final b) => b..attributeOneOf = 'attributeOneOf'),
      string: null,
    );

    Object? json = {'attribute-oneOf': 'attributeOneOf'};

    expect(object.toJson(), equals(json));
    expect($MixedOneOf1StringExtension.fromJson(json), equals(object));

    object = (
      mixedOneOf1: null,
      string: 'string',
    );

    json = 'string';

    expect(object.toJson(), equals(json));
    expect($MixedOneOf1StringExtension.fromJson(json), equals(object));
  });

  test('OneObjectOneOf', () {
    final object = OneObjectOneOf0((final b) => b..attributeOneOf = 'attributeOneOf');

    final json = {'attribute-oneOf': 'attributeOneOf'};

    expect(object.toJson(), equals(json));
    expect(OneObjectOneOf0.fromJson(json), equals(object));
    expect(object, isA<OneObjectOneOf>());
  });

  test('OneValueOneOf', () {
    const object = 'string';
    expect(object, isA<OneValueOneOf>());
  });

  test('OneOfIntDouble', () {
    Object? object = 0.5971645863260784;

    expect(object, isA<OneOfIntDouble>());

    object = 361;
    expect(object, isA<OneOfIntDouble>());
  });

  test('OneOfIntDoubleNum', () {
    Object? object = 0.6748612915546136;

    expect(object, isA<OneOfIntDoubleNum>());

    object = 769;
    expect(object, isA<OneOfIntDoubleNum>());
  });

  test('OneOfIntDoubleOther', () {
    OneOfIntDoubleOther object = (
      $num: 0.5971645863260784,
      string: null,
    );

    Object? json = 0.5971645863260784;

    expect(object.toJson(), equals(json));
    expect($NumStringExtension.fromJson(json), equals(object));

    object = (
      $num: 361,
      string: null,
    );

    json = 361;

    expect(object.toJson(), equals(json));
    expect($NumStringExtension.fromJson(json), equals(object));

    object = (
      $num: null,
      string: 'string',
    );

    json = 'string';

    expect(object.toJson(), equals(json));
    expect($NumStringExtension.fromJson(json), equals(object));
  });
}

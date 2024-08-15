// ignore_for_file: inference_failure_on_collection_literal

import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value_test/matcher.dart';
import 'package:dynamite_end_to_end_test/types.openapi.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:test/test.dart';

void main() {
  test(Base, () {
    final object = Base(
      (b) => b
        ..$bool = true
        ..integer = 350
        ..$double = 0.7617818016335848
        ..$num = 0.6538342555284606
        ..string = 'StringValue'
        ..contentString.update((b) => b..content = 98)
        ..stringBinary = utf8.encode('StringValue')
        ..list.update(
          (b) => b
            ..addAll([
              JsonObject('value'),
              JsonObject(188),
              JsonObject(0.45151780411979836),
              JsonObject(false),
            ]),
        )
        ..listNever = ListBuilder<Never>()
        ..listString.update(
          (b) => b
            ..addAll([
              'value1',
              'value2',
              'value3',
              'value4',
            ]),
        ),
    );

    final json = <String, dynamic>{
      'bool': true,
      'integer': 350,
      'double': 0.7617818016335848,
      'num': 0.6538342555284606,
      'string': 'StringValue',
      'content-string': '98',
      'string-binary': 'U3RyaW5nVmFsdWU=',
      'list': ['value', 188, 0.45151780411979836, false],
      'list-never': [],
      'list-string': ['value1', 'value2', 'value3', 'value4'],
    };
    final revived = Base.fromJson(json);

    expect(object.toJson(), equals(json));

    expect(revived.$bool, equals(object.$bool));
    expect(revived.integer, equals(object.integer));
    expect(revived.$double, equals(object.$double));
    expect(revived.$num, equals(object.$num));
    expect(revived.string, equals(object.string));
    expect(revived.contentString, equals(object.contentString));
    expect(revived.stringBinary, equals(object.stringBinary));
    expect(revived.list, equals(object.list));
    expect(revived.listNever, equals(object.listNever));
    expect(revived.listString, equals(object.listString));
  });

  test(BuiltList<Never>, () {
    final object = Base(
      (b) => b..listNever = ListBuilder<Never>(),
    );

    var json = <String, dynamic>{
      'list-never': [],
    };

    final revived = Base.fromJson(json);
    expect(object.toJson(), equals(json));
    expect(revived.listNever, equals(object.listNever));

    json = {
      'list-never': ['SomeValue'],
    };

    expect(() => Base.fromJson(json), throwsA(isA<DeserializationError>()));
  });

  test(AdditionalProperties, () {
    final object = AdditionalProperties((b) {
      b
        ..emptySchemaBool.addAll({
          'emptySchemaBool-string': JsonObject('string-value'),
          'emptySchemaBool-bool': JsonObject(true),
          'emptySchemaBool-double': JsonObject(0.738354049885935),
          'emptySchemaBool-int': JsonObject(403),
        })
        ..emptySchema.addAll({
          'emptySchema-string': JsonObject('string-value-two'),
          'emptySchema-bool': JsonObject(false),
          'emptySchema-double': JsonObject(0.7588764158428097),
          'emptySchema-int': JsonObject(26),
        })
        ..nested.addAll({
          'nested-one': BuiltMap({
            'nested-one-string': JsonObject('string-value-three'),
            'nested-one-bool': JsonObject(true),
            'nested-one-double': JsonObject(0.6951511193872036),
            'nested-one-int': JsonObject(913),
          }),
          'nested-two': BuiltMap({
            'nested-two-string': JsonObject('string-value-four'),
            'nested-two-bool': JsonObject(false),
            'nested-two-double': JsonObject(0.6732853894383894),
            'nested-two-int': JsonObject(76),
          }),
        })
        ..object.addAll({
          'object-string': JsonObject('string-value-five'),
          'object-bool': JsonObject(true),
          'object-double': JsonObject(0.9987671605167462),
          'object-int': JsonObject(498),
        })
        ..$bool.addAll({
          r'$bool-false': false,
          r'$bool-true': true,
          r'$bool-random': false,
        })
        ..integer.addAll({
          'integer-number-one': 731,
          'integer-number-two': 409,
        })
        ..$double.addAll({
          r'$double-number-one': 0.7395758005898898,
          r'$double-number-two': 0.07190921677589679,
        })
        ..$num.addAll({
          r'$num-integer': 143,
          r'$num-double': 0.49730606728770244,
        })
        ..string.addAll({
          'string-1': 'true',
          'string-2': '0.4251711007259674',
          'string-3': '719',
        })
        ..contentString.addAll({
          'contentString-1': ContentString((b) {
            b.content = 995;
          }),
          'contentString-2': ContentString((b) {
            b.content = 362;
          }),
        })
        ..stringBinary.addAll({
          'stringBinary-1': Uint8List(0),
          'stringBinary-2': utf8.encode('binary-data'),
        })
        ..list.addAll({
          'list-1': BuiltList([
            JsonObject(false),
            JsonObject(133),
          ]),
          'list-2': BuiltList([
            JsonObject(0.9626186091180242),
            JsonObject(true),
            JsonObject('some-string'),
          ]),
          'list-3': BuiltList([
            JsonObject(158),
            JsonObject(0.2378466766895665),
          ]),
          'list-empty': BuiltList([]),
        })
        ..listNever.addAll({
          'listNever-1': BuiltList([]),
        })
        ..listString.addAll({
          'listString': BuiltList(['value', 'value', 'value']),
          'listString-empty': BuiltList([]),
        });
    });

    final json = <String, dynamic>{
      'empty_schema_bool': {
        'emptySchemaBool-string': 'string-value',
        'emptySchemaBool-bool': true,
        'emptySchemaBool-double': 0.738354049885935,
        'emptySchemaBool-int': 403,
      },
      'empty_schema': {
        'emptySchema-string': 'string-value-two',
        'emptySchema-bool': false,
        'emptySchema-double': 0.7588764158428097,
        'emptySchema-int': 26,
      },
      'nested': {
        'nested-one': {
          'nested-one-string': 'string-value-three',
          'nested-one-bool': true,
          'nested-one-double': 0.6951511193872036,
          'nested-one-int': 913,
        },
        'nested-two': {
          'nested-two-string': 'string-value-four',
          'nested-two-bool': false,
          'nested-two-double': 0.6732853894383894,
          'nested-two-int': 76,
        },
      },
      'Object': {
        'object-string': 'string-value-five',
        'object-bool': true,
        'object-double': 0.9987671605167462,
        'object-int': 498,
      },
      'bool': {r'$bool-false': false, r'$bool-true': true, r'$bool-random': false},
      'integer': {'integer-number-one': 731, 'integer-number-two': 409},
      'double': {r'$double-number-one': 0.7395758005898898, r'$double-number-two': 0.07190921677589679},
      'num': {r'$num-integer': 143, r'$num-double': 0.49730606728770244},
      'string': {'string-1': 'true', 'string-2': '0.4251711007259674', 'string-3': '719'},
      'content-string': {'contentString-1': '995', 'contentString-2': '362'},
      'string-binary': {'stringBinary-1': '', 'stringBinary-2': utf8.fuse(base64).encode('binary-data')},
      'list': {
        'list-1': [false, 133],
        'list-2': [0.9626186091180242, true, 'some-string'],
        'list-3': [158, 0.2378466766895665],
        'list-empty': [],
      },
      'list-never': {'listNever-1': []},
      'list-string': {
        'listString': ['value', 'value', 'value'],
        'listString-empty': [],
      },
    };

    expect(object.toJson(), equals(json));

    final revived = AdditionalProperties.fromJson(json);
    expect(revived, equalsBuilt(object));
  });

  test(Defaults, () {
    final object = Defaults();
    const json = {
      'bool': true,
      'integer': 1,
      'double': 1.0,
      'num': 0,
      'string': 'default',
      'string-binary': '',
      'list': ['default-item', true, 1.0],
      'list-never': [],
      'list-string': ['default-item', 'item'],
      'object-map': {
        'list': ['list'],
        'string': 'default-item',
        'bool': true,
        'num': 1.0,
      },
      'object-array': ['default-item', true, 1.0],
      'object-bool': true,
      'content-string': '1',
    };

    expect(object.toJson(), equals(json));
  });
}

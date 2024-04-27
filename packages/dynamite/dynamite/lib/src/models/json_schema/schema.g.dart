// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const JsonSchemaType _$schemaTypeBoolean = JsonSchemaType._('boolean');
const JsonSchemaType _$schemaTypeInteger = JsonSchemaType._('integer');
const JsonSchemaType _$schemaTypeNumber = JsonSchemaType._('number');
const JsonSchemaType _$schemaTypeString = JsonSchemaType._('string');
const JsonSchemaType _$schemaTypeArray = JsonSchemaType._('array');
const JsonSchemaType _$schemaTypeObject = JsonSchemaType._('object');
const JsonSchemaType _$nullTypeObject = JsonSchemaType._('\$null');

JsonSchemaType _$jsonSchemaType(String name) {
  switch (name) {
    case 'boolean':
      return _$schemaTypeBoolean;
    case 'integer':
      return _$schemaTypeInteger;
    case 'number':
      return _$schemaTypeNumber;
    case 'string':
      return _$schemaTypeString;
    case 'array':
      return _$schemaTypeArray;
    case 'object':
      return _$schemaTypeObject;
    case '\$null':
      return _$nullTypeObject;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<JsonSchemaType> _$jsonSchemaTypeValues = BuiltSet<JsonSchemaType>(const <JsonSchemaType>[
  _$schemaTypeBoolean,
  _$schemaTypeInteger,
  _$schemaTypeNumber,
  _$schemaTypeString,
  _$schemaTypeArray,
  _$schemaTypeObject,
  _$nullTypeObject,
]);

Serializer<GenericSchema> _$genericSchemaSerializer = _$GenericSchemaSerializer();
Serializer<BooleanSchema> _$booleanSchemaSerializer = _$BooleanSchemaSerializer();
Serializer<IntegerSchema> _$integerSchemaSerializer = _$IntegerSchemaSerializer();
Serializer<NumberSchema> _$numberSchemaSerializer = _$NumberSchemaSerializer();
Serializer<StringSchema> _$stringSchemaSerializer = _$StringSchemaSerializer();
Serializer<ArraySchema> _$arraySchemaSerializer = _$ArraySchemaSerializer();
Serializer<ObjectSchema> _$objectSchemaSerializer = _$ObjectSchemaSerializer();
Serializer<NullSchema> _$nullSchemaSerializer = _$NullSchemaSerializer();
Serializer<JsonSchemaType> _$jsonSchemaTypeSerializer = _$JsonSchemaTypeSerializer();

class _$GenericSchemaSerializer implements StructuredSerializer<GenericSchema> {
  @override
  final Iterable<Type> types = const [GenericSchema, _$GenericSchema];
  @override
  final String wireName = 'GenericSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, GenericSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
      'uniqueItems',
      serializers.serialize(object.uniqueItems, specifiedType: const FullType(bool)),
      'required',
      serializers.serialize(object.required, specifiedType: const FullType(BuiltSet, [FullType(String)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.multipleOf;
    if (value != null) {
      result
        ..add('multipleOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.exclusiveMaximum;
    if (value != null) {
      result
        ..add('exclusiveMaximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.exclusiveMinimum;
    if (value != null) {
      result
        ..add('exclusiveMinimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.maxLength;
    if (value != null) {
      result
        ..add('maxLength')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minLength;
    if (value != null) {
      result
        ..add('minLength')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pattern;
    if (value != null) {
      result
        ..add('pattern')
        ..add(serializers.serialize(value, specifiedType: const FullType(RegExp)));
    }
    value = object.maxItems;
    if (value != null) {
      result
        ..add('maxItems')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minItems;
    if (value != null) {
      result
        ..add('minItems')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxContains;
    if (value != null) {
      result
        ..add('maxContains')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minContains;
    if (value != null) {
      result
        ..add('minContains')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxProperties;
    if (value != null) {
      result
        ..add('maxProperties')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minProperties;
    if (value != null) {
      result
        ..add('minProperties')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dependentRequired;
    if (value != null) {
      result
        ..add('dependentRequired')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Map, [
              FullType(String),
              FullType(BuiltSet, [FullType(String)])
            ])));
    }
    return result;
  }

  @override
  GenericSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GenericSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'multipleOf':
          result.multipleOf = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'exclusiveMaximum':
          result.exclusiveMaximum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'minimum':
          result.minimum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'exclusiveMinimum':
          result.exclusiveMinimum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'maxLength':
          result.maxLength = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minLength':
          result.minLength = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'pattern':
          result.pattern = serializers.deserialize(value, specifiedType: const FullType(RegExp)) as RegExp?;
          break;
        case 'maxItems':
          result.maxItems = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minItems':
          result.minItems = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'uniqueItems':
          result.uniqueItems = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'maxContains':
          result.maxContains = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minContains':
          result.minContains = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'maxProperties':
          result.maxProperties = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minProperties':
          result.minProperties = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'required':
          result.required.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSet, [FullType(String)]))! as BuiltSet<Object?>);
          break;
        case 'dependentRequired':
          result.dependentRequired = serializers.deserialize(value,
              specifiedType: const FullType(Map, [
                FullType(String),
                FullType(BuiltSet, [FullType(String)])
              ])) as Map<String, BuiltSet<String>>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BooleanSchemaSerializer implements StructuredSerializer<BooleanSchema> {
  @override
  final Iterable<Type> types = const [BooleanSchema, _$BooleanSchema];
  @override
  final String wireName = 'BooleanSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, BooleanSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    return result;
  }

  @override
  BooleanSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BooleanSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$IntegerSchemaSerializer implements StructuredSerializer<IntegerSchema> {
  @override
  final Iterable<Type> types = const [IntegerSchema, _$IntegerSchema];
  @override
  final String wireName = 'IntegerSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, IntegerSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.multipleOf;
    if (value != null) {
      result
        ..add('multipleOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.exclusiveMaximum;
    if (value != null) {
      result
        ..add('exclusiveMaximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.exclusiveMinimum;
    if (value != null) {
      result
        ..add('exclusiveMinimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    return result;
  }

  @override
  IntegerSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = IntegerSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'multipleOf':
          result.multipleOf = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'exclusiveMaximum':
          result.exclusiveMaximum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'minimum':
          result.minimum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'exclusiveMinimum':
          result.exclusiveMinimum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$NumberSchemaSerializer implements StructuredSerializer<NumberSchema> {
  @override
  final Iterable<Type> types = const [NumberSchema, _$NumberSchema];
  @override
  final String wireName = 'NumberSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, NumberSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.multipleOf;
    if (value != null) {
      result
        ..add('multipleOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.maximum;
    if (value != null) {
      result
        ..add('maximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.exclusiveMaximum;
    if (value != null) {
      result
        ..add('exclusiveMaximum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.minimum;
    if (value != null) {
      result
        ..add('minimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.exclusiveMinimum;
    if (value != null) {
      result
        ..add('exclusiveMinimum')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    return result;
  }

  @override
  NumberSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NumberSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'multipleOf':
          result.multipleOf = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'maximum':
          result.maximum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'exclusiveMaximum':
          result.exclusiveMaximum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'minimum':
          result.minimum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
        case 'exclusiveMinimum':
          result.exclusiveMinimum = serializers.deserialize(value, specifiedType: const FullType(num)) as num?;
          break;
      }
    }

    return result.build();
  }
}

class _$StringSchemaSerializer implements StructuredSerializer<StringSchema> {
  @override
  final Iterable<Type> types = const [StringSchema, _$StringSchema];
  @override
  final String wireName = 'StringSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, StringSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.contentMediaType;
    if (value != null) {
      result
        ..add('contentMediaType')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.contentSchema;
    if (value != null) {
      result
        ..add('contentSchema')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchema)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.maxLength;
    if (value != null) {
      result
        ..add('maxLength')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minLength;
    if (value != null) {
      result
        ..add('minLength')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pattern;
    if (value != null) {
      result
        ..add('pattern')
        ..add(serializers.serialize(value, specifiedType: const FullType(RegExp)));
    }
    return result;
  }

  @override
  StringSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = StringSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'contentMediaType':
          result.contentMediaType = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'contentSchema':
          result.contentSchema =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchema)) as JsonSchema?;
          break;
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'maxLength':
          result.maxLength = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minLength':
          result.minLength = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'pattern':
          result.pattern = serializers.deserialize(value, specifiedType: const FullType(RegExp)) as RegExp?;
          break;
      }
    }

    return result.build();
  }
}

class _$ArraySchemaSerializer implements StructuredSerializer<ArraySchema> {
  @override
  final Iterable<Type> types = const [ArraySchema, _$ArraySchema];
  @override
  final String wireName = 'ArraySchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, ArraySchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
      'uniqueItems',
      serializers.serialize(object.uniqueItems, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.items;
    if (value != null) {
      result
        ..add('items')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchema)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.maxItems;
    if (value != null) {
      result
        ..add('maxItems')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minItems;
    if (value != null) {
      result
        ..add('minItems')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxContains;
    if (value != null) {
      result
        ..add('maxContains')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minContains;
    if (value != null) {
      result
        ..add('minContains')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ArraySchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ArraySchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'items':
          result.items = serializers.deserialize(value, specifiedType: const FullType(JsonSchema)) as JsonSchema?;
          break;
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'maxItems':
          result.maxItems = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minItems':
          result.minItems = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'uniqueItems':
          result.uniqueItems = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'maxContains':
          result.maxContains = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minContains':
          result.minContains = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ObjectSchemaSerializer implements StructuredSerializer<ObjectSchema> {
  @override
  final Iterable<Type> types = const [ObjectSchema, _$ObjectSchema];
  @override
  final String wireName = 'ObjectSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, ObjectSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
      'required',
      serializers.serialize(object.required, specifiedType: const FullType(BuiltSet, [FullType(String)])),
    ];
    Object? value;
    value = object.properties;
    if (value != null) {
      result
        ..add('properties')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonSchema)])));
    }
    value = object.additionalProperties;
    if (value != null) {
      result
        ..add('additionalProperties')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchema)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.maxProperties;
    if (value != null) {
      result
        ..add('maxProperties')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minProperties;
    if (value != null) {
      result
        ..add('minProperties')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dependentRequired;
    if (value != null) {
      result
        ..add('dependentRequired')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Map, [
              FullType(String),
              FullType(BuiltSet, [FullType(String)])
            ])));
    }
    return result;
  }

  @override
  ObjectSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ObjectSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'properties':
          result.properties.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, [FullType(String), FullType(JsonSchema)]))!);
          break;
        case 'additionalProperties':
          result.additionalProperties =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchema)) as JsonSchema?;
          break;
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'maxProperties':
          result.maxProperties = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'minProperties':
          result.minProperties = serializers.deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'required':
          result.required.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSet, [FullType(String)]))! as BuiltSet<Object?>);
          break;
        case 'dependentRequired':
          result.dependentRequired = serializers.deserialize(value,
              specifiedType: const FullType(Map, [
                FullType(String),
                FullType(BuiltSet, [FullType(String)])
              ])) as Map<String, BuiltSet<String>>?;
          break;
      }
    }

    return result.build();
  }
}

class _$NullSchemaSerializer implements StructuredSerializer<NullSchema> {
  @override
  final Iterable<Type> types = const [NullSchema, _$NullSchema];
  @override
  final String wireName = 'NullSchema';

  @override
  Iterable<Object?> serialize(Serializers serializers, NullSchema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'nullable',
      serializers.serialize(object.nullable, specifiedType: const FullType(bool)),
      'deprecated',
      serializers.serialize(object.deprecated, specifiedType: const FullType(bool)),
      'readOnly',
      serializers.serialize(object.readOnly, specifiedType: const FullType(bool)),
      'writeOnly',
      serializers.serialize(object.writeOnly, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('\$id')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('\$ref')
        ..add(serializers.serialize(value, specifiedType: const FullType(Uri)));
    }
    value = object.oneOf;
    if (value != null) {
      result
        ..add('oneOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.anyOf;
    if (value != null) {
      result
        ..add('anyOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.allOf;
    if (value != null) {
      result
        ..add('allOf')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonSchema)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonSchemaType)));
    }
    value = object.$enum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    value = object.discriminator;
    if (value != null) {
      result
        ..add('discriminator')
        ..add(serializers.serialize(value, specifiedType: const FullType(Discriminator)));
    }
    value = object.format;
    if (value != null) {
      result
        ..add('format')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.rawDefault;
    if (value != null) {
      result
        ..add('default')
        ..add(serializers.serialize(value, specifiedType: const FullType(JsonObject)));
    }
    value = object.examples;
    if (value != null) {
      result
        ..add('examples')
        ..add(serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])));
    }
    return result;
  }

  @override
  NullSchema deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = NullSchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '\$id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case '\$ref':
          result.ref = serializers.deserialize(value, specifiedType: const FullType(Uri)) as Uri?;
          break;
        case 'oneOf':
          result.oneOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'anyOf':
          result.anyOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'allOf':
          result.allOf.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonSchema)]))! as BuiltList<Object?>);
          break;
        case 'type':
          result.type =
              serializers.deserialize(value, specifiedType: const FullType(JsonSchemaType)) as JsonSchemaType?;
          break;
        case 'enum':
          result.$enum.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
        case 'discriminator':
          result.discriminator
              .replace(serializers.deserialize(value, specifiedType: const FullType(Discriminator))! as Discriminator);
          break;
        case 'nullable':
          result.nullable = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'format':
          result.format = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'default':
          result.rawDefault = serializers.deserialize(value, specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'deprecated':
          result.deprecated = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'readOnly':
          result.readOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'writeOnly':
          result.writeOnly = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
          break;
        case 'examples':
          result.examples.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$JsonSchemaTypeSerializer implements PrimitiveSerializer<JsonSchemaType> {
  static const Map<String, Object> _toWire = <String, Object>{
    '\$null': 'null',
  };
  static const Map<Object, String> _fromWire = <Object, String>{
    'null': '\$null',
  };

  @override
  final Iterable<Type> types = const <Type>[JsonSchemaType];
  @override
  final String wireName = 'JsonSchemaType';

  @override
  Object serialize(Serializers serializers, JsonSchemaType object, {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  JsonSchemaType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      JsonSchemaType.valueOf(_fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

abstract mixin class JsonSchemaBuilder {
  void replace(JsonSchema other);
  void update(void Function(JsonSchemaBuilder) updates);
  Uri? get id;
  set id(Uri? id);

  Uri? get ref;
  set ref(Uri? ref);

  ListBuilder<JsonSchema> get oneOf;
  set oneOf(ListBuilder<JsonSchema>? oneOf);

  ListBuilder<JsonSchema> get anyOf;
  set anyOf(ListBuilder<JsonSchema>? anyOf);

  ListBuilder<JsonSchema> get allOf;
  set allOf(ListBuilder<JsonSchema>? allOf);

  JsonSchemaType? get type;
  set type(JsonSchemaType? type);

  ListBuilder<JsonObject> get $enum;
  set $enum(ListBuilder<JsonObject>? $enum);

  DiscriminatorBuilder get discriminator;
  set discriminator(DiscriminatorBuilder? discriminator);

  bool? get nullable;
  set nullable(bool? nullable);

  String? get format;
  set format(String? format);

  String? get title;
  set title(String? title);

  String? get description;
  set description(String? description);

  JsonObject? get rawDefault;
  set rawDefault(JsonObject? rawDefault);

  bool? get deprecated;
  set deprecated(bool? deprecated);

  bool? get readOnly;
  set readOnly(bool? readOnly);

  bool? get writeOnly;
  set writeOnly(bool? writeOnly);

  ListBuilder<JsonObject> get examples;
  set examples(ListBuilder<JsonObject>? examples);
}

class _$GenericSchema extends GenericSchema {
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;
  @override
  final num? multipleOf;
  @override
  final num? maximum;
  @override
  final num? exclusiveMaximum;
  @override
  final num? minimum;
  @override
  final num? exclusiveMinimum;
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  final RegExp? pattern;
  @override
  final int? maxItems;
  @override
  final int? minItems;
  @override
  final bool uniqueItems;
  @override
  final int? maxContains;
  @override
  final int? minContains;
  @override
  final int? maxProperties;
  @override
  final int? minProperties;
  @override
  final BuiltSet<String> required;
  @override
  final Map<String, BuiltSet<String>>? dependentRequired;

  factory _$GenericSchema([void Function(GenericSchemaBuilder)? updates]) =>
      (GenericSchemaBuilder()..update(updates))._build();

  _$GenericSchema._(
      {this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples,
      this.multipleOf,
      this.maximum,
      this.exclusiveMaximum,
      this.minimum,
      this.exclusiveMinimum,
      this.maxLength,
      this.minLength,
      this.pattern,
      this.maxItems,
      this.minItems,
      required this.uniqueItems,
      this.maxContains,
      this.minContains,
      this.maxProperties,
      this.minProperties,
      required this.required,
      this.dependentRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'GenericSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'GenericSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'GenericSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'GenericSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(uniqueItems, r'GenericSchema', 'uniqueItems');
    BuiltValueNullFieldError.checkNotNull(required, r'GenericSchema', 'required');
  }

  @override
  GenericSchema rebuild(void Function(GenericSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  GenericSchemaBuilder toBuilder() => GenericSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericSchema &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples &&
        multipleOf == other.multipleOf &&
        maximum == other.maximum &&
        exclusiveMaximum == other.exclusiveMaximum &&
        minimum == other.minimum &&
        exclusiveMinimum == other.exclusiveMinimum &&
        maxLength == other.maxLength &&
        minLength == other.minLength &&
        pattern == other.pattern &&
        maxItems == other.maxItems &&
        minItems == other.minItems &&
        uniqueItems == other.uniqueItems &&
        maxContains == other.maxContains &&
        minContains == other.minContains &&
        maxProperties == other.maxProperties &&
        minProperties == other.minProperties &&
        required == other.required &&
        dependentRequired == other.dependentRequired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jc(_$hash, multipleOf.hashCode);
    _$hash = $jc(_$hash, maximum.hashCode);
    _$hash = $jc(_$hash, exclusiveMaximum.hashCode);
    _$hash = $jc(_$hash, minimum.hashCode);
    _$hash = $jc(_$hash, exclusiveMinimum.hashCode);
    _$hash = $jc(_$hash, maxLength.hashCode);
    _$hash = $jc(_$hash, minLength.hashCode);
    _$hash = $jc(_$hash, pattern.hashCode);
    _$hash = $jc(_$hash, maxItems.hashCode);
    _$hash = $jc(_$hash, minItems.hashCode);
    _$hash = $jc(_$hash, uniqueItems.hashCode);
    _$hash = $jc(_$hash, maxContains.hashCode);
    _$hash = $jc(_$hash, minContains.hashCode);
    _$hash = $jc(_$hash, maxProperties.hashCode);
    _$hash = $jc(_$hash, minProperties.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, dependentRequired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenericSchema')
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples)
          ..add('multipleOf', multipleOf)
          ..add('maximum', maximum)
          ..add('exclusiveMaximum', exclusiveMaximum)
          ..add('minimum', minimum)
          ..add('exclusiveMinimum', exclusiveMinimum)
          ..add('maxLength', maxLength)
          ..add('minLength', minLength)
          ..add('pattern', pattern)
          ..add('maxItems', maxItems)
          ..add('minItems', minItems)
          ..add('uniqueItems', uniqueItems)
          ..add('maxContains', maxContains)
          ..add('minContains', minContains)
          ..add('maxProperties', maxProperties)
          ..add('minProperties', minProperties)
          ..add('required', required)
          ..add('dependentRequired', dependentRequired))
        .toString();
  }
}

class GenericSchemaBuilder implements Builder<GenericSchema, GenericSchemaBuilder>, JsonSchemaBuilder {
  _$GenericSchema? _$v;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  num? _multipleOf;
  num? get multipleOf => _$this._multipleOf;
  set multipleOf(covariant num? multipleOf) => _$this._multipleOf = multipleOf;

  num? _maximum;
  num? get maximum => _$this._maximum;
  set maximum(covariant num? maximum) => _$this._maximum = maximum;

  num? _exclusiveMaximum;
  num? get exclusiveMaximum => _$this._exclusiveMaximum;
  set exclusiveMaximum(covariant num? exclusiveMaximum) => _$this._exclusiveMaximum = exclusiveMaximum;

  num? _minimum;
  num? get minimum => _$this._minimum;
  set minimum(covariant num? minimum) => _$this._minimum = minimum;

  num? _exclusiveMinimum;
  num? get exclusiveMinimum => _$this._exclusiveMinimum;
  set exclusiveMinimum(covariant num? exclusiveMinimum) => _$this._exclusiveMinimum = exclusiveMinimum;

  int? _maxLength;
  int? get maxLength => _$this._maxLength;
  set maxLength(covariant int? maxLength) => _$this._maxLength = maxLength;

  int? _minLength;
  int? get minLength => _$this._minLength;
  set minLength(covariant int? minLength) => _$this._minLength = minLength;

  RegExp? _pattern;
  RegExp? get pattern => _$this._pattern;
  set pattern(covariant RegExp? pattern) => _$this._pattern = pattern;

  int? _maxItems;
  int? get maxItems => _$this._maxItems;
  set maxItems(covariant int? maxItems) => _$this._maxItems = maxItems;

  int? _minItems;
  int? get minItems => _$this._minItems;
  set minItems(covariant int? minItems) => _$this._minItems = minItems;

  bool? _uniqueItems;
  bool? get uniqueItems => _$this._uniqueItems;
  set uniqueItems(covariant bool? uniqueItems) => _$this._uniqueItems = uniqueItems;

  int? _maxContains;
  int? get maxContains => _$this._maxContains;
  set maxContains(covariant int? maxContains) => _$this._maxContains = maxContains;

  int? _minContains;
  int? get minContains => _$this._minContains;
  set minContains(covariant int? minContains) => _$this._minContains = minContains;

  int? _maxProperties;
  int? get maxProperties => _$this._maxProperties;
  set maxProperties(covariant int? maxProperties) => _$this._maxProperties = maxProperties;

  int? _minProperties;
  int? get minProperties => _$this._minProperties;
  set minProperties(covariant int? minProperties) => _$this._minProperties = minProperties;

  SetBuilder<String>? _required;
  SetBuilder<String> get required => _$this._required ??= SetBuilder<String>();
  set required(covariant SetBuilder<String>? required) => _$this._required = required;

  Map<String, BuiltSet<String>>? _dependentRequired;
  Map<String, BuiltSet<String>>? get dependentRequired => _$this._dependentRequired;
  set dependentRequired(covariant Map<String, BuiltSet<String>>? dependentRequired) =>
      _$this._dependentRequired = dependentRequired;

  GenericSchemaBuilder();

  GenericSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _multipleOf = $v.multipleOf;
      _maximum = $v.maximum;
      _exclusiveMaximum = $v.exclusiveMaximum;
      _minimum = $v.minimum;
      _exclusiveMinimum = $v.exclusiveMinimum;
      _maxLength = $v.maxLength;
      _minLength = $v.minLength;
      _pattern = $v.pattern;
      _maxItems = $v.maxItems;
      _minItems = $v.minItems;
      _uniqueItems = $v.uniqueItems;
      _maxContains = $v.maxContains;
      _minContains = $v.minContains;
      _maxProperties = $v.maxProperties;
      _minProperties = $v.minProperties;
      _required = $v.required.toBuilder();
      _dependentRequired = $v.dependentRequired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GenericSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericSchema;
  }

  @override
  void update(void Function(GenericSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericSchema build() => _build();

  _$GenericSchema _build() {
    GenericSchema._finalize(this);
    _$GenericSchema _$result;
    try {
      _$result = _$v ??
          _$GenericSchema._(
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'GenericSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'GenericSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'GenericSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'GenericSchema', 'writeOnly'),
              examples: _examples?.build(),
              multipleOf: multipleOf,
              maximum: maximum,
              exclusiveMaximum: exclusiveMaximum,
              minimum: minimum,
              exclusiveMinimum: exclusiveMinimum,
              maxLength: maxLength,
              minLength: minLength,
              pattern: pattern,
              maxItems: maxItems,
              minItems: minItems,
              uniqueItems: BuiltValueNullFieldError.checkNotNull(uniqueItems, r'GenericSchema', 'uniqueItems'),
              maxContains: maxContains,
              minContains: minContains,
              maxProperties: maxProperties,
              minProperties: minProperties,
              required: required.build(),
              dependentRequired: dependentRequired);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();

        _$failedField = 'required';
        required.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'GenericSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BooleanSchema extends BooleanSchema {
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;

  factory _$BooleanSchema([void Function(BooleanSchemaBuilder)? updates]) =>
      (BooleanSchemaBuilder()..update(updates))._build();

  _$BooleanSchema._(
      {this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'BooleanSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'BooleanSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'BooleanSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'BooleanSchema', 'writeOnly');
  }

  @override
  BooleanSchema rebuild(void Function(BooleanSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  BooleanSchemaBuilder toBuilder() => BooleanSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BooleanSchema &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BooleanSchema')
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples))
        .toString();
  }
}

class BooleanSchemaBuilder implements Builder<BooleanSchema, BooleanSchemaBuilder>, JsonSchemaBuilder {
  _$BooleanSchema? _$v;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  BooleanSchemaBuilder() {
    BooleanSchema._initialize(this);
  }

  BooleanSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant BooleanSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BooleanSchema;
  }

  @override
  void update(void Function(BooleanSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BooleanSchema build() => _build();

  _$BooleanSchema _build() {
    BooleanSchema._finalize(this);
    _$BooleanSchema _$result;
    try {
      _$result = _$v ??
          _$BooleanSchema._(
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'BooleanSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'BooleanSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'BooleanSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'BooleanSchema', 'writeOnly'),
              examples: _examples?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'BooleanSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$IntegerSchema extends IntegerSchema {
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;
  @override
  final num? multipleOf;
  @override
  final num? maximum;
  @override
  final num? exclusiveMaximum;
  @override
  final num? minimum;
  @override
  final num? exclusiveMinimum;

  factory _$IntegerSchema([void Function(IntegerSchemaBuilder)? updates]) =>
      (IntegerSchemaBuilder()..update(updates))._build();

  _$IntegerSchema._(
      {this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples,
      this.multipleOf,
      this.maximum,
      this.exclusiveMaximum,
      this.minimum,
      this.exclusiveMinimum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'IntegerSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'IntegerSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'IntegerSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'IntegerSchema', 'writeOnly');
  }

  @override
  IntegerSchema rebuild(void Function(IntegerSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  IntegerSchemaBuilder toBuilder() => IntegerSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntegerSchema &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples &&
        multipleOf == other.multipleOf &&
        maximum == other.maximum &&
        exclusiveMaximum == other.exclusiveMaximum &&
        minimum == other.minimum &&
        exclusiveMinimum == other.exclusiveMinimum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jc(_$hash, multipleOf.hashCode);
    _$hash = $jc(_$hash, maximum.hashCode);
    _$hash = $jc(_$hash, exclusiveMaximum.hashCode);
    _$hash = $jc(_$hash, minimum.hashCode);
    _$hash = $jc(_$hash, exclusiveMinimum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntegerSchema')
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples)
          ..add('multipleOf', multipleOf)
          ..add('maximum', maximum)
          ..add('exclusiveMaximum', exclusiveMaximum)
          ..add('minimum', minimum)
          ..add('exclusiveMinimum', exclusiveMinimum))
        .toString();
  }
}

class IntegerSchemaBuilder implements Builder<IntegerSchema, IntegerSchemaBuilder>, JsonSchemaBuilder {
  _$IntegerSchema? _$v;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  num? _multipleOf;
  num? get multipleOf => _$this._multipleOf;
  set multipleOf(covariant num? multipleOf) => _$this._multipleOf = multipleOf;

  num? _maximum;
  num? get maximum => _$this._maximum;
  set maximum(covariant num? maximum) => _$this._maximum = maximum;

  num? _exclusiveMaximum;
  num? get exclusiveMaximum => _$this._exclusiveMaximum;
  set exclusiveMaximum(covariant num? exclusiveMaximum) => _$this._exclusiveMaximum = exclusiveMaximum;

  num? _minimum;
  num? get minimum => _$this._minimum;
  set minimum(covariant num? minimum) => _$this._minimum = minimum;

  num? _exclusiveMinimum;
  num? get exclusiveMinimum => _$this._exclusiveMinimum;
  set exclusiveMinimum(covariant num? exclusiveMinimum) => _$this._exclusiveMinimum = exclusiveMinimum;

  IntegerSchemaBuilder() {
    IntegerSchema._initialize(this);
  }

  IntegerSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _multipleOf = $v.multipleOf;
      _maximum = $v.maximum;
      _exclusiveMaximum = $v.exclusiveMaximum;
      _minimum = $v.minimum;
      _exclusiveMinimum = $v.exclusiveMinimum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant IntegerSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IntegerSchema;
  }

  @override
  void update(void Function(IntegerSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntegerSchema build() => _build();

  _$IntegerSchema _build() {
    IntegerSchema._finalize(this);
    _$IntegerSchema _$result;
    try {
      _$result = _$v ??
          _$IntegerSchema._(
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'IntegerSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'IntegerSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'IntegerSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'IntegerSchema', 'writeOnly'),
              examples: _examples?.build(),
              multipleOf: multipleOf,
              maximum: maximum,
              exclusiveMaximum: exclusiveMaximum,
              minimum: minimum,
              exclusiveMinimum: exclusiveMinimum);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'IntegerSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NumberSchema extends NumberSchema {
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;
  @override
  final num? multipleOf;
  @override
  final num? maximum;
  @override
  final num? exclusiveMaximum;
  @override
  final num? minimum;
  @override
  final num? exclusiveMinimum;

  factory _$NumberSchema([void Function(NumberSchemaBuilder)? updates]) =>
      (NumberSchemaBuilder()..update(updates))._build();

  _$NumberSchema._(
      {this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples,
      this.multipleOf,
      this.maximum,
      this.exclusiveMaximum,
      this.minimum,
      this.exclusiveMinimum})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'NumberSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'NumberSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'NumberSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'NumberSchema', 'writeOnly');
  }

  @override
  NumberSchema rebuild(void Function(NumberSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NumberSchemaBuilder toBuilder() => NumberSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NumberSchema &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples &&
        multipleOf == other.multipleOf &&
        maximum == other.maximum &&
        exclusiveMaximum == other.exclusiveMaximum &&
        minimum == other.minimum &&
        exclusiveMinimum == other.exclusiveMinimum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jc(_$hash, multipleOf.hashCode);
    _$hash = $jc(_$hash, maximum.hashCode);
    _$hash = $jc(_$hash, exclusiveMaximum.hashCode);
    _$hash = $jc(_$hash, minimum.hashCode);
    _$hash = $jc(_$hash, exclusiveMinimum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NumberSchema')
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples)
          ..add('multipleOf', multipleOf)
          ..add('maximum', maximum)
          ..add('exclusiveMaximum', exclusiveMaximum)
          ..add('minimum', minimum)
          ..add('exclusiveMinimum', exclusiveMinimum))
        .toString();
  }
}

class NumberSchemaBuilder implements Builder<NumberSchema, NumberSchemaBuilder>, JsonSchemaBuilder {
  _$NumberSchema? _$v;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  num? _multipleOf;
  num? get multipleOf => _$this._multipleOf;
  set multipleOf(covariant num? multipleOf) => _$this._multipleOf = multipleOf;

  num? _maximum;
  num? get maximum => _$this._maximum;
  set maximum(covariant num? maximum) => _$this._maximum = maximum;

  num? _exclusiveMaximum;
  num? get exclusiveMaximum => _$this._exclusiveMaximum;
  set exclusiveMaximum(covariant num? exclusiveMaximum) => _$this._exclusiveMaximum = exclusiveMaximum;

  num? _minimum;
  num? get minimum => _$this._minimum;
  set minimum(covariant num? minimum) => _$this._minimum = minimum;

  num? _exclusiveMinimum;
  num? get exclusiveMinimum => _$this._exclusiveMinimum;
  set exclusiveMinimum(covariant num? exclusiveMinimum) => _$this._exclusiveMinimum = exclusiveMinimum;

  NumberSchemaBuilder() {
    NumberSchema._initialize(this);
  }

  NumberSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _multipleOf = $v.multipleOf;
      _maximum = $v.maximum;
      _exclusiveMaximum = $v.exclusiveMaximum;
      _minimum = $v.minimum;
      _exclusiveMinimum = $v.exclusiveMinimum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NumberSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NumberSchema;
  }

  @override
  void update(void Function(NumberSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NumberSchema build() => _build();

  _$NumberSchema _build() {
    NumberSchema._finalize(this);
    _$NumberSchema _$result;
    try {
      _$result = _$v ??
          _$NumberSchema._(
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'NumberSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'NumberSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'NumberSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'NumberSchema', 'writeOnly'),
              examples: _examples?.build(),
              multipleOf: multipleOf,
              maximum: maximum,
              exclusiveMaximum: exclusiveMaximum,
              minimum: minimum,
              exclusiveMinimum: exclusiveMinimum);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NumberSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StringSchema extends StringSchema {
  @override
  final String? contentMediaType;
  @override
  final JsonSchema? contentSchema;
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;
  @override
  final int? maxLength;
  @override
  final int? minLength;
  @override
  final RegExp? pattern;
  bool? __isContentString;

  factory _$StringSchema([void Function(StringSchemaBuilder)? updates]) =>
      (StringSchemaBuilder()..update(updates))._build();

  _$StringSchema._(
      {this.contentMediaType,
      this.contentSchema,
      this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples,
      this.maxLength,
      this.minLength,
      this.pattern})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'StringSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'StringSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'StringSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'StringSchema', 'writeOnly');
  }

  @override
  bool get isContentString => __isContentString ??= super.isContentString;

  @override
  StringSchema rebuild(void Function(StringSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  StringSchemaBuilder toBuilder() => StringSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StringSchema &&
        contentMediaType == other.contentMediaType &&
        contentSchema == other.contentSchema &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples &&
        maxLength == other.maxLength &&
        minLength == other.minLength &&
        pattern == other.pattern;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentMediaType.hashCode);
    _$hash = $jc(_$hash, contentSchema.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jc(_$hash, maxLength.hashCode);
    _$hash = $jc(_$hash, minLength.hashCode);
    _$hash = $jc(_$hash, pattern.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StringSchema')
          ..add('contentMediaType', contentMediaType)
          ..add('contentSchema', contentSchema)
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples)
          ..add('maxLength', maxLength)
          ..add('minLength', minLength)
          ..add('pattern', pattern))
        .toString();
  }
}

class StringSchemaBuilder implements Builder<StringSchema, StringSchemaBuilder>, JsonSchemaBuilder {
  _$StringSchema? _$v;

  String? _contentMediaType;
  String? get contentMediaType => _$this._contentMediaType;
  set contentMediaType(covariant String? contentMediaType) => _$this._contentMediaType = contentMediaType;

  JsonSchema? _contentSchema;
  JsonSchema? get contentSchema => _$this._contentSchema;
  set contentSchema(covariant JsonSchema? contentSchema) => _$this._contentSchema = contentSchema;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  int? _maxLength;
  int? get maxLength => _$this._maxLength;
  set maxLength(covariant int? maxLength) => _$this._maxLength = maxLength;

  int? _minLength;
  int? get minLength => _$this._minLength;
  set minLength(covariant int? minLength) => _$this._minLength = minLength;

  RegExp? _pattern;
  RegExp? get pattern => _$this._pattern;
  set pattern(covariant RegExp? pattern) => _$this._pattern = pattern;

  StringSchemaBuilder() {
    StringSchema._initialize(this);
  }

  StringSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentMediaType = $v.contentMediaType;
      _contentSchema = $v.contentSchema;
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _maxLength = $v.maxLength;
      _minLength = $v.minLength;
      _pattern = $v.pattern;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant StringSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StringSchema;
  }

  @override
  void update(void Function(StringSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StringSchema build() => _build();

  _$StringSchema _build() {
    StringSchema._finalize(this);
    _$StringSchema _$result;
    try {
      _$result = _$v ??
          _$StringSchema._(
              contentMediaType: contentMediaType,
              contentSchema: contentSchema,
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'StringSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'StringSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'StringSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'StringSchema', 'writeOnly'),
              examples: _examples?.build(),
              maxLength: maxLength,
              minLength: minLength,
              pattern: pattern);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'StringSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ArraySchema extends ArraySchema {
  @override
  final JsonSchema? items;
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;
  @override
  final int? maxItems;
  @override
  final int? minItems;
  @override
  final bool uniqueItems;
  @override
  final int? maxContains;
  @override
  final int? minContains;

  factory _$ArraySchema([void Function(ArraySchemaBuilder)? updates]) =>
      (ArraySchemaBuilder()..update(updates))._build();

  _$ArraySchema._(
      {this.items,
      this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples,
      this.maxItems,
      this.minItems,
      required this.uniqueItems,
      this.maxContains,
      this.minContains})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'ArraySchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'ArraySchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'ArraySchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'ArraySchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(uniqueItems, r'ArraySchema', 'uniqueItems');
  }

  @override
  ArraySchema rebuild(void Function(ArraySchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ArraySchemaBuilder toBuilder() => ArraySchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArraySchema &&
        items == other.items &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples &&
        maxItems == other.maxItems &&
        minItems == other.minItems &&
        uniqueItems == other.uniqueItems &&
        maxContains == other.maxContains &&
        minContains == other.minContains;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jc(_$hash, maxItems.hashCode);
    _$hash = $jc(_$hash, minItems.hashCode);
    _$hash = $jc(_$hash, uniqueItems.hashCode);
    _$hash = $jc(_$hash, maxContains.hashCode);
    _$hash = $jc(_$hash, minContains.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ArraySchema')
          ..add('items', items)
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples)
          ..add('maxItems', maxItems)
          ..add('minItems', minItems)
          ..add('uniqueItems', uniqueItems)
          ..add('maxContains', maxContains)
          ..add('minContains', minContains))
        .toString();
  }
}

class ArraySchemaBuilder implements Builder<ArraySchema, ArraySchemaBuilder>, JsonSchemaBuilder {
  _$ArraySchema? _$v;

  JsonSchema? _items;
  JsonSchema? get items => _$this._items;
  set items(covariant JsonSchema? items) => _$this._items = items;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  int? _maxItems;
  int? get maxItems => _$this._maxItems;
  set maxItems(covariant int? maxItems) => _$this._maxItems = maxItems;

  int? _minItems;
  int? get minItems => _$this._minItems;
  set minItems(covariant int? minItems) => _$this._minItems = minItems;

  bool? _uniqueItems;
  bool? get uniqueItems => _$this._uniqueItems;
  set uniqueItems(covariant bool? uniqueItems) => _$this._uniqueItems = uniqueItems;

  int? _maxContains;
  int? get maxContains => _$this._maxContains;
  set maxContains(covariant int? maxContains) => _$this._maxContains = maxContains;

  int? _minContains;
  int? get minContains => _$this._minContains;
  set minContains(covariant int? minContains) => _$this._minContains = minContains;

  ArraySchemaBuilder() {
    ArraySchema._initialize(this);
  }

  ArraySchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items;
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _maxItems = $v.maxItems;
      _minItems = $v.minItems;
      _uniqueItems = $v.uniqueItems;
      _maxContains = $v.maxContains;
      _minContains = $v.minContains;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ArraySchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ArraySchema;
  }

  @override
  void update(void Function(ArraySchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ArraySchema build() => _build();

  _$ArraySchema _build() {
    ArraySchema._finalize(this);
    _$ArraySchema _$result;
    try {
      _$result = _$v ??
          _$ArraySchema._(
              items: items,
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'ArraySchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'ArraySchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'ArraySchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'ArraySchema', 'writeOnly'),
              examples: _examples?.build(),
              maxItems: maxItems,
              minItems: minItems,
              uniqueItems: BuiltValueNullFieldError.checkNotNull(uniqueItems, r'ArraySchema', 'uniqueItems'),
              maxContains: maxContains,
              minContains: minContains);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ArraySchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ObjectSchema extends ObjectSchema {
  @override
  final BuiltMap<String, JsonSchema>? properties;
  @override
  final JsonSchema? additionalProperties;
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;
  @override
  final int? maxProperties;
  @override
  final int? minProperties;
  @override
  final BuiltSet<String> required;
  @override
  final Map<String, BuiltSet<String>>? dependentRequired;

  factory _$ObjectSchema([void Function(ObjectSchemaBuilder)? updates]) =>
      (ObjectSchemaBuilder()..update(updates))._build();

  _$ObjectSchema._(
      {this.properties,
      this.additionalProperties,
      this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples,
      this.maxProperties,
      this.minProperties,
      required this.required,
      this.dependentRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'ObjectSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'ObjectSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'ObjectSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'ObjectSchema', 'writeOnly');
    BuiltValueNullFieldError.checkNotNull(required, r'ObjectSchema', 'required');
  }

  @override
  ObjectSchema rebuild(void Function(ObjectSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ObjectSchemaBuilder toBuilder() => ObjectSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ObjectSchema &&
        properties == other.properties &&
        additionalProperties == other.additionalProperties &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples &&
        maxProperties == other.maxProperties &&
        minProperties == other.minProperties &&
        required == other.required &&
        dependentRequired == other.dependentRequired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, properties.hashCode);
    _$hash = $jc(_$hash, additionalProperties.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jc(_$hash, maxProperties.hashCode);
    _$hash = $jc(_$hash, minProperties.hashCode);
    _$hash = $jc(_$hash, required.hashCode);
    _$hash = $jc(_$hash, dependentRequired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ObjectSchema')
          ..add('properties', properties)
          ..add('additionalProperties', additionalProperties)
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples)
          ..add('maxProperties', maxProperties)
          ..add('minProperties', minProperties)
          ..add('required', required)
          ..add('dependentRequired', dependentRequired))
        .toString();
  }
}

class ObjectSchemaBuilder implements Builder<ObjectSchema, ObjectSchemaBuilder>, JsonSchemaBuilder {
  _$ObjectSchema? _$v;

  MapBuilder<String, JsonSchema>? _properties;
  MapBuilder<String, JsonSchema> get properties => _$this._properties ??= MapBuilder<String, JsonSchema>();
  set properties(covariant MapBuilder<String, JsonSchema>? properties) => _$this._properties = properties;

  JsonSchema? _additionalProperties;
  JsonSchema? get additionalProperties => _$this._additionalProperties;
  set additionalProperties(covariant JsonSchema? additionalProperties) =>
      _$this._additionalProperties = additionalProperties;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  int? _maxProperties;
  int? get maxProperties => _$this._maxProperties;
  set maxProperties(covariant int? maxProperties) => _$this._maxProperties = maxProperties;

  int? _minProperties;
  int? get minProperties => _$this._minProperties;
  set minProperties(covariant int? minProperties) => _$this._minProperties = minProperties;

  SetBuilder<String>? _required;
  SetBuilder<String> get required => _$this._required ??= SetBuilder<String>();
  set required(covariant SetBuilder<String>? required) => _$this._required = required;

  Map<String, BuiltSet<String>>? _dependentRequired;
  Map<String, BuiltSet<String>>? get dependentRequired => _$this._dependentRequired;
  set dependentRequired(covariant Map<String, BuiltSet<String>>? dependentRequired) =>
      _$this._dependentRequired = dependentRequired;

  ObjectSchemaBuilder() {
    ObjectSchema._initialize(this);
  }

  ObjectSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _properties = $v.properties?.toBuilder();
      _additionalProperties = $v.additionalProperties;
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _maxProperties = $v.maxProperties;
      _minProperties = $v.minProperties;
      _required = $v.required.toBuilder();
      _dependentRequired = $v.dependentRequired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ObjectSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ObjectSchema;
  }

  @override
  void update(void Function(ObjectSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ObjectSchema build() => _build();

  _$ObjectSchema _build() {
    ObjectSchema._finalize(this);
    _$ObjectSchema _$result;
    try {
      _$result = _$v ??
          _$ObjectSchema._(
              properties: _properties?.build(),
              additionalProperties: additionalProperties,
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'ObjectSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'ObjectSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'ObjectSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'ObjectSchema', 'writeOnly'),
              examples: _examples?.build(),
              maxProperties: maxProperties,
              minProperties: minProperties,
              required: required.build(),
              dependentRequired: dependentRequired);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'properties';
        _properties?.build();

        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();

        _$failedField = 'required';
        required.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ObjectSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NullSchema extends NullSchema {
  @override
  final Uri? id;
  @override
  final Uri? ref;
  @override
  final BuiltList<JsonSchema>? oneOf;
  @override
  final BuiltList<JsonSchema>? anyOf;
  @override
  final BuiltList<JsonSchema>? allOf;
  @override
  final JsonSchemaType? type;
  @override
  final BuiltList<JsonObject>? $enum;
  @override
  final Discriminator? discriminator;
  @override
  final bool nullable;
  @override
  final String? format;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final JsonObject? rawDefault;
  @override
  final bool deprecated;
  @override
  final bool readOnly;
  @override
  final bool writeOnly;
  @override
  final BuiltList<JsonObject>? examples;

  factory _$NullSchema([void Function(NullSchemaBuilder)? updates]) => (NullSchemaBuilder()..update(updates))._build();

  _$NullSchema._(
      {this.id,
      this.ref,
      this.oneOf,
      this.anyOf,
      this.allOf,
      this.type,
      this.$enum,
      this.discriminator,
      required this.nullable,
      this.format,
      this.title,
      this.description,
      this.rawDefault,
      required this.deprecated,
      required this.readOnly,
      required this.writeOnly,
      this.examples})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nullable, r'NullSchema', 'nullable');
    BuiltValueNullFieldError.checkNotNull(deprecated, r'NullSchema', 'deprecated');
    BuiltValueNullFieldError.checkNotNull(readOnly, r'NullSchema', 'readOnly');
    BuiltValueNullFieldError.checkNotNull(writeOnly, r'NullSchema', 'writeOnly');
  }

  @override
  NullSchema rebuild(void Function(NullSchemaBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  NullSchemaBuilder toBuilder() => NullSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NullSchema &&
        id == other.id &&
        ref == other.ref &&
        oneOf == other.oneOf &&
        anyOf == other.anyOf &&
        allOf == other.allOf &&
        type == other.type &&
        $enum == other.$enum &&
        discriminator == other.discriminator &&
        nullable == other.nullable &&
        format == other.format &&
        title == other.title &&
        description == other.description &&
        rawDefault == other.rawDefault &&
        deprecated == other.deprecated &&
        readOnly == other.readOnly &&
        writeOnly == other.writeOnly &&
        examples == other.examples;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ref.hashCode);
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jc(_$hash, anyOf.hashCode);
    _$hash = $jc(_$hash, allOf.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, $enum.hashCode);
    _$hash = $jc(_$hash, discriminator.hashCode);
    _$hash = $jc(_$hash, nullable.hashCode);
    _$hash = $jc(_$hash, format.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, rawDefault.hashCode);
    _$hash = $jc(_$hash, deprecated.hashCode);
    _$hash = $jc(_$hash, readOnly.hashCode);
    _$hash = $jc(_$hash, writeOnly.hashCode);
    _$hash = $jc(_$hash, examples.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NullSchema')
          ..add('id', id)
          ..add('ref', ref)
          ..add('oneOf', oneOf)
          ..add('anyOf', anyOf)
          ..add('allOf', allOf)
          ..add('type', type)
          ..add('\$enum', $enum)
          ..add('discriminator', discriminator)
          ..add('nullable', nullable)
          ..add('format', format)
          ..add('title', title)
          ..add('description', description)
          ..add('rawDefault', rawDefault)
          ..add('deprecated', deprecated)
          ..add('readOnly', readOnly)
          ..add('writeOnly', writeOnly)
          ..add('examples', examples))
        .toString();
  }
}

class NullSchemaBuilder implements Builder<NullSchema, NullSchemaBuilder>, JsonSchemaBuilder {
  _$NullSchema? _$v;

  Uri? _id;
  Uri? get id => _$this._id;
  set id(covariant Uri? id) => _$this._id = id;

  Uri? _ref;
  Uri? get ref => _$this._ref;
  set ref(covariant Uri? ref) => _$this._ref = ref;

  ListBuilder<JsonSchema>? _oneOf;
  ListBuilder<JsonSchema> get oneOf => _$this._oneOf ??= ListBuilder<JsonSchema>();
  set oneOf(covariant ListBuilder<JsonSchema>? oneOf) => _$this._oneOf = oneOf;

  ListBuilder<JsonSchema>? _anyOf;
  ListBuilder<JsonSchema> get anyOf => _$this._anyOf ??= ListBuilder<JsonSchema>();
  set anyOf(covariant ListBuilder<JsonSchema>? anyOf) => _$this._anyOf = anyOf;

  ListBuilder<JsonSchema>? _allOf;
  ListBuilder<JsonSchema> get allOf => _$this._allOf ??= ListBuilder<JsonSchema>();
  set allOf(covariant ListBuilder<JsonSchema>? allOf) => _$this._allOf = allOf;

  JsonSchemaType? _type;
  JsonSchemaType? get type => _$this._type;
  set type(covariant JsonSchemaType? type) => _$this._type = type;

  ListBuilder<JsonObject>? _$enum;
  ListBuilder<JsonObject> get $enum => _$this._$enum ??= ListBuilder<JsonObject>();
  set $enum(covariant ListBuilder<JsonObject>? $enum) => _$this._$enum = $enum;

  DiscriminatorBuilder? _discriminator;
  DiscriminatorBuilder get discriminator => _$this._discriminator ??= DiscriminatorBuilder();
  set discriminator(covariant DiscriminatorBuilder? discriminator) => _$this._discriminator = discriminator;

  bool? _nullable;
  bool? get nullable => _$this._nullable;
  set nullable(covariant bool? nullable) => _$this._nullable = nullable;

  String? _format;
  String? get format => _$this._format;
  set format(covariant String? format) => _$this._format = format;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) => _$this._description = description;

  JsonObject? _rawDefault;
  JsonObject? get rawDefault => _$this._rawDefault;
  set rawDefault(covariant JsonObject? rawDefault) => _$this._rawDefault = rawDefault;

  bool? _deprecated;
  bool? get deprecated => _$this._deprecated;
  set deprecated(covariant bool? deprecated) => _$this._deprecated = deprecated;

  bool? _readOnly;
  bool? get readOnly => _$this._readOnly;
  set readOnly(covariant bool? readOnly) => _$this._readOnly = readOnly;

  bool? _writeOnly;
  bool? get writeOnly => _$this._writeOnly;
  set writeOnly(covariant bool? writeOnly) => _$this._writeOnly = writeOnly;

  ListBuilder<JsonObject>? _examples;
  ListBuilder<JsonObject> get examples => _$this._examples ??= ListBuilder<JsonObject>();
  set examples(covariant ListBuilder<JsonObject>? examples) => _$this._examples = examples;

  NullSchemaBuilder() {
    NullSchema._initialize(this);
  }

  NullSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ref = $v.ref;
      _oneOf = $v.oneOf?.toBuilder();
      _anyOf = $v.anyOf?.toBuilder();
      _allOf = $v.allOf?.toBuilder();
      _type = $v.type;
      _$enum = $v.$enum?.toBuilder();
      _discriminator = $v.discriminator?.toBuilder();
      _nullable = $v.nullable;
      _format = $v.format;
      _title = $v.title;
      _description = $v.description;
      _rawDefault = $v.rawDefault;
      _deprecated = $v.deprecated;
      _readOnly = $v.readOnly;
      _writeOnly = $v.writeOnly;
      _examples = $v.examples?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant NullSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NullSchema;
  }

  @override
  void update(void Function(NullSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NullSchema build() => _build();

  _$NullSchema _build() {
    NullSchema._finalize(this);
    _$NullSchema _$result;
    try {
      _$result = _$v ??
          _$NullSchema._(
              id: id,
              ref: ref,
              oneOf: _oneOf?.build(),
              anyOf: _anyOf?.build(),
              allOf: _allOf?.build(),
              type: type,
              $enum: _$enum?.build(),
              discriminator: _discriminator?.build(),
              nullable: BuiltValueNullFieldError.checkNotNull(nullable, r'NullSchema', 'nullable'),
              format: format,
              title: title,
              description: description,
              rawDefault: rawDefault,
              deprecated: BuiltValueNullFieldError.checkNotNull(deprecated, r'NullSchema', 'deprecated'),
              readOnly: BuiltValueNullFieldError.checkNotNull(readOnly, r'NullSchema', 'readOnly'),
              writeOnly: BuiltValueNullFieldError.checkNotNull(writeOnly, r'NullSchema', 'writeOnly'),
              examples: _examples?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'oneOf';
        _oneOf?.build();
        _$failedField = 'anyOf';
        _anyOf?.build();
        _$failedField = 'allOf';
        _allOf?.build();

        _$failedField = '\$enum';
        _$enum?.build();
        _$failedField = 'discriminator';
        _discriminator?.build();

        _$failedField = 'examples';
        _examples?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'NullSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

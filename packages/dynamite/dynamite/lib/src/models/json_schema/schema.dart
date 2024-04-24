import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/logger.dart';
import 'package:dynamite/src/models/exceptions.dart';
import 'package:dynamite/src/models/json_schema/annotations.dart';
import 'package:dynamite/src/models/json_schema/validators.dart';
import 'package:dynamite/src/models/openapi.dart';
import 'package:rfc_6901/rfc_6901.dart';

part 'schema.g.dart';

@BuiltValue(instantiable: false)
abstract interface class JsonSchema with Validator, JsonSchemaAnnotations {
  @BuiltValueField(wireName: r'$id')
  Uri? get id;

  @BuiltValueField(wireName: r'$ref')
  Uri? get ref;

  BuiltList<JsonSchema>? get oneOf;

  BuiltList<JsonSchema>? get anyOf;

  BuiltList<JsonSchema>? get allOf;

  /// https://json-schema.org/understanding-json-schema/reference/type
  JsonSchemaType? get type;

  @BuiltValueField(wireName: 'enum')
  BuiltList<JsonObject>? get $enum;

  Discriminator? get discriminator;

  bool get nullable;

  JsonSchema rebuild(void Function(JsonSchemaBuilder) updates);
  JsonSchemaBuilder toBuilder();

  static Serializer<JsonSchema> get serializer => _JsonSchemaSerializer();

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(JsonSchemaBuilder b) {
    b
      ..deprecated ??= false
      ..nullable ??= false
      ..readOnly ??= false
      ..writeOnly ??= false;

    if (b.rawDefault != null && b.examples.isEmpty) {
      b.examples.add(b.rawDefault!);
    }
  }
}

extension SchemaExtension on JsonSchema {
  JsonSchema resolveRef(Map<String, dynamic> json) {
    if (ref == null) {
      throw StateError(r'Referenced schema can only be resolved when a $ref is present');
    }

    final rootID = json[r'$id'] as String?;

    final Uri uri;
    if (rootID != null) {
      uri = Uri.parse(rootID).resolveUri(ref!);
    } else {
      uri = ref!;
    }

    // Only relative references are supported.
    final value = JsonPointer(uri.fragment).read(json);
    var schema = serializers.deserializeWith(JsonSchema.serializer, value)!;
    if (schema.id == null) {
      schema = schema.rebuild((b) {
        b.id = uri;
      });
    }

    return schema;
  }
}

abstract class GenericSchema
    with Validator, NumberValidator, StringValidator, ArrayValidator, ObjectValidator, JsonSchemaAnnotations
    implements JsonSchema, Built<GenericSchema, GenericSchemaBuilder> {
  factory GenericSchema([void Function(GenericSchemaBuilder) updates]) = _$GenericSchema;
  const GenericSchema._();

  static Serializer<GenericSchema> get serializer => _$genericSchemaSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(GenericSchemaBuilder b) {
    if (b.type != null) {
      throw StateError('Schema type does not match the SchemaType');
    }

    b.uniqueItems ??= false;

    JsonSchema._defaults(b);
  }
}

abstract class BooleanSchema
    with JsonSchemaAnnotations
    implements JsonSchema, Built<BooleanSchema, BooleanSchemaBuilder> {
  factory BooleanSchema([void Function(BooleanSchemaBuilder) updates]) = _$BooleanSchema;
  const BooleanSchema._();

  static Serializer<BooleanSchema> get serializer => _$booleanSchemaSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(BooleanSchemaBuilder b) {
    b.type = JsonSchemaType.boolean;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(BooleanSchemaBuilder b) {
    if (b.type != JsonSchemaType.boolean) {
      throw StateError('Schema type does not match the SchemaType');
    }

    JsonSchema._defaults(b);
  }
}

abstract class IntegerSchema
    with NumberValidator, JsonSchemaAnnotations
    implements JsonSchema, Built<IntegerSchema, IntegerSchemaBuilder> {
  factory IntegerSchema([void Function(IntegerSchemaBuilder) updates]) = _$IntegerSchema;
  IntegerSchema._();

  static Serializer<IntegerSchema> get serializer => _$integerSchemaSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(IntegerSchemaBuilder b) {
    b.type = JsonSchemaType.integer;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(IntegerSchemaBuilder b) {
    if (b.type != JsonSchemaType.integer) {
      throw StateError('Schema type does not match the SchemaType');
    }

    JsonSchema._defaults(b);

    const allowedIntegerFormats = [null, 'int32', 'int64'];
    if (!allowedIntegerFormats.contains(b.format)) {
      throw OpenAPISpecError('Format "${b.format}" is not allowed for integer. Use one of $allowedIntegerFormats.');
    } else if (b.format != null) {
      dynamiteLog.integerPrecision();
    }
  }
}

abstract class NumberSchema
    with NumberValidator, JsonSchemaAnnotations
    implements JsonSchema, Built<NumberSchema, NumberSchemaBuilder> {
  factory NumberSchema([void Function(NumberSchemaBuilder) updates]) = _$NumberSchema;
  const NumberSchema._();

  static Serializer<NumberSchema> get serializer => _$numberSchemaSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(NumberSchemaBuilder b) {
    b.type = JsonSchemaType.number;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(NumberSchemaBuilder b) {
    if (b.type != JsonSchemaType.number) {
      throw StateError('Schema type does not match the SchemaType');
    }

    JsonSchema._defaults(b);

    const allowedNumberFormats = [null, 'float', 'double'];
    if (!allowedNumberFormats.contains(b.format)) {
      throw OpenAPISpecError('Format "${b.format}" is not allowed for number. Use one of $allowedNumberFormats.');
    }
  }
}

abstract class StringSchema
    with StringValidator, JsonSchemaAnnotations
    implements JsonSchema, Built<StringSchema, StringSchemaBuilder> {
  factory StringSchema([void Function(StringSchemaBuilder) updates]) = _$StringSchema;
  const StringSchema._();

  static Serializer<StringSchema> get serializer => _$stringSchemaSerializer;

  String? get contentMediaType;

  JsonSchema? get contentSchema;

  @memoized
  bool get isContentString => type == JsonSchemaType.string && contentMediaType != null && contentSchema != null;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(StringSchemaBuilder b) {
    b.type = JsonSchemaType.string;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(StringSchemaBuilder b) {
    if (b.type != JsonSchemaType.string) {
      throw StateError('Schema type does not match the SchemaType');
    }

    JsonSchema._defaults(b);
  }
}

abstract class ArraySchema
    with ArrayValidator, JsonSchemaAnnotations
    implements JsonSchema, Built<ArraySchema, ArraySchemaBuilder> {
  factory ArraySchema([void Function(ArraySchemaBuilder) updates]) = _$ArraySchema;
  const ArraySchema._();

  static Serializer<ArraySchema> get serializer => _$arraySchemaSerializer;

  JsonSchema? get items;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(ArraySchemaBuilder b) {
    b.type = JsonSchemaType.array;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ArraySchemaBuilder b) {
    if (b.type != JsonSchemaType.array) {
      throw StateError('Schema type does not match the SchemaType');
    }

    b.uniqueItems ??= false;

    JsonSchema._defaults(b);
  }
}

abstract class ObjectSchema
    with ObjectValidator, JsonSchemaAnnotations
    implements JsonSchema, Built<ObjectSchema, ObjectSchemaBuilder> {
  factory ObjectSchema([void Function(ObjectSchemaBuilder) updates]) = _$ObjectSchema;
  const ObjectSchema._();

  static Serializer<ObjectSchema> get serializer => _$objectSchemaSerializer;

  BuiltMap<String, JsonSchema>? get properties;

  JsonSchema? get additionalProperties;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(ObjectSchemaBuilder b) {
    b.type = JsonSchemaType.object;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(ObjectSchemaBuilder b) {
    if (b.type != JsonSchemaType.object) {
      throw StateError('Schema type does not match the SchemaType');
    }

    JsonSchema._defaults(b);
  }
}

abstract class NullSchema with JsonSchemaAnnotations implements JsonSchema, Built<NullSchema, NullSchemaBuilder> {
  factory NullSchema([void Function(NullSchemaBuilder) updates]) = _$NullSchema;
  const NullSchema._();

  static Serializer<NullSchema> get serializer => _$nullSchemaSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _initialize(NullSchemaBuilder b) {
    b.type = JsonSchemaType.$null;
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _finalize(NullSchemaBuilder b) {
    if (b.type != JsonSchemaType.$null) {
      throw StateError('Schema type does not match the SchemaType');
    }

    JsonSchema._defaults(b);
  }
}

class JsonSchemaType extends EnumClass {
  const JsonSchemaType._(super.name);

  static const JsonSchemaType boolean = _$schemaTypeBoolean;
  static const JsonSchemaType integer = _$schemaTypeInteger;
  static const JsonSchemaType number = _$schemaTypeNumber;
  static const JsonSchemaType string = _$schemaTypeString;
  static const JsonSchemaType array = _$schemaTypeArray;
  static const JsonSchemaType object = _$schemaTypeObject;
  @BuiltValueEnumConst(wireName: 'null')
  static const JsonSchemaType $null = _$nullTypeObject;

  static BuiltSet<JsonSchemaType> get values => _$jsonSchemaTypeValues;

  static JsonSchemaType valueOf(String name) => _$jsonSchemaType(name);

  static Serializer<JsonSchemaType> get serializer => _$jsonSchemaTypeSerializer;
}

/// A Schema value can be either a json boolean or object.
///
/// https://json-schema.org/understanding-json-schema/basics
class SchemaPlugin implements SerializerPlugin {
  const SchemaPlugin();

  @override
  Object? afterDeserialize(Object? object, FullType specifiedType) => object;

  @override
  Object? afterSerialize(Object? object, FullType specifiedType) => object;

  @override
  Object? beforeDeserialize(Object? object, FullType specifiedType) {
    if (specifiedType.root != JsonSchema) {
      return object;
    }

    switch (object) {
      case null:
        return null;

      case bool _:
        if (object) {
          // An empty list in BuiltValue it equivalent to the empty json object.
          return [];
        } else {
          throw UnsupportedError('The never matching schema is not yet supported.');
        }

      default:
        return object;
    }
  }

  @override
  Object? beforeSerialize(Object? object, FullType specifiedType) => object;
}

class _JsonSchemaSerializer extends StructuredSerializer<JsonSchema> {
  _JsonSchemaSerializer();

  @override
  final Iterable<Type> types = const [JsonSchema];

  @override
  final String wireName = 'JsonSchema';

  static final _schemaTypeToType = {
    null: GenericSchema.serializer,
    JsonSchemaType.boolean: BooleanSchema.serializer,
    JsonSchemaType.integer: IntegerSchema.serializer,
    JsonSchemaType.number: NumberSchema.serializer,
    JsonSchemaType.string: StringSchema.serializer,
    JsonSchemaType.array: ArraySchema.serializer,
    JsonSchemaType.object: ObjectSchema.serializer,
    JsonSchemaType.$null: NullSchema.serializer,
  };

  @override
  JsonSchema deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      if (key == 'type') {
        break;
      }
    }

    final value = iterator.current;
    final type = serializers.deserializeWith(
      JsonSchemaType.serializer,
      value,
    );

    return serializers.deserializeWith(
      _schemaTypeToType[type]!,
      serialized,
    )!;
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    JsonSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serializeWith(
      _schemaTypeToType[object.type]!,
      object,
    )! as Iterable<Object?>;
  }
}

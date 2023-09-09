import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/discriminator.dart';

part 'schema.g.dart';

abstract class Schema implements Built<Schema, SchemaBuilder> {
  factory Schema([final void Function(SchemaBuilder) updates]) = _$Schema;

  const Schema._();

  static Serializer<Schema> get serializer => _$schemaSerializer;

  @BuiltValueField(wireName: r'$ref')
  String? get ref;

  BuiltList<Schema>? get oneOf;

  BuiltList<Schema>? get anyOf;

  BuiltList<Schema>? get allOf;

  BuiltList<Schema>? get ofs => oneOf ?? anyOf ?? allOf;

  @BuiltValueField(compare: false)
  String? get description;

  bool? get deprecated;

  String? get type;

  String? get format;

  @BuiltValueField(wireName: 'default')
  JsonObject? get $default;

  @BuiltValueField(wireName: 'enum')
  BuiltList<String>? get $enum;

  BuiltMap<String, Schema>? get properties;

  BuiltList<String>? get required;

  Schema? get items;

  Schema? get additionalProperties;

  String? get contentMediaType;

  Schema? get contentSchema;

  Discriminator? get discriminator;

  String? get pattern;

  int? get minLength;

  int? get maxLength;

  bool? get nullable;

  bool get isContentString => type == 'string' && (contentMediaType?.isNotEmpty ?? false) && contentSchema != null;

  Iterable<String> get formattedDescription => descriptionToDocs(description);
}

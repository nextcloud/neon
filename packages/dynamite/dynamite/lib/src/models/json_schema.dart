import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite/src/models/json_schema.dart';
import 'package:dynamite/src/models/openapi/discriminator.dart' show Discriminator;

export 'json_schema/schema.dart';

part 'json_schema.g.dart';

@SerializersFor([
  JsonSchema,
  JsonSchemaType,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
        MapBuilder<String, BuiltList<String>>.new,
      )
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const SchemaPlugin()))
    .build();

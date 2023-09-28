import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/models/openapi/components.dart';
import 'package:dynamite/src/models/openapi/info.dart';
import 'package:dynamite/src/models/openapi/path_item.dart';
import 'package:dynamite/src/models/openapi/server.dart';
import 'package:dynamite/src/models/openapi/tag.dart';

part 'open_api.g.dart';

abstract class OpenAPI implements Built<OpenAPI, OpenAPIBuilder> {
  factory OpenAPI([final void Function(OpenAPIBuilder) updates]) = _$OpenAPI;

  const OpenAPI._();

  static Serializer<OpenAPI> get serializer => _$openAPISerializer;

  @BuiltValueField(wireName: 'openapi')
  String get version;

  Info get info;

  BuiltList<Server>? get servers;

  BuiltList<BuiltMap<String, BuiltList<String>>>? get security;

  BuiltList<Tag>? get tags;

  Components? get components;

  BuiltMap<String, PathItem>? get paths;

  bool get hasAnySecurity => components?.securitySchemes?.isNotEmpty ?? false;

  Iterable<String> formattedTagsFor(final String? tag) sync* {
    final matchedTags = tags?.where((final t) => t.name == tag);

    if (matchedTags != null && matchedTags.isNotEmpty) {
      yield* matchedTags.single.formattedDescription;
    }
  }
}

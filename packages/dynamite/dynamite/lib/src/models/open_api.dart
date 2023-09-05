import 'package:collection/collection.dart';
import 'package:dynamite/src/models/components.dart';
import 'package:dynamite/src/models/info.dart';
import 'package:dynamite/src/models/path_item.dart';
import 'package:dynamite/src/models/server.dart';
import 'package:dynamite/src/models/tag.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'open_api.g.dart';

@JsonSerializable()
@immutable
class OpenAPI {
  const OpenAPI({
    required this.version,
    required this.info,
    this.servers,
    this.security,
    this.tags,
    this.components,
    this.paths,
  });

  factory OpenAPI.fromJson(final Map<String, dynamic> json) => _$OpenAPIFromJson(json);
  Map<String, dynamic> toJson() => _$OpenAPIToJson(this);

  @JsonKey(name: 'openapi')
  final String version;

  final Info info;

  final List<Server>? servers;

  final List<Map<String, List<String>>>? security;

  final List<Tag>? tags;

  final Components? components;

  final Map<String, PathItem>? paths;

  bool get hasAnySecurity => components?.securitySchemes?.isNotEmpty ?? false;

  Iterable<String> formattedTagsFor(final String? tag) sync* {
    final matchedTags = tags?.where((final t) => t.name == tag);

    if (matchedTags != null && matchedTags.isNotEmpty) {
      yield* matchedTags.single.formattedDescription;
    }
  }

  @override
  bool operator ==(final Object other) =>
      other is OpenAPI &&
      info == other.info &&
      const ListEquality().equals(servers, other.servers) &&
      const DeepCollectionEquality().equals(security, other.security) &&
      const ListEquality().equals(tags, other.tags) &&
      components == other.components &&
      const MapEquality().equals(paths, other.paths);

  @override
  int get hashCode =>
      info.hashCode +
      const ListEquality().hash(servers) +
      const DeepCollectionEquality().hash(security) +
      const ListEquality().hash(tags) +
      components.hashCode +
      const MapEquality().hash(paths);
}

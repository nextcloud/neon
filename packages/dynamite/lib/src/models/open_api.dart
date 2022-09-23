import 'package:dynamite/src/models/components.dart';
import 'package:dynamite/src/models/info.dart';
import 'package:dynamite/src/models/path_item.dart';
import 'package:dynamite/src/models/paths.dart';
import 'package:dynamite/src/models/security_requirement.dart';
import 'package:dynamite/src/models/server.dart';
import 'package:dynamite/src/models/tag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_api.g.dart';

@JsonSerializable()
class OpenAPI {
  OpenAPI({
    required this.version,
    required this.info,
    required this.servers,
    required this.security,
    required this.tags,
    required this.components,
    required this.paths,
  });

  factory OpenAPI.fromJson(final Map<String, dynamic> json) => _$OpenAPIFromJson(json);
  Map<String, dynamic> toJson() => _$OpenAPIToJson(this);

  @JsonKey(name: 'openapi')
  final String version;

  final Info info;

  final List<Server>? servers;

  final List<SecurityRequirement>? security;

  final List<Tag>? tags;

  final Components? components;

  final Paths? paths;
}

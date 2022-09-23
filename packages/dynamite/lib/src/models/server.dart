import 'package:dynamite/src/models/server_variable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart';

@JsonSerializable()
class Server {
  Server({
    required this.url,
    required this.variables,
  });

  factory Server.fromJson(final Map<String, dynamic> json) => _$ServerFromJson(json);
  Map<String, dynamic> toJson() => _$ServerToJson(this);

  final String url;

  final Map<String, ServerVariable>? variables;
}

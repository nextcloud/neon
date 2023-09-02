import 'package:dynamite/src/models/server_variable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'server.g.dart';

@JsonSerializable()
@immutable
class Server {
  const Server({
    required this.url,
    this.variables,
  });

  factory Server.fromJson(final Map<String, dynamic> json) => _$ServerFromJson(json);
  Map<String, dynamic> toJson() => _$ServerToJson(this);

  final String url;

  final Map<String, ServerVariable>? variables;
}

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'server_variable.g.dart';

@JsonSerializable()
@immutable
class ServerVariable {
  const ServerVariable({
    required this.default_,
    this.enum_,
    this.description,
  });

  factory ServerVariable.fromJson(final Map<String, dynamic> json) => _$ServerVariableFromJson(json);
  Map<String, dynamic> toJson() => _$ServerVariableToJson(this);

  @JsonKey(name: 'default')
  final String default_;

  @JsonKey(name: 'enum')
  final List<String>? enum_;

  final String? description;
}

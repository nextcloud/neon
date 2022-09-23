import 'package:json_annotation/json_annotation.dart';

part 'server_variable.g.dart';

@JsonSerializable()
class ServerVariable {
  ServerVariable({
    required this.default_,
    required this.enum_,
    required this.description,
  });

  factory ServerVariable.fromJson(final Map<String, dynamic> json) => _$ServerVariableFromJson(json);
  Map<String, dynamic> toJson() => _$ServerVariableToJson(this);

  @JsonKey(name: 'default')
  final String default_;

  @JsonKey(name: 'enum')
  final List<String>? enum_;

  final String? description;
}

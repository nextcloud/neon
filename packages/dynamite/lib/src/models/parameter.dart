import 'package:dynamite/src/models/schema.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parameter.g.dart';

@JsonSerializable()
class Parameter {
  Parameter({
    required this.name,
    required this.in_,
    required this.description,
    required this.required,
    required this.schema,
  });

  factory Parameter.fromJson(final Map<String, dynamic> json) => _$ParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterToJson(this);

  final String name;

  @JsonKey(name: 'in')
  final String in_;

  final String? description;

  final bool? required;

  final Schema? schema;
}

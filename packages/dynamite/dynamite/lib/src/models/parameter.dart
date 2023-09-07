import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'parameter.g.dart';

@JsonSerializable()
@immutable
class Parameter {
  const Parameter({
    required this.name,
    required this.in_,
    this.description,
    this.required,
    this.schema,
  });

  factory Parameter.fromJson(final Map<String, dynamic> json) => _$ParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterToJson(this);

  final String name;

  @JsonKey(name: 'in')
  final String in_;

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  final bool? required;

  final Schema? schema;

  bool get isDartRequired => isRequired(required, schema?.default_);

  @override
  bool operator ==(final Object other) =>
      other is Parameter &&
      name == other.name &&
      in_ == other.in_ &&
      required == other.required &&
      schema == other.schema;

  @override
  int get hashCode => name.hashCode + in_.hashCode + required.hashCode + schema.hashCode;
}

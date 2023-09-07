import 'package:collection/collection.dart';
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

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  @override
  bool operator ==(final Object other) =>
      other is ServerVariable && default_ == other.default_ && const ListEquality().equals(enum_, other.enum_);

  @override
  int get hashCode => default_.hashCode + const ListEquality().hash(enum_);
}

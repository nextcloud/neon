import 'package:dynamite/src/models/schema.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'header.g.dart';

@JsonSerializable()
@immutable
class Header {
  const Header({
    this.description,
    this.required,
    this.schema,
  });

  factory Header.fromJson(final Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  final bool? required;

  final Schema? schema;

  @override
  bool operator ==(final Object other) => other is Header && required == other.required && schema == other.schema;

  @override
  int get hashCode => Object.hashAll([required, schema]);
}

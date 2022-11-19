import 'package:dynamite/src/models/schema.dart';
import 'package:json_annotation/json_annotation.dart';

part 'header.g.dart';

@JsonSerializable()
class Header {
  Header({
    this.description,
    this.required,
    this.schema,
  });

  factory Header.fromJson(final Map<String, dynamic> json) => _$HeaderFromJson(json);
  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  final String? description;

  final bool? required;

  final Schema? schema;
}

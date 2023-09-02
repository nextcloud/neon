import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'security_scheme.g.dart';

@JsonSerializable()
@immutable
class SecurityScheme {
  const SecurityScheme({
    required this.type,
    this.description,
    this.scheme,
  });

  factory SecurityScheme.fromJson(final Map<String, dynamic> json) => _$SecuritySchemeFromJson(json);
  Map<String, dynamic> toJson() => _$SecuritySchemeToJson(this);

  final String type;
  final String? description;
  final String? scheme;
}

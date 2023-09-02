import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'license.g.dart';

@JsonSerializable()
@immutable
class License {
  const License({
    required this.name,
    this.identifier,
    this.url,
  });

  factory License.fromJson(final Map<String, dynamic> json) => _$LicenseFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  final String name;

  final String? identifier;

  final String? url;
}

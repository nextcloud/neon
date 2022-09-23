import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable()
class License {
  License({
    required this.name,
    required this.identifier,
    required this.url,
  });

  factory License.fromJson(final Map<String, dynamic> json) => _$LicenseFromJson(json);
  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  final String name;

  final String? identifier;

  final String? url;
}

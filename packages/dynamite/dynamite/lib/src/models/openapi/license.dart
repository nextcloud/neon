import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'license.g.dart';

abstract class License implements Built<License, LicenseBuilder> {
  factory License([final void Function(LicenseBuilder) updates]) = _$License;

  const License._();

  static Serializer<License> get serializer => _$licenseSerializer;

  String get name;

  String? get identifier;

  String? get url;
}

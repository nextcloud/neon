import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

part 'serializers.g.dart';

/// The serializer for the api response models.
@SerializersFor([
  CreateAppPasswordResponse,
  GetPresetsResponse,
  Preset,
  SetupResponse,
  ValidateFixtureResponse,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(const _VersionSerializer()))
    .build();

final class _VersionSerializer implements PrimitiveSerializer<Version> {
  const _VersionSerializer();

  @override
  Iterable<Type> get types => const [Version];
  @override
  String get wireName => 'Version';

  @override
  Object serialize(
    Serializers serializers,
    Version version, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return version.toString();
  }

  @override
  Version deserialize(
    Serializers serializers,
    Object? serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return Version.parse(serialized! as String);
  }
}

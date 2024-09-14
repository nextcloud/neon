import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

part 'preset.g.dart';

/// {@template preset}
/// A test preset containing the app name and version.
/// {@endtemplate}
abstract class Preset implements Built<Preset, PresetBuilder> {
  /// {@macro preset}
  factory Preset([void Function(PresetBuilder) updates]) = _$Preset;
  Preset._();

  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Preset.serializer, this)! as Map<String, dynamic>;
  }

  /// Converts a `Map<String, dynamic>` into a [Preset] instance.
  static Preset fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Preset.serializer, json)!;
  }

  /// The serializer that serializes this value.
  static Serializer<Preset> get serializer => _$presetSerializer;

  /// The name of the container.
  String get groupName;

  /// The name of the app.
  String get appName;

  /// The app version.
  Version get version;

  /// The platform executing the test.
  String? get platform;

  /// The tag of the docker image.
  @memoized
  String get imageTag {
    return '$groupName-${version.major}.${version.minor}';
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'config.g.dart';

/// The configuration used by the dynamite builder.
abstract class DynamiteConfig implements Built<DynamiteConfig, DynamiteConfigBuilder> {
  factory DynamiteConfig([final void Function(DynamiteConfigBuilder) updates]) = _$DynamiteConfig;

  const DynamiteConfig._();

  /// Constructs the dynamite config from a json like map.
  factory DynamiteConfig.fromJson(final Map<String, dynamic> json) => _serializers.deserializeWith(serializer, json)!;

  /// Serializes this configuration to json.
  Map<String, dynamic> toJson() => _serializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<DynamiteConfig> get serializer => _$dynamiteConfigSerializer;

  static const String configPath = 'dynamite.yaml';

  /// A set of lint rules to ignore for the entire generated file.
  @BuiltValueField(wireName: 'analyzer_ignores')
  BuiltSet<String>? get analyzerIgnores;

  /// A set of regular expressions used to exclude parts from code coverage.
  ///
  /// All matches will be wrapped in `// coverage:ignore-start` and `// coverage:ignore-end` blocks.
  @BuiltValueField(wireName: 'coverage_ignores')
  BuiltSet<String>? get coverageIgnores;
}

@SerializersFor([
  DynamiteConfig,
])
final Serializers _serializers = (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

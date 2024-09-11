import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

part 'get_presets_response.g.dart';

/// {@template get_presets_response}
/// Response with the requested test presets.
/// {@endtemplate}
abstract class GetPresetsResponse implements Built<GetPresetsResponse, GetPresetsResponseBuilder> {
  /// {@macro get_presets_response}
  factory GetPresetsResponse([void Function(GetPresetsResponseBuilder) updates]) = _$GetPresetsResponse;
  GetPresetsResponse._();

  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(GetPresetsResponse.serializer, this)! as Map<String, dynamic>;
  }

  /// Converts a `Map<String, dynamic>` into a [GetPresetsResponse] instance.
  static GetPresetsResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(GetPresetsResponse.serializer, json)!;
  }

  /// The serializer that serializes this value.
  static Serializer<GetPresetsResponse> get serializer => _$getPresetsResponseSerializer;

  /// The list of versions for the requested app.
  BuiltSet<Version> get presets;
}

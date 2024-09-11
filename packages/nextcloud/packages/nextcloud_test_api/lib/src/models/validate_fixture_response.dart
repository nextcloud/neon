import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

part 'validate_fixture_response.g.dart';

/// {@template validate_fixture_response}
/// The response with the retrieved fixture content.
/// {@endtemplate}
abstract class ValidateFixtureResponse implements Built<ValidateFixtureResponse, ValidateFixtureResponseBuilder> {
  /// {@macro validate_fixture_response}
  factory ValidateFixtureResponse([void Function(ValidateFixtureResponseBuilder) updates]) = _$ValidateFixtureResponse;
  ValidateFixtureResponse._();

  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ValidateFixtureResponse.serializer, this)! as Map<String, dynamic>;
  }

  /// Converts a `Map<String, dynamic>` into a [ValidateFixtureResponse] instance.
  static ValidateFixtureResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ValidateFixtureResponse.serializer, json)!;
  }

  /// The serializer that serializes this value.
  static Serializer<ValidateFixtureResponse> get serializer => _$validateFixtureResponseSerializer;

  /// The fixture content.
  String? get fixture;
}

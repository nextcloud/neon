import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

part 'create_app_password_response.g.dart';

/// {@template create_app_password_response}
/// The response when a app password has been created successfully.
/// {@endtemplate}
abstract class CreateAppPasswordResponse implements Built<CreateAppPasswordResponse, CreateAppPasswordResponseBuilder> {
  /// {@macro create_app_password_response}
  factory CreateAppPasswordResponse([void Function(CreateAppPasswordResponseBuilder) updates]) =
      _$CreateAppPasswordResponse;
  CreateAppPasswordResponse._();

  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CreateAppPasswordResponse.serializer, this)! as Map<String, dynamic>;
  }

  /// Converts a `Map<String, dynamic>` into a [CreateAppPasswordResponse] instance.
  static CreateAppPasswordResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CreateAppPasswordResponse.serializer, json)!;
  }

  /// The serializer that serializes this value.
  static Serializer<CreateAppPasswordResponse> get serializer => _$createAppPasswordResponseSerializer;

  /// The created app password.
  String get appPassword;
}

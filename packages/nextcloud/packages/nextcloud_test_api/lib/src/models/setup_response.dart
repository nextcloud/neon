import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

part 'setup_response.g.dart';

/// {@template setup_response}
/// The response when a preset has been set up successfully.
///
/// Contains the test target information like [hostURL] and [targetURL].
/// {@endtemplate}
abstract class SetupResponse implements Built<SetupResponse, SetupResponseBuilder> {
  /// {@macro setup_response}
  factory SetupResponse([void Function(SetupResponseBuilder) updates]) = _$SetupResponse;
  SetupResponse._();

  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SetupResponse.serializer, this)! as Map<String, dynamic>;
  }

  /// Converts a `Map<String, dynamic>` into a [SetupResponse] instance.
  static SetupResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SetupResponse.serializer, json)!;
  }

  /// The serializer that serializes this value.
  static Serializer<SetupResponse> get serializer => _$setupResponseSerializer;

  /// URL where the target is available from the host side.
  Uri get hostURL;

  /// URL where the target is available from itself.
  Uri get targetURL;
}

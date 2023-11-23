// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart' as dynamite_utils;

part 'pattern_check.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );
}

@BuiltValue(instantiable: false)
abstract interface class TestObjectInterface {
  @BuiltValueField(wireName: 'only-numbers')
  String? get onlyNumbers;
  @BuiltValueField(wireName: 'min-length')
  String? get minLength;
  @BuiltValueField(wireName: 'max-length')
  String? get maxLength;
  @BuiltValueField(wireName: 'multiple-checks')
  String? get multipleChecks;
}

abstract class TestObject implements TestObjectInterface, Built<TestObject, TestObjectBuilder> {
  factory TestObject([final void Function(TestObjectBuilder)? b]) = _$TestObject;

  const TestObject._();

  factory TestObject.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<TestObject> get serializer => _$testObjectSerializer;

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(final TestObjectBuilder b) {
    dynamite_utils.checkPattern(b.onlyNumbers, RegExp(r'^[0-9]*$'), 'b.onlyNumbers');
    dynamite_utils.checkMinLength(b.minLength, 3, 'b.minLength');
    dynamite_utils.checkMaxLength(b.maxLength, 20, 'b.maxLength');
    dynamite_utils.checkPattern(b.multipleChecks, RegExp(r'^[0-9]*$'), 'b.multipleChecks');
    dynamite_utils.checkMinLength(b.multipleChecks, 3, 'b.multipleChecks');
    dynamite_utils.checkMaxLength(b.multipleChecks, 20, 'b.multipleChecks');
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(TestObject), TestObject.new)
      ..add(TestObject.serializer))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end

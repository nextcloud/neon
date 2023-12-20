// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
// ignore_for_file: unused_element
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';

part 'interfaces.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
  });

  Client.fromClient(DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );
}

@BuiltValue(instantiable: false)
abstract interface class $BaseInterface {
  String? get attribute;
}

abstract class Base implements $BaseInterface, Built<Base, BaseBuilder> {
  factory Base([void Function(BaseBuilder)? b]) = _$Base;

  const Base._();

  factory Base.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<Base> get serializer => _$baseSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class $BaseInterfaceInterface {
  String? get attribute;
}

abstract class BaseInterface implements $BaseInterfaceInterface, Built<BaseInterface, BaseInterfaceBuilder> {
  factory BaseInterface([void Function(BaseInterfaceBuilder)? b]) = _$BaseInterface;

  const BaseInterface._();

  factory BaseInterface.fromJson(Map<String, dynamic> json) => jsonSerializers.deserializeWith(serializer, json)!;

  Map<String, dynamic> toJson() => jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  static Serializer<BaseInterface> get serializer => _$baseInterfaceSerializer;
}

// coverage:ignore-start
@visibleForTesting
final Serializers serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(Base), BaseBuilder.new)
      ..add(Base.serializer)
      ..addBuilderFactory(const FullType(BaseInterface), BaseInterfaceBuilder.new)
      ..add(BaseInterface.serializer))
    .build();

@visibleForTesting
final Serializers jsonSerializers = (serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end

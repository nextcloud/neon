import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/models/openapi/schema.dart';

part 'header.g.dart';

abstract class Header implements Built<Header, HeaderBuilder> {
  factory Header([final void Function(HeaderBuilder) updates]) = _$Header;

  const Header._();

  static Serializer<Header> get serializer => _$headerSerializer;

  @BuiltValueField(compare: false)
  String? get description;

  bool? get required;

  Schema? get schema;
}

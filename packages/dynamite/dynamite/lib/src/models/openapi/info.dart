import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/models/openapi/license.dart';

part 'info.g.dart';

abstract class Info implements Built<Info, InfoBuilder> {
  factory Info([final void Function(InfoBuilder) updates]) = _$Info;

  const Info._();

  static Serializer<Info> get serializer => _$infoSerializer;

  @BuiltValueField(compare: false)
  String get title;

  String get version;

  License get license;

  @BuiltValueField(compare: false)
  String? get description;
}

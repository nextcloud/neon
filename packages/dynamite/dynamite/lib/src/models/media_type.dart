import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/models/schema.dart';

part 'media_type.g.dart';

abstract class MediaType implements Built<MediaType, MediaTypeBuilder> {
  factory MediaType([final void Function(MediaTypeBuilder) updates]) = _$MediaType;

  const MediaType._();

  static Serializer<MediaType> get serializer => _$mediaTypeSerializer;

  Schema? get schema;
}

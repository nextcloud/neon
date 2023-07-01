import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_string.g.dart';

abstract class ContentString<T> implements Built<ContentString<T>, ContentStringBuilder<T>> {
  factory ContentString([final void Function(ContentStringBuilder<T>)? b]) = _$ContentString<T>;
  const ContentString._();

  /// decoded contentString
  T get content;

  static Serializer<ContentString<Object?>> get serializer => _$contentStringSerializer;
}

class ContentStringPlugin implements SerializerPlugin {
  const ContentStringPlugin();

  @override
  Object? afterDeserialize(final Object? object, final FullType specifiedType) => object;

  @override
  Object? afterSerialize(final Object? object, final FullType specifiedType) {
    if (!specifiedType.root.toString().contains('ContentString')) {
      return object;
    }

    if (object is! Map<String, dynamic>) {
      throw ArgumentError('ContentStringPlugin can only be applied to Map<String, dynamic>. '
          'Please ensure the StandardJsonPlugin is applied and run before.');
    }

    final content = object['content'];

    return jsonEncode(content);
  }

  @override
  Object? beforeDeserialize(final Object? object, final FullType specifiedType) {
    if (!specifiedType.root.toString().contains('ContentString')) {
      return object;
    }

    if (object is! String) {
      throw ArgumentError('The serialized ContentString must be of type String. '
          'Please ensure the StandardJsonPlugin is applied and run before.');
    }

    final content = jsonDecode(object);

    return ['content', content];
  }

  @override
  Object? beforeSerialize(final Object? object, final FullType specifiedType) => object;
}

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'content_string.g.dart';

/// Json data encoded in a `String` as defined by [json-schema](https://json-schema.org/understanding-json-schema/reference/non_json_data.html#contentschema).
abstract class ContentString<T> implements Built<ContentString<T>, ContentStringBuilder<T>> {
  /// Creates a new content `String`.
  factory ContentString([final void Function(ContentStringBuilder<T>)? b]) = _$ContentString<T>;
  const ContentString._();

  /// The decoded value of the content `String`.
  T get content;

  /// The serializer for a content `String`.
  static Serializer<ContentString<Object?>> get serializer => _$contentStringSerializer;
}

/// Serialization plugin for decoding [ContentString]s.
///
/// This plugin must be after the `StandardJsonPlugin`.
class ContentStringPlugin implements SerializerPlugin {
  /// Creates a new serialization plugin for decoding [ContentString]s.
  ///
  /// This plugin must be after the `StandardJsonPlugin`.
  const ContentStringPlugin();

  @override
  Object? afterDeserialize(final Object? object, final FullType specifiedType) => object;

  @override
  Object? afterSerialize(final Object? object, final FullType specifiedType) {
    if (!specifiedType.root.toString().contains('ContentString')) {
      return object;
    }

    if (object is! Map<String, dynamic>) {
      throw StateError('ContentStringPlugin can only be applied to Map<String, dynamic>. '
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
      throw StateError('The serialized ContentString must be of type String. '
          'Please ensure the StandardJsonPlugin is applied and run before.');
    }

    final content = jsonDecode(object);

    return ['content', content];
  }

  @override
  Object? beforeSerialize(final Object? object, final FullType specifiedType) => object;
}

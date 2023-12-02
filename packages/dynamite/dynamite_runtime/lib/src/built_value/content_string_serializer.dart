import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/src/models/content_string.dart';

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
    if (specifiedType.root != ContentString) {
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
    if (specifiedType.root != ContentString) {
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

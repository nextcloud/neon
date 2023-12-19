import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/models.dart';

/// Serialization plugin for decoding [Header]s.
///
/// This plugin must be after the `StandardJsonPlugin`.
class HeaderPlugin implements SerializerPlugin {
  /// Creates a new serialization plugin for decoding [Header]s.
  ///
  /// This plugin must be after the `StandardJsonPlugin`.
  const HeaderPlugin();

  @override
  Object? afterDeserialize(final Object? object, final FullType specifiedType) => object;

  @override
  Object? afterSerialize(final Object? object, final FullType specifiedType) {
    if (specifiedType.root != Header) {
      return object;
    }

    if (object == null) {
      return object;
    }

    if (object is! Map<String, dynamic>) {
      throw StateError('HeaderPlugin can only be applied to Map<String, dynamic>. '
          'Please ensure the StandardJsonPlugin is applied and run before.');
    }

    final content = object['content'];
    return _encode(content);
  }

  @override
  Object? beforeDeserialize(final Object? object, final FullType specifiedType) {
    if (specifiedType.root != Header) {
      return object;
    }

    if (object == null) {
      return object;
    }

    if (object is! String) {
      throw StateError('The serialized Header must be of type String. '
          'Please ensure the StandardJsonPlugin is applied and run before.');
    }

    final elementType = specifiedType.parameters.isEmpty ? FullType.unspecified : specifiedType.parameters[0];
    final content = _decode(object, elementType);

    return ['content', content];
  }

  @override
  Object? beforeSerialize(final Object? object, final FullType specifiedType) => object;

  String _encode(final Object? content) {
    switch (content) {
      case Map():
        return content.entries.map((final entry) => '${entry.key},${_encode(entry.value)}').join(',');
      case List():
        return content.map(_encode).join(',');
      default:
        if (content == null) {
          return '';
        }

        // For primitives `toString` should result int the same.
        // Using the json codec to align with the decode function.
        return jsonEncode(content);
    }
  }

  Object? _decode(final String content, final FullType specifiedType) {
    switch (specifiedType.root) {
      case const (Map) || const (BuiltMap):
        final values = content.split(',');
        final deserialized = <String, Object?>{};
        final elementType = specifiedType.parameters.isEmpty ? FullType.unspecified : specifiedType.parameters[1];

        for (var i = 0; i < values.length; i += 2) {
          deserialized[values[i]] = _decode(values[i + 1], elementType);
        }

        return deserialized;

      case const (List) || const (BuiltList):
        final elementType = specifiedType.parameters.isEmpty ? FullType.unspecified : specifiedType.parameters[0];

        return content.split(',').map((final value) => _decode(value, elementType)).toList();
      case const (String):
        return jsonDecode(content);

      default:
        if (content.isEmpty) {
          return null;
        }

        return jsonDecode(content);
    }
  }
}

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:crypto/crypto.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:meta/meta.dart';

part 'base.dart';
part 'enum.dart';
part 'list.dart';
part 'map.dart';
part 'object.dart';
part 'some_of.dart';

@immutable
sealed class TypeResult {
  TypeResult(
    this.className, {
    BuiltList<TypeResult>? generics,
    this.nullable = false,
    this.isTypeDef = false,
    String? builderName,
  })  : builderName = builderName ?? className,
        generics = generics ?? BuiltList(),
        assert(!className.contains('<'), 'Specify generics in the generics parameter.'),
        assert(!className.contains('?'), 'Nullability should not be specified in the type.');

  final String className;
  final String builderName;
  final BuiltList<TypeResult> generics;
  final bool nullable;

  /// Whether this type should be represented as a typedef.
  final bool isTypeDef;

  @nonVirtual
  String get name {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('$className<')
        ..writeAll(generics.map((c) => c.nullableName), ', ')
        ..write('>');
      return buffer.toString();
    }

    return className;
  }

  @nonVirtual
  String get builder {
    final buffer = StringBuffer(builderName);
    if (generics.isNotEmpty) {
      buffer
        ..write('<')
        ..writeAll(generics.map((c) => c.nullableName), ', ')
        ..write('>');
    }

    return buffer.toString();
  }

  @nonVirtual
  String get fullType => 'const ${_fullType(false)}';

  String _fullType(bool asNullable) {
    final buffer = StringBuffer('FullType');
    if (nullable && asNullable) {
      buffer.write('.nullable');
    }
    buffer.write('($className');
    if (generics.isNotEmpty) {
      buffer
        ..write(', [')
        ..writeAll(generics.map((c) => c._fullType(true)), ', ')
        ..write(']');
    }
    buffer.write(')');

    return buffer.toString();
  }

  Iterable<String> get serializers sync* {
    if (isTypeDef) {
      return;
    }

    for (final class_ in generics) {
      yield* class_.serializers;
    }

    if (_builderFactory != null) {
      yield _builderFactory!;
    }
    if (_serializer != null) {
      yield _serializer!;
    }
  }

  String? get _serializer => '..add($className.serializer)';

  String? get _builderFactory => '..addBuilderFactory(const ${_fullType(false)}, $builder.new)';

  /// Serializes the variable named [object].
  ///
  /// The serialized result is an [Object]?
  @mustCallSuper
  String serialize(String object, [String? serializerName]) =>
      '${serializerName ?? r'_$jsonSerializers'}.serialize($object, specifiedType: $fullType)';

  /// Deserializes the variable named [object].
  ///
  /// The serialized result will be of [name].
  @mustCallSuper
  String deserialize(String object, [String? serializerName]) {
    final buffer = StringBuffer()
      ..write(serializerName ?? r'_$jsonSerializers')
      ..writeln('.deserialize(')
      ..write(object)
      ..writeln(',')
      ..write('specifiedType: ')
      ..write(fullType)
      ..writeln(',')
      ..write(')');

    if (!nullable) {
      buffer.write('!');
    }

    return '$buffer as $name';
  }

  /// Decodes the variable named [object].
  String decode(String object) => 'json.decode($object as String)';

  /// Encodes the variable named [object].
  String encode(
    String object, {
    required String mimeType,
  }) {
    final serialized = serialize(object);

    switch (mimeType) {
      case 'application/json':
        return 'json.encode($serialized)';
      case 'application/x-www-form-urlencoded':
        return 'Uri(queryParameters: $serialized! as Map<String, dynamic>).query';
      case 'application/octet-stream':
        if (className != 'Uint8List') {
          throw Exception('octet-stream can only be applied to binary data. Expected Uint8List but got $className');
        }
        return '$object as Uint8List';
      default:
        throw Exception('Can not encode mime type "$mimeType"');
    }
  }

  /// Nullable TypeName
  String get nullableName => nullable ? '$name?' : name;

  /// Native dart type equivalent
  TypeResult get dartType;

  /// Returns `this` with a `true` value for [isTypeDef].
  TypeResult get asTypeDef {
    final $this = this;

    // We need to preserve the original runtime type.
    return switch ($this) {
      TypeResultBase() => TypeResultBase(
          className,
          nullable: nullable,
          isTypeDef: true,
        ),
      TypeResultEnum() => TypeResultEnum(
          className,
          $this.subType,
          nullable: nullable,
          isTypeDef: true,
        ),
      TypeResultList() => TypeResultList(
          className,
          $this.subType,
          nullable: nullable,
          isTypeDef: true,
        ),
      TypeResultMap() => TypeResultMap(
          className,
          $this.subType,
          nullable: nullable,
          isTypeDef: true,
        ),
      TypeResultObject() => TypeResultObject(
          className,
          generics: generics,
          nullable: nullable,
          isTypeDef: true,
        ),
      // SomeOfs are always typeDefs
      TypeResultSomeOf() => $this,
    };
  }

  @override
  bool operator ==(Object other) => other is TypeResult && other.className == className && other.generics == generics;

  @override
  int get hashCode => className.hashCode + generics.hashCode;
}

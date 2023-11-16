import 'package:meta/meta.dart';

part 'base.dart';
part 'enum.dart';
part 'list.dart';
part 'map.dart';
part 'object.dart';

@immutable
sealed class TypeResult {
  TypeResult(
    this.className, {
    this.generics = const [],
    this.nullable = false,
    this.isTypeDef = false,
    final String? builderName,
  })  : builderName = builderName ?? className,
        assert(!className.contains('<'), 'Specify generics in the generics parameter.'),
        assert(!className.contains('?'), 'Nullability should not be specified in the type.');

  final String className;
  final String builderName;
  final List<TypeResult> generics;
  final bool nullable;

  /// Whether this type should be represented as a typedef.
  final bool isTypeDef;

  @nonVirtual
  String get name {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('$className<')
        ..writeAll(generics.map((final c) => c.name), ', ')
        ..write('>');
      return buffer.toString();
    }

    return className;
  }

  @nonVirtual
  String get builder {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('$builderName<')
        ..writeAll(generics.map((final c) => c.name), ', ')
        ..write('>');
      return buffer.toString();
    }

    return builderName;
  }

  @nonVirtual
  String get fullType {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('FullType($className, [')
        ..writeAll(generics.map((final c) => c.fullType), ', ')
        ..write('])');

      return buffer.toString();
    }

    return 'FullType($className)';
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

  String? get _builderFactory => '..addBuilderFactory($fullType, $builder.new)';

  /// Serializes the variable named [object].
  ///
  /// The serialized result is an [Object]?
  @nonVirtual
  String serialize(final String object, [final String? serializerName]) =>
      '${serializerName ?? '_jsonSerializers'}.serialize($object, specifiedType: const $fullType)';

  /// Deserializes the variable named [object].
  ///
  /// The serialized result will be of [name].
  @nonVirtual
  String deserialize(final String object, [final String? serializerName]) {
    final buffer = StringBuffer()
      ..write(serializerName ?? '_jsonSerializers')
      ..write('.deserialize(')
      ..write(object)
      ..write(', specifiedType: const $fullType)');

    if (!nullable) {
      buffer.write('!');
    }

    return '($buffer as $name)';
  }

  /// Decodes the variable named [object].
  String decode(final String object) => 'json.decode($object as String)';

  /// Encodes the variable named [object].
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
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
  // ignore: avoid_returning_this
  TypeResult get dartType => this;

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
    };
  }

  @override
  bool operator ==(final Object other) =>
      other is TypeResult && other.className == className && other.generics == generics;

  @override
  int get hashCode => className.hashCode + generics.hashCode;
}

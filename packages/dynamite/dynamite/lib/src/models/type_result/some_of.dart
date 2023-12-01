part of 'type_result.dart';

@immutable
abstract class TypeResultSomeOf extends TypeResult {
  TypeResultSomeOf(
    super.className, {
    required final BuiltSet<TypeResult> subTypes,
    super.nullable,
  })  : subTypes = subTypes.sortedBy((final subType) => subType.className.toLowerCase()).toBuiltList(),
        assert(subTypes.isNotEmpty, 'Must have at least one subType');

  final BuiltList<TypeResult> subTypes;

  @override
  bool get isTypeDef => isSingleValue;

  @override
  String? get _builderFactory => null;

  late final bool isSingleValue = subTypes.length == 1;

  @override
  String? get _serializer {
    if (isSingleValue) {
      return null;
    }

    return '..add(${typeName}Extension.serializer)';
  }

  @override
  TypeResult get dartType {
    if (isSingleValue) {
      return subTypes.single;
    }

    final record = subTypes.map((final type) {
      final dartType = type.nullableName;
      final dartName = toDartName(dartType);
      final fieldName = toFieldName(dartName, type.className);

      return '$dartType $fieldName';
    });

    return TypeResultBase('({${record.join(',')}})');
  }

  late final String typeName = _typeName;

  String get _typeName {
    final buffer = StringBuffer(r'$');
    for (final type in subTypes) {
      buffer.write(toDartName(type.className, uppercaseFirstCharacter: true));
    }

    return buffer.toString();
  }

  @override
  bool operator ==(final Object other) =>
      other is TypeResultSomeOf &&
      other.className == className &&
      other.generics == generics &&
      other.dartType == dartType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + dartType.hashCode;
}

class TypeResultAnyOf extends TypeResultSomeOf {
  TypeResultAnyOf(
    super.className, {
    required super.subTypes,
    super.nullable,
  });

  @override
  String deserialize(final String object, [final String? serializerName]) =>
      '(${super.deserialize(object, serializerName)}..validateAnyOf())';

  @override
  bool operator ==(final Object other) =>
      other is TypeResultAnyOf &&
      other.className == className &&
      other.generics == generics &&
      other.dartType == dartType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + dartType.hashCode;
}

class TypeResultOneOf extends TypeResultSomeOf {
  TypeResultOneOf(
    super.className, {
    required super.subTypes,
    super.nullable,
  });

  @override
  String deserialize(final String object, [final String? serializerName]) =>
      '(${super.deserialize(object, serializerName)}..validateOneOf())';

  @override
  bool operator ==(final Object other) =>
      other is TypeResultOneOf &&
      other.className == className &&
      other.generics == generics &&
      other.dartType == dartType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + dartType.hashCode;
}

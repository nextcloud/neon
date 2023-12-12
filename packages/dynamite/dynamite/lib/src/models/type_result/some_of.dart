part of 'type_result.dart';

@immutable
abstract class TypeResultSomeOf extends TypeResult {
  TypeResultSomeOf(
    super.className, {
    required this.subTypes,
    super.nullable,
  }) : assert(subTypes.isNotEmpty, 'Must have at least one subType');

  @protected
  final BuiltSet<TypeResult> subTypes;

  @override
  bool get isTypeDef => isSingleValue;

  @override
  String? get _builderFactory => null;

  late final bool isSingleValue = optimizedSubTypes.length == 1;

  @override
  String? get _serializer {
    if (isSingleValue) {
      return null;
    }

    return '..add(${typeName}Extension.serializer)';
  }

  late final BuiltSet<TypeResult> optimizedSubTypes = _optimizedSubTypes.toBuiltSet();

  @override
  TypeResult get dartType {
    if (isSingleValue) {
      return optimizedSubTypes.single;
    }

    final record = optimizedSubTypes.map((final type) {
      final dartType = type.nullableName;
      final dartName = toDartName(dartType);
      final fieldName = toFieldName(dartName, type.className);

      return '$dartType $fieldName';
    });

    return TypeResultBase('({${record.join(',')}})');
  }

  late final String typeName = _typeName;

  String get _typeName {
    final buffer = StringBuffer();
    for (final type in optimizedSubTypes) {
      buffer.write(type.className.capitalize());
    }

    return '\$${toDartName(buffer.toString(), uppercaseFirstCharacter: true)}';
  }

  BuiltList<TypeResult> get _optimizedSubTypes {
    final subTypes = BuiltSet<TypeResult>.build((final b) {
      for (final type in this.subTypes) {
        if (type is TypeResultAnyOf && this is TypeResultAnyOf) {
          b.addAll(type.optimizedSubTypes);
        } else if (type is TypeResultOneOf && this is TypeResultOneOf) {
          b.addAll(type.optimizedSubTypes);
        } else {
          b.add(type);
        }
      }
    });

    final optimized = ListBuilder<TypeResult>();
    final optimizeNum = subTypes.where(_isNumber).length >= 2;

    if (optimizeNum) {
      optimized.add(TypeResultBase('num', nullable: true));
    }

    optimized.addAll(
      subTypes.where((final type) {
        if (!optimizeNum) {
          return true;
        }

        return !_isNumber(type);
      }),
    );

    // ignore: cascade_invocations
    optimized.sort((final a, final b) => a.className.toLowerCase().compareTo(b.className.toLowerCase()));
    return optimized.build();
  }

  bool _isNumber(final TypeResult type) => switch (type.className) {
        'int' || 'double' || 'num' => true,
        _ => false,
      };

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

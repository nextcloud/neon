part of 'type_result.dart';

@immutable
class TypeResultEnum extends TypeResult {
  TypeResultEnum(
    super.className,
    this.subType, {
    super.nullable,
    super.isTypeDef,
  });

  final TypeResult subType;

  @override
  String? get _builderFactory => null;

  @override
  TypeResultEnum get dartType => TypeResultEnum(
        className,
        subType.dartType,
        nullable: nullable,
        isTypeDef: isTypeDef,
      );

  @override
  bool operator ==(Object other) => other is TypeResultEnum && other.className == className && other.subType == subType;

  @override
  int get hashCode => className.hashCode + subType.hashCode;
}

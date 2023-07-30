part of 'type_result.dart';

@immutable
class TypeResultMap extends TypeResult {
  TypeResultMap(
    super.name,
    final TypeResult subType, {
    super.nullable,
  }) : super(generics: [TypeResultBase('String'), subType]);

  TypeResult get subType => generics[1];

  @override
  String? get _builderFactory => '..addBuilderFactory($fullType, MapBuilder<String, ${subType.className}>.new)';

  @override
  String? get _serializer => null;

  @override
  TypeResultMap get dartType => TypeResultMap('Map', subType, nullable: nullable);

  @override
  bool operator ==(final Object other) =>
      other is TypeResultMap &&
      other.className == className &&
      other.generics == generics &&
      other.nullable == nullable &&
      other.subType == subType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + nullable.hashCode + subType.hashCode;
}

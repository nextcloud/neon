part of 'type_result.dart';

@immutable
class TypeResultList extends TypeResult {
  TypeResultList(
    super.name,
    final TypeResult subType, {
    super.nullable,
  }) : super(generics: [subType]);

  TypeResult get subType => generics.first;

  @override
  String? get _builderFactory => '..addBuilderFactory($fullType, ListBuilder<${subType.className}>.new)';

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    if (onlyChildren) {
      return '$object.map((final e) => ${subType.encode('e', mimeType: mimeType)})';
    }

    return super.encode(object, mimeType: mimeType);
  }

  @override
  TypeResultList get dartType => TypeResultList('List', subType, nullable: nullable);

  @override
  bool operator ==(final Object other) =>
      other is TypeResultList &&
      other.className == className &&
      other.generics == generics &&
      other.nullable == nullable &&
      other.subType == subType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + nullable.hashCode + subType.hashCode;
}

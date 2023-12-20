part of 'type_result.dart';

@immutable
class TypeResultList extends TypeResult {
  TypeResultList(
    super.className,
    final TypeResult subType, {
    super.nullable,
    super.isTypeDef,
    super.builderName = 'ListBuilder',
  }) : super(generics: BuiltList([subType]));

  TypeResult get subType => generics.first;

  @override
  String? get _serializer => null;

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    if (onlyChildren) {
      return '($object as List).map<String>((e) => ${subType.encode('e', mimeType: mimeType)}).join()';
    }

    return super.encode(object, mimeType: mimeType);
  }

  @override
  TypeResultList get dartType => TypeResultList('List', subType, nullable: nullable);

  @override
  bool operator ==(final Object other) =>
      other is TypeResultList && other.className == className && other.generics == generics && other.subType == subType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + subType.hashCode;
}

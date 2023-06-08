part of 'type_result.dart';

@immutable
class TypeResultEnum extends TypeResult {
  TypeResultEnum(
    super.name,
    this.subType, {
    super.nullable,
  });

  final TypeResult subType;

  @override
  String? get _builderFactory => null;

  @override
  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  }) {
    if (subType.name == 'String') {
      return '$object.name';
    }

    return super.encode(object, mimeType: mimeType);
  }

  @override
  String decode(final String object) => subType.decode(object);

  @override
  bool operator ==(final Object other) =>
      other is TypeResultEnum &&
      other.className == className &&
      other.generics == generics &&
      other.nullable == nullable &&
      other.subType == subType;

  @override
  int get hashCode => className.hashCode + generics.hashCode + nullable.hashCode + subType.hashCode;
}

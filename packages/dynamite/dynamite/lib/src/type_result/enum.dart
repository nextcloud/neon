part of '../../dynamite.dart';

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
}

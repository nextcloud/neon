part of '../../dynamite.dart';

abstract class TypeResult {
  TypeResult(
    this.className, {
    this.generics = const [],
  })  : assert(!className.contains('<'), 'Specifiy generics in the generics parameter.'),
        assert(!className.contains('?'), 'Nullability should not be specified in the type.');

  final String className;
  final List<TypeResult> generics;
  String get name {
    if (generics.isNotEmpty) {
      final buffer = StringBuffer('$className<')
        ..writeAll(generics.map((final c) => c.name).intersperse(', '))
        ..write('>');
      return buffer.toString();
    }

    return className;
  }

  String serialize(final String object);

  String deserialize(final String object, {final bool toBuilder = false});

  String decode(final String object);

  String encode(
    final String object, {
    final bool onlyChildren = false,
    final String? mimeType,
  });
}

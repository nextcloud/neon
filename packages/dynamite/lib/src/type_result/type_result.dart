part of '../../dynamite.dart';

abstract class TypeResult {
  TypeResult(this.name);

  final String name;

  String serialize(final String object);

  String deserialize(final String object);

  String decode(final String object);

  String encode(final String object);
}

import 'package:built_value/built_value.dart';

mixin TypeResultMixin {
  @BuiltValueField(compare: false, serialize: false)
  String? get identifier;
}

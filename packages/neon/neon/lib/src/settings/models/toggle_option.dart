import 'package:neon/src/settings/models/option.dart';
import 'package:rxdart/rxdart.dart';

class ToggleOption extends Option<bool> {
  ToggleOption({
    required super.storage,
    required super.key,
    required super.label,
    required super.defaultValue,
    super.category,
    super.enabled,
  }) : super(stream: BehaviorSubject.seeded(storage.getBool(key) ?? defaultValue));

  @override
  Future set(final bool value) {
    stream.add(value);
    return storage.setBool(key, value);
  }

  @override
  bool serialize() => value;

  @override
  Future<bool?> deserialize(final dynamic data) async => data as bool;
}

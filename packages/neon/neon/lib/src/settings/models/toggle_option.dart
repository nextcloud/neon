import 'dart:async';

import 'package:neon/src/settings/models/option.dart';

class ToggleOption extends Option<bool> {
  /// Creates a ToggleOption
  ToggleOption({
    required super.storage,
    required super.key,
    required super.label,
    required final bool defaultValue,
    super.category,
    super.enabled,
  }) : super(defaultValue: storage.getBool(key) ?? defaultValue);

  /// Creates a ToggleOption depending on the State of another [Option].
  ToggleOption.depend({
    required super.storage,
    required super.key,
    required super.label,
    required final bool defaultValue,
    required super.enabled,
    super.category,
  }) : super.depend(
          defaultValue: storage.getBool(key) ?? defaultValue,
        );

  @override
  set value(final bool value) {
    unawaited(storage.setBool(key, value));
    super.value = value;
  }

  @override
  bool serialize() => value;

  @override
  bool deserialize(final dynamic data) => data as bool;
}

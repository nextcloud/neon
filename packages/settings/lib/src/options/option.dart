part of '../../settings.dart';

class OptionDisableException implements Exception {}

abstract class Option<T> {
  Option({
    required this.storage,
    required this.key,
    required this.label,
    required this.defaultValue,
    this.category,
    final BehaviorSubject<bool>? enabled,
  }) : assert(defaultValue.hasValue, 'When using defaultValue the stream has to be seeded') {
    if (enabled != null) {
      this.enabled = enabled;
    } else {
      this.enabled = BehaviorSubject<bool>.seeded(true);
    }
  }

  final SettingsStorage storage;
  final String key;
  final LabelBuilder label;
  final BehaviorSubject<T> defaultValue;
  final OptionsCategory? category;
  late final BehaviorSubject<bool> enabled;

  late BehaviorSubject<T> stream;
  T get value {
    if (!enabled.value) {
      throw OptionDisableException();
    }

    return stream.value ?? defaultValue.value;
  }

  void dispose() {
    stream.close();
    enabled.close();
  }

  Future set(final T value);

  Future<T?> deserialize(final dynamic data);

  dynamic serialize();
}

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
  })  : enabled = enabled ?? BehaviorSubject<bool>.seeded(true),
        assert(defaultValue.hasValue, 'When using defaultValue the stream has to be seeded');

  final SettingsStorage storage;
  final String key;
  final LabelBuilder label;
  final BehaviorSubject<T> defaultValue;
  final OptionsCategory? category;
  final BehaviorSubject<bool> enabled;

  late BehaviorSubject<T> stream;
  T get value {
    if (hasValue) {
      return stream.value;
    }

    return defaultValue.value;
  }

  bool get hasValue {
    if (!enabled.value) {
      throw OptionDisableException();
    }

    return stream.hasValue;
  }

  Future reset() async {
    await set(defaultValue.value);
  }

  void dispose() {
    unawaited(stream.close());
    unawaited(enabled.close());
  }

  Future set(final T value);

  Future<T?> deserialize(final dynamic data);

  dynamic serialize();
}

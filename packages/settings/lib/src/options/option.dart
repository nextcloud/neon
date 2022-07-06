part of '../../settings.dart';

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
  T get value => stream.value ?? defaultValue.value;

  void dispose() {
    // ignore: discarded_futures
    stream.close();
    // ignore: discarded_futures
    enabled.close();
  }

  Future set(final T value);

  Future<T?> deserialize(final dynamic data);

  dynamic serialize();
}

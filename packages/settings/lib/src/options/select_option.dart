part of '../../settings.dart';

class SelectOption<T> extends Option<T> {
  SelectOption({
    required super.storage,
    required super.key,
    required super.label,
    required super.defaultValue,
    required this.values,
    super.category,
    super.enabled,
  }) {
    stream = BehaviorSubject();
    unawaited(
      values.first.then((final vs) async {
        final valueStr = storage.getString(key);
        T? initialValue;

        if (valueStr != null) {
          initialValue = _fromString(vs, valueStr);
        }
        stream.add(initialValue ?? defaultValue);
      }),
    );
  }

  T? _fromString(final Map<T, LabelBuilder> vs, final String? valueStr) {
    final v = vs.keys.where((final e) => e.toString() == valueStr).toList();
    if (v.length == 1) {
      return v[0];
    }
    return null;
  }

  final BehaviorSubject<Map<T, LabelBuilder>> values;

  @override
  Future set(final T value) {
    stream.add(value);
    return storage.setString(key, value.toString());
  }

  @override
  String? serialize() => value?.toString();

  @override
  Future<T?> deserialize(final dynamic data) async => _fromString(await values.first, data as String?);
}

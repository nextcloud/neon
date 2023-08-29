import 'dart:async';

import 'package:collection/collection.dart';
import 'package:neon/src/models/label_builder.dart';
import 'package:neon/src/settings/models/option.dart';

class SelectOption<T> extends Option<T> {
  /// Creates a SelectOption
  SelectOption({
    required super.storage,
    required super.key,
    required super.label,
    required super.defaultValue,
    required final Map<T, LabelBuilder> values,

    /// Force loading the stored value.
    ///
    /// This is needed when [values] is empty but the stored value should still be loaded.
    /// This only works when [T] is of type String?.
    final bool forceLoadValue = true,
    super.category,
    super.enabled,
  })  : _values = values,
        super(initialValue: loadValue(values, storage.getString(key.value), forceLoad: forceLoadValue));

  /// Creates a SelectOption depending on the State of another [Option].
  SelectOption.depend({
    required super.storage,
    required super.key,
    required super.label,
    required super.defaultValue,
    required final Map<T, LabelBuilder> values,
    required super.enabled,

    /// Force loading the stored value.
    ///
    /// This is needed when [values] is empty but the stored value should still be loaded.
    /// This only works when [T] is of type String?.
    final bool forceLoadValue = true,
    super.category,
  })  : _values = values,
        super.depend(initialValue: loadValue(values, storage.getString(key.value), forceLoad: forceLoadValue));

  static T? loadValue<T>(final Map<T, LabelBuilder> vs, final String? stored, {final bool forceLoad = true}) {
    if (forceLoad && vs.isEmpty && stored is T) {
      return stored as T;
    }

    return _deserialize(vs, stored);
  }

  @override
  void reset() {
    unawaited(storage.remove(key.value));

    super.reset();
  }

  Map<T, LabelBuilder> _values;

  @override
  set value(final T value) {
    super.value = value;

    if (value != null) {
      unawaited(storage.setString(key.value, serialize()!));
    }
  }

  /// A collection of different values this can have.
  ///
  /// See:
  /// * [value] for the currently selected one
  Map<T, LabelBuilder> get values => _values;

  set values(final Map<T, LabelBuilder> newValues) {
    if (_values == newValues) {
      return;
    }
    _values = newValues;
    notifyListeners();
  }

  @override
  String? serialize() => _serialize(value);

  static String? _serialize<T>(final T value) => value?.toString();

  @override
  T? deserialize(final Object? data) => _deserialize(_values, data as String?);

  static T? _deserialize<T>(final Map<T, LabelBuilder> vs, final String? valueStr) {
    if (valueStr == null) {
      return null;
    }

    return vs.keys.firstWhereOrNull((final e) => _serialize(e) == valueStr);
  }
}

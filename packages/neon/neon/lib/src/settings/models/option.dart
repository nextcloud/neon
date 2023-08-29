import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/models/label_builder.dart';
import 'package:neon/src/settings/models/options_category.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:rxdart/rxdart.dart';

@internal
abstract class Option<T> extends ChangeNotifier implements ValueListenable<T> {
  /// Creates an Option
  Option({
    required this.storage,
    required this.key,
    required this.label,
    required this.defaultValue,
    final bool enabled = true,
    this.category,
    final T? initialValue,
  })  : _value = initialValue ?? defaultValue,
        _enabled = enabled;

  /// Creates an Option depending on the State of another one.
  Option.depend({
    required this.storage,
    required this.key,
    required this.label,
    required this.defaultValue,
    required final ValueListenable<bool> enabled,
    this.category,
    final T? initialValue,
  })  : _value = initialValue ?? defaultValue,
        _enabled = enabled.value {
    enabled.addListener(() {
      this.enabled = enabled.value;
    });
  }

  final SettingsStorage storage;
  final Storable key;
  final LabelBuilder label;
  final T defaultValue;
  final OptionsCategory? category;

  T _value;

  /// The current value stored in this option.
  ///
  /// When the value is replaced with something that is not equal to the old
  /// value as evaluated by the equality operator ==, this class notifies its
  /// listeners.
  @override
  T get value => _value;
  @mustCallSuper
  set value(final T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }

  bool _enabled;

  /// The current enabled state stored in this option.
  ///
  /// When the value is replaced with something that is not equal to the old
  /// value as evaluated by the equality operator ==, this class notifies its
  /// listeners.
  bool get enabled => _enabled;
  @mustCallSuper
  set enabled(final bool newValue) {
    if (_enabled == newValue) {
      return;
    }
    _enabled = newValue;
    notifyListeners();
  }

  /// Resets the option to its [default] value.
  @mustBeOverridden
  void reset() {
    value = defaultValue;
  }

  /// Loads [data] into [value] by calling [deserialize] on it.
  void load(final Object? data) {
    final value = deserialize(data);

    if (value != null) {
      this.value = value;
    }
  }

  /// Deserializes the data.
  T? deserialize(final Object? data);

  /// Serializes the [value].
  Object? serialize();

  BehaviorSubject<T>? _stream;

  /// A stream of values that is updated on each event.
  ///
  /// This is similar to adding an [addListener] callback and getting the current data in it.
  /// You should generally listen to the notifications directly.
  Stream<T> get stream {
    _stream ??= BehaviorSubject.seeded(_value);

    addListener(() {
      _stream!.add(_value);
    });

    return _stream!;
  }

  @override
  void dispose() {
    unawaited(_stream?.close());

    super.dispose();
  }
}

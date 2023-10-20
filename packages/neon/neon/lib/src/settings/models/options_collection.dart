import 'package:flutter/foundation.dart';
import 'package:neon/src/models/disposable.dart';
import 'package:neon/src/settings/models/exportable.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/models/options_category.dart';
import 'package:neon/src/settings/models/storage.dart';

/// Collection of [Option]s.
abstract class OptionsCollection implements Exportable, Disposable {
  OptionsCollection(this.storage);

  /// Storage backend to use.
  @protected
  final AppStorage storage;

  /// Collection of options.
  @protected
  Iterable<Option<dynamic>> get options;

  /// Return a [Listenable] that triggers when any of the given [options] themselves trigger.
  Listenable get listenable => Listenable.merge(options.toList());

  /// Resets all [options].
  ///
  /// Implementers extending this must call super.
  @mustCallSuper
  void reset() {
    for (final option in options) {
      option.reset();
    }
  }

  /// Disposes all [options].
  ///
  /// Implementers extending this must call super.
  @mustCallSuper
  @override
  void dispose() {
    options.disposeAll();
  }

  @override
  MapEntry<String, Object?> export() {
    final data = Map.fromEntries(options.serialize());

    return MapEntry(storage.id, data);
  }

  @override
  void import(final Map<String, Object?> data) {
    final values = data[storage.id] as Map<String, Object?>?;

    if (values != null) {
      options.deserialize(values);
    }
  }
}

/// OptionsCollection for a neon app.
abstract class NextcloudAppOptions extends OptionsCollection {
  NextcloudAppOptions(super.storage);

  /// Collection of categories to display the options in the settings.
  late final Iterable<OptionsCategory> categories;

  @override
  late final Iterable<Option<dynamic>> options;
}

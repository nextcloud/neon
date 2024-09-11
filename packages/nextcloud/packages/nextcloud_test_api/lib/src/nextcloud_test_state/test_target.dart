import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud_test_api/src/models/models.dart';

/// Factory for creating [TestTargetInstance]s.
@internal
abstract class TestTargetFactory<T extends TestTargetInstance> {
  /// Spawns a new [T].
  FutureOr<T> spawn(Preset preset);

  /// Returns the available presets for the factory.
  late BuiltListMultimap<String, Version> presets = getPresets();

  /// Generates the presets.
  ///
  /// Use the cached version [presets] instead.
  @protected
  BuiltListMultimap<String, Version> getPresets();
}

/// Instance of a test target.
@internal
abstract class TestTargetInstance {
  /// Destroys the instance.
  FutureOr<void> destroy();

  /// URL where the target is available from the host side.
  Uri get hostURL;

  /// URL where the target is available from itself.
  Uri get targetURL;

  /// Creates an app password for [username] on the instance.
  Future<String> createAppPassword(String username);
}

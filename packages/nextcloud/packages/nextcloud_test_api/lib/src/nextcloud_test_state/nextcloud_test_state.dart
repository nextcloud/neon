import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:nextcloud_test_api/src/models/models.dart';
import 'package:nextcloud_test_api/src/nextcloud_test_api.dart';

/// The state of the nextcloud test manager.
///
/// Manages the nextcloud server for the tests.
class NextcloudTestState {
  /// The instance of the [TestTargetFactory].
  static final TestTargetFactory factory = _create();

  /// Creates a new [TestTargetFactory].
  static TestTargetFactory _create() {
    final dir = Platform.environment['DIR'];
    final url = Platform.environment['URL'];

    if (url != null || dir != null) {
      // Fail hard if the variables are not properly set to avoid a fallback to docker.
      return LocalFactory(
        dir: dir!,
        url: Uri.parse(url!),
      );
    }

    return DockerContainerFactory();
  }

  /// Retrieves the test presets for the given [groupName].
  BuiltList<Version> getPresets(String groupName) {
    return factory.presets[groupName];
  }

  final Map<Preset, TestTargetInstance> _targetInstances = {};

  /// Spawns [TestTargetInstance] for the given [preset].
  Future<TestTargetInstance> setup({
    required Preset preset,
  }) async {
    return _targetInstances[preset] ??= await factory.spawn(preset);
  }

  /// Destroys the [TestTargetInstance] for the given [preset].
  Future<void> teardown({
    required Preset preset,
  }) async {
    final instance = _targetInstances.remove(preset);
    await instance?.destroy();
  }

  /// Creates a new appPassword.
  Future<String?> createAppPassword({
    required Preset preset,
    required String username,
  }) async {
    return _targetInstances[preset]?.createAppPassword(username);
  }

  /// Loads the fixture identified by [fixtureID].
  String? getFixture({
    required String? fixtureID,
  }) {
    if (fixtureID == null) {
      return null;
    }

    return loadFixture(fixtureID);
  }
}

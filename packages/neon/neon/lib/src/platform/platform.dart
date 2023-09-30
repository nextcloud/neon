import 'dart:async';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:neon/src/platform/android.dart';
import 'package:neon/src/platform/linux.dart';

/// Implements platform specific functionality and exposes the availability of certain features.
///
/// [NeonPlatform.setup] mus be called and completed before acquiring the [instance].
///
/// See:
///   * [AndroidNeonPlatform] for the android implementation
///   * [LinuxNeonPlatform] for the linux implementation
@immutable
abstract interface class NeonPlatform {
  /// Initializes the platform with the given mocked [platform].
  @visibleForTesting
  factory NeonPlatform.mocked(final NeonPlatform platform) => _platform = platform;

  static NeonPlatform? _platform;

  /// Infers and configures the platform automatically.
  ///
  /// Required to be called before accessing [NeonPlatform.instance].
  static Future<void> setup() async {
    if (_platform != null) {
      return;
    }

    if (Platform.isAndroid) {
      _platform = const AndroidNeonPlatform();
    } else if (Platform.isLinux) {
      _platform = const LinuxNeonPlatform();
    } else {
      throw UnimplementedError('No implementation for platform ${Platform.operatingSystem} found');
    }

    await _platform!.init();
  }

  /// Gets the current instance of [NeonPlatform].
  ///
  /// Make sure [NeonPlatform.setup] has been called before accessing the instance.
  static NeonPlatform get instance {
    if (_platform == null) {
      throw StateError(
        'NeonPlatform has not been set up yet. Please make sure NeonPlatform.setup() has been called before and completed.',
      );
    }

    return _platform!;
  }

  /// Whether this platform supports web views.
  ///
  /// The support depends on `https://pub.dev/packages/webview_flutter`.
  abstract final bool canUseWebView;

  /// Whether this platform can use quick actions.
  ///
  /// The support depends on `https://pub.dev/packages/quick_actions`.
  abstract final bool canUseQuickActions;

  /// Whether this platform support system trays.
  ///
  /// The support depends on `https://pub.dev/packages/tray_manager`.
  abstract final bool canUseSystemTray;

  /// Whether this platform supports window managers.
  ///
  /// The support depends on `https://pub.dev/packages/window_manager`.
  abstract final bool canUseWindowManager;

  /// Whether this platform can use the camera.
  ///
  /// The support depends on `https://pub.dev/packages/camera`.
  abstract final bool canUseCamera;

  /// Whether this platform can use push notifications.
  ///
  /// The support depends on `https://pub.dev/packages/unifiedpush`.
  abstract final bool canUsePushNotifications;

  /// Wether this platform supports a native sharing option.
  ///
  /// The support depends on `https://pub.dev/packages/share_plus`.
  abstract final bool canUseSharing;

  /// Whether this platform should use file dialog.
  ///
  /// This is needed to compensate lacking support of `https://pub.dev/packages/file_picker`.
  abstract final bool shouldUseFileDialog;

  /// Returns the path to a directory where the application may access top
  /// level storage.
  FutureOr<String> get userAccessibleAppDataPath;

  /// Initializes this platform.
  FutureOr<void> init();
}

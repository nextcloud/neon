import 'dart:async';
import 'dart:typed_data';

import 'package:meta/meta.dart';

/// Implements platform specific functionality and exposes the availability of certain features.
///
/// See:
///   * `AndroidNeonPlatform` for the Android implementation
///   * `LinuxNeonPlatform` for the Linux implementation
@immutable
abstract interface class NeonPlatform {
  static NeonPlatform? _instance;

  static set instance(NeonPlatform instance) => _instance = instance;

  /// Gets the current instance of [NeonPlatform].
  static NeonPlatform get instance {
    if (_instance == null) {
      throw StateError(
        'NeonPlatform has not been set up yet. Please make sure NeonPlatform.setup() has been called before and completed.',
      );
    }

    return _instance!;
  }

  /// Whether this platform supports web views.
  ///
  /// The support depends on `https://pub.dev/packages/webview_flutter`.
  abstract final bool canUseWebView;

  /// Whether this platform can use quick actions.
  ///
  /// The support depends on `https://pub.dev/packages/quick_actions`.
  abstract final bool canUseQuickActions;

  /// Whether this platform supports managing the window.
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

  /// Whether this platform can use native sharing.
  ///
  /// The support depends on `https://pub.dev/packages/share_plus`.
  abstract final bool canUseSharing;

  /// Initializes this platform.
  FutureOr<void> init();

  /// Saves a file with the user choosing the location.
  ///
  /// Returns the path of the chosen location.
  Future<String?> saveFileWithPickDialog(String fileName, Uint8List data);
}

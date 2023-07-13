import 'package:flutter/material.dart';
import 'package:nextcloud/nextcloud.dart';

/// [Color] constants which represent Nextcloud's
/// [color palette](https://docs.nextcloud.com/server/latest/developer_manual/design/foundations.html#color).
abstract final class NcColors {
  /// Nextcloud blue.
  ///
  /// The default primary clolor as specified by the
  /// [design guidlines](https://docs.nextcloud.com/server/latest/developer_manual/design/foundations.html#primary-color).
  static const Color primary = Color(0xFF0082C9);

  /// The [ColorScheme.background] color used on OLED devices.
  ///
  /// This color is only used at the users discretion.
  static const Color oledBackground = Colors.black;

  /// Color of a starred item.
  static const Color starredColor = Colors.yellow;

  /// Color used to emphasise declining actions.
  ///
  /// Usually used in conjunction with [NcColors.accept].
  static const Color decline = Colors.red;

  /// Color used to emphasise accepting actions.
  ///
  /// Usually used in conjunction with [NcColors.decline].
  static const Color accept = Colors.green;
}

/// [UserStatusType] color mapping.
extension UserStatusTypeColors on UserStatusType {
  /// The color for the user status.
  Color? get color => switch (this) {
        UserStatusType.online => const Color(0xFF49B382),
        UserStatusType.away => const Color(0xFFF4A331),
        UserStatusType.dnd => const Color(0xFFED484C),
        _ => null,
      };
}

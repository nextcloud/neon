import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/src/theme/colors.dart';
import 'package:nextcloud/user_status.dart' as user_status;

const _minus45Rad = -45 * pi / 180;

/// Displays the current user status [type] as an icon.
class NeonUserStatusIcon extends StatelessWidget {
  /// Creates a new user status icon.
  const NeonUserStatusIcon({
    required this.type,
    this.size,
    super.key,
  });

  /// The type of the user status.
  final user_status.$Type type;

  /// The size of the icon.
  final double? size;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      user_status.$Type.online => Icon(
          size: size,
          Icons.circle,
          color: NcColors.success,
        ),
      user_status.$Type.dnd => Icon(
          size: size,
          MdiIcons.minusCircle,
          color: NcColors.error,
        ),
      user_status.$Type.away => Transform.rotate(
          angle: _minus45Rad,
          child: Icon(
            size: size,
            MdiIcons.moonWaningCrescent,
            color: NcColors.warning,
          ),
        ),
      user_status.$Type.invisible => Icon(
          size: size,
          Icons.circle_outlined,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      user_status.$Type.offline || user_status.$Type.busy => const SizedBox.shrink(),
      _ => throw UnimplementedError(type.value),
    };
  }
}

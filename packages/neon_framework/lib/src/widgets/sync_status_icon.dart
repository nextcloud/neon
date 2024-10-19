import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/sync/models/mapping.dart';
import 'package:neon_framework/src/theme/colors.dart';

class SyncStatusIcon extends StatelessWidget {
  const SyncStatusIcon({
    required this.status,
    this.size,
    super.key,
  });

  final SyncMappingStatus status;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final (icon, color, semanticLabel) = switch (status) {
      SyncMappingStatus.unknown => (
          MdiIcons.cloudQuestion,
          NcColors.error,
          NeonLocalizations.of(context).syncOptionsStatusUnknown,
        ),
      SyncMappingStatus.incomplete => (
          MdiIcons.cloudSync,
          NcColors.warning,
          NeonLocalizations.of(context).syncOptionsStatusIncomplete,
        ),
      SyncMappingStatus.complete => (
          MdiIcons.cloudCheck,
          NcColors.success,
          NeonLocalizations.of(context).syncOptionsStatusComplete,
        ),
    };

    return Icon(
      icon,
      color: color,
      size: size,
      semanticLabel: semanticLabel,
    );
  }
}

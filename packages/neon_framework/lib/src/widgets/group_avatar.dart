// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:neon_framework/src/theme/sizes.dart';

class NeonGroupAvatar extends StatelessWidget {
  const NeonGroupAvatar({
    this.icon = Icons.group,
    this.backgroundColor,
    this.foregroundColor,
    this.size = smallIconSize,
    super.key,
  });

  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double size;

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: size,
        backgroundColor: backgroundColor,
        child: Icon(
          icon,
          color: foregroundColor,
          size: size,
        ),
      );
}

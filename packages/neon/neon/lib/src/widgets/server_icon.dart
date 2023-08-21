import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class NeonServerIcon extends StatelessWidget {
  const NeonServerIcon({
    required this.icon,
    this.color,
    super.key,
  });

  final String icon;
  final Color? color;

  @override
  Widget build(final BuildContext context) => VectorGraphic(
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        loader: AssetBytesLoader(
          'assets/icons/server/${icon.replaceFirst(RegExp('^icon-'), '').replaceFirst(RegExp(r'-(dark|white)$'), '')}.svg.vec',
          packageName: 'neon',
        ),
      );
}

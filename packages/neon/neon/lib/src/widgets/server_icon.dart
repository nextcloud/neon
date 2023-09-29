import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// Nextcloud server icon.
///
/// Draws an icon from the Nextcloud server icon set.
class NeonServerIcon extends StatelessWidget {
  /// Creates a new server icon
  const NeonServerIcon({
    required this.icon,
    this.color,
    this.size,
    super.key,
  });

  /// Name of the server icon to draw.
  final String icon;

  /// The color to use when drawing the icon.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.color].
  ///
  /// The color (whether specified explicitly here or obtained from the
  /// [IconTheme]) will be further adjusted by the nearest [IconTheme]'s
  /// [IconThemeData.opacity].
  ///
  /// {@tool snippet}
  /// Typically, a Material Design color will be used, as follows:
  ///
  /// ```dart
  /// NeonServerIcon(
  ///   icon: 'icon-add',
  ///   color: Colors.blue.shade400,
  /// )
  /// ```
  /// {@end-tool}
  final Color? color;

  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  ///
  /// Defaults to the nearest [IconTheme]'s [IconThemeData.size].
  ///
  /// If this [NeonServerIcon] is being placed inside an [IconButton], then use
  /// [IconButton.iconSize] instead, so that the [IconButton] can make the splash
  /// area the appropriate size as well. The [IconButton] uses an [IconTheme] to
  /// pass down the size to the [NeonServerIcon].
  final double? size;

  @override
  Widget build(final BuildContext context) {
    final iconTheme = Theme.of(context).iconTheme;

    final size = this.size ?? iconTheme.size;
    final color = this.color ?? iconTheme.color;

    return VectorGraphic(
      width: size,
      height: size,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      loader: AssetBytesLoader(
        'assets/icons/server/${icon.replaceFirst(RegExp('^icon-'), '').replaceFirst(RegExp(r'-(dark|white)$'), '')}.svg.vec',
        packageName: 'neon',
      ),
    );
  }
}

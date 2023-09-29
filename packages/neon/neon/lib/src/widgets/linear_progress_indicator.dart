import 'package:flutter/material.dart';

class NeonLinearProgressIndicator extends StatelessWidget {
  const NeonLinearProgressIndicator({
    this.visible = true,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    this.color,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  final bool visible;
  final EdgeInsets? margin;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) => Container(
        margin: margin,
        constraints: BoxConstraints.loose(const Size.fromHeight(3)),
        child: visible
            ? LinearProgressIndicator(
                color: color,
                backgroundColor: backgroundColor,
              )
            : null,
      );
}

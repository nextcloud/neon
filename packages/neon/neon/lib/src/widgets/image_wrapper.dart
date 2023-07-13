import 'package:flutter/material.dart';

class NeonImageWrapper extends StatelessWidget {
  const NeonImageWrapper({
    required this.child,
    this.color = Colors.white,
    this.size,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final Color color;
  final Size? size;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: borderRadius,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.dstATop),
          child: SizedBox.fromSize(
            size: size,
            child: ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      );
}

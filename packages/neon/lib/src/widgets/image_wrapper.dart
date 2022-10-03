part of '../neon.dart';

class ImageWrapper extends StatelessWidget {
  const ImageWrapper({
    required this.child,
    required this.color,
    this.width,
    this.height,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final Color color;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: ColoredBox(
            color: color,
            child: Center(
              child: child,
            ),
          ),
        ),
      );
}

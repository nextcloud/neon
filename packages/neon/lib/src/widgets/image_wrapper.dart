part of '../neon.dart';

class ImageWrapper extends StatelessWidget {
  const ImageWrapper({
    required this.child,
    required this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius?.add(const BorderRadius.all(Radius.circular(1))),
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.zero,
              child: child,
            ),
          ),
        ),
      );
}

part of '../../neon.dart';

class NeonImageWrapper extends StatelessWidget {
  const NeonImageWrapper({
    required this.child,
    required this.color,
    this.size,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final Color color;
  final Size? size;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) => SizedBox.fromSize(
        size: size,
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

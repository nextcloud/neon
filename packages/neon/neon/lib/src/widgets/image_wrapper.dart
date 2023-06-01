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
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
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

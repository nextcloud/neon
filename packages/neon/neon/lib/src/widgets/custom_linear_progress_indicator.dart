part of '../../neon.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
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
        child: SizedBox(
          height: 3,
          child: visible
              ? LinearProgressIndicator(
                  color: color,
                  backgroundColor: backgroundColor,
                )
              : null,
        ),
      );
}

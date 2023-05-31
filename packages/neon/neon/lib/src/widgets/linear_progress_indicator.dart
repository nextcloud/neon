part of '../../neon.dart';

class NeonLinearProgressIndicator extends StatelessWidget {
  const NeonLinearProgressIndicator({
    this.visible = true,
    this.alwaysThere = true,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    this.color,
    this.backgroundColor = Colors.transparent,
    super.key,
  });

  final bool visible;
  final bool alwaysThere;
  final EdgeInsets? margin;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) => !alwaysThere && !visible
      ? Container()
      : Container(
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

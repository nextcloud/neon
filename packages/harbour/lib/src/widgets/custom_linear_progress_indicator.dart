part of '../harbour.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    required this.visible,
    this.margin = const EdgeInsets.symmetric(horizontal: 10),
    super.key,
  });

  final bool visible;
  final EdgeInsets? margin;

  @override
  Widget build(final BuildContext context) => Container(
        margin: margin,
        child: SizedBox(
          height: 3,
          child: visible ? const LinearProgressIndicator() : null,
        ),
      );
}

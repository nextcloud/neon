part of '../harbour.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    this.title,
    this.children,
    super.key,
  });

  final Widget? title;
  final List<Widget>? children;

  @override
  Widget build(final BuildContext context) => SimpleDialog(
        titlePadding: const EdgeInsets.all(10),
        contentPadding: const EdgeInsets.all(10),
        title: title,
        children: children,
      );
}

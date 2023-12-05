import 'package:flutter/material.dart';

/// A Neon material design dialog based on [SimpleDialog].
class NeonDialog extends StatelessWidget {
  /// Creates a Neon dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const NeonDialog({
    this.title,
    this.children,
    super.key,
  });

  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The (optional) content of the dialog is displayed in a
  /// [SingleChildScrollView] underneath the title.
  ///
  /// Typically a list of [SimpleDialogOption]s.
  final List<Widget>? children;

  @override
  Widget build(final BuildContext context) => SimpleDialog(
        titlePadding: const EdgeInsets.all(10),
        contentPadding: const EdgeInsets.all(10),
        title: title,
        children: children,
      );
}

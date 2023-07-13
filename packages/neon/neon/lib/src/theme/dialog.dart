import 'package:flutter/material.dart';
import 'package:neon/src/theme/neon.dart';
import 'package:neon/src/widgets/dialog.dart';

/// Defines a theme for [NeonDialog] widgets.
///
/// Descendant widgets obtain the current [NeonDialogTheme] object using
/// `NeonDialogTheme.of(context)`. Instances of [NeonDialogTheme] can be customized with
/// [NeonDialogTheme.copyWith].
@immutable
class NeonDialogTheme {
  /// Creates a dialog theme that can be used for [NeonTheme.dialogTheme].
  const NeonDialogTheme({
    this.constraints = const BoxConstraints(
      minWidth: 280,
      maxWidth: 560,
    ),
  });

  /// Used to configure the [BoxConstraints] for the [NeonDialog] widget.
  ///
  /// This value should also be used on [Dialog.fullscreen] and other similar pages.
  /// By default it follows the default [m3 dialog specification](https://m3.material.io/components/dialogs/specs).
  final BoxConstraints constraints;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  NeonDialogTheme copyWith({
    final BoxConstraints? constraints,
  }) =>
      NeonDialogTheme(
        constraints: constraints ?? this.constraints,
      );

  /// The data from the closest [NeonDialogTheme] instance given the build context.
  static NeonDialogTheme of(final BuildContext context) => Theme.of(context).extension<NeonTheme>()!.dialogTheme;

  /// Linearly interpolate between two [NeonDialogTheme]s.
  ///
  /// {@macro dart.ui.shadow.lerp}
  // ignore: prefer_constructors_over_static_methods
  static NeonDialogTheme lerp(final NeonDialogTheme a, final NeonDialogTheme b, final double t) {
    if (identical(a, b)) {
      return a;
    }
    return NeonDialogTheme(
      constraints: BoxConstraints.lerp(a.constraints, b.constraints, t)!,
    );
  }

  @override
  int get hashCode => constraints.hashCode;

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is NeonDialogTheme && other.constraints == constraints;
  }
}

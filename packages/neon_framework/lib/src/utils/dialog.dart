import 'package:flutter/material.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/widgets/dialog.dart';

/// Displays a simple [NeonConfirmationDialog] with the given [title].
///
/// Returns a future whether the action has been accepted.
Future<bool> showConfirmationDialog({
  required final BuildContext context,
  required final String title,
}) async =>
    await showAdaptiveDialog<bool>(
      context: context,
      builder: (final context) => NeonConfirmationDialog(title: title),
    ) ??
    false;

/// Displays a [NeonRenameDialog] with the given [title] and [initialValue].
///
/// Returns a future with the new name of name.
Future<String?> showRenameDialog({
  required final BuildContext context,
  required final String title,
  required final String initialValue,
}) async =>
    showAdaptiveDialog<String?>(
      context: context,
      builder: (final context) => NeonRenameDialog(
        title: title,
        value: initialValue,
      ),
    );

/// Displays a [NeonErrorDialog] with the given [message].
Future<void> showErrorDialog({
  required final BuildContext context,
  required final String message,
  final String? title,
}) =>
    showAdaptiveDialog<void>(
      context: context,
      builder: (final context) => NeonErrorDialog(content: message),
    );

/// Displays a [NeonDialog] with the given [title] informing the user that a
/// feature is not implemented yet.
Future<void> showUnimplementedDialog({
  required final BuildContext context,
  required final String title,
}) =>
    showAdaptiveDialog<void>(
      context: context,
      builder: (final context) => NeonDialog(
        automaticallyShowCancel: false,
        title: Text(title),
        actions: [
          NeonDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              NeonLocalizations.of(context).actionClose,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );

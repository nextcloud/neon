import 'package:flutter/material.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/theme/colors.dart';

/// Shows a dialog asking the user to confirm the question posed in the [title].
Future<bool> showConfirmationDialog(final BuildContext context, final String title) async =>
    await showDialog<bool>(
      context: context,
      builder: (final context) => AlertDialog(
        title: Text(title),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: NcColors.decline,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(NeonLocalizations.of(context).actionNo),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: NcColors.accept,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(NeonLocalizations.of(context).actionYes),
          ),
        ],
      ),
    ) ??
    false;

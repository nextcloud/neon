part of '../neon.dart';

Future<bool> showConfirmationDialog(final BuildContext context, final String title) async =>
    await showDialog<bool>(
      context: context,
      builder: (final context) => AlertDialog(
        title: Text(title),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(AppLocalizations.of(context).no),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(AppLocalizations.of(context).yes),
          ),
        ],
      ),
    ) ??
    false;

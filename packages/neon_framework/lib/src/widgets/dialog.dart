// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/widgets/account_tile.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';

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

class NeonConfirmationDialog extends StatelessWidget {
  const NeonConfirmationDialog({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(final BuildContext context) {
    final confirm = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: NcColors.accept,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
      child: Text(NeonLocalizations.of(context).actionYes),
    );

    final decline = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: NcColors.decline,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      onPressed: () {
        Navigator.of(context).pop(false);
      },
      child: Text(NeonLocalizations.of(context).actionNo),
    );

    return AlertDialog(
      title: Text(title),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        decline,
        confirm,
      ],
    );
  }
}

class RenameDialog extends StatefulWidget {
  const RenameDialog({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  State<RenameDialog> createState() => _RenameDialogState();
}

class _RenameDialogState extends State<RenameDialog> {
  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(controller.text);
    }
  }

  @override
  Widget build(final BuildContext context) => NeonDialog(
        title: Text(widget.title),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: controller,
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(widget.title),
                ),
              ],
            ),
          ),
        ],
      );
}

@internal
class NeonAccountSelectionDialog extends StatelessWidget {
  const NeonAccountSelectionDialog({
    this.highlightActiveAccount = false,
    this.children,
    super.key,
  });

  final bool highlightActiveAccount;
  final List<Widget>? children;

  @override
  Widget build(final BuildContext context) {
    final dialogTheme = NeonDialogTheme.of(context);
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final accounts = accountsBloc.accounts.value;
    final activeAccount = accountsBloc.activeAccount.value!;

    final sortedAccounts = List.of(accounts)
      ..removeWhere((final account) => account.id == activeAccount.id)
      ..insert(0, activeAccount);

    final tiles = sortedAccounts
        .map<Widget>(
          (final account) => NeonAccountTile(
            account: account,
            trailing: highlightActiveAccount && account.id == activeAccount.id ? const Icon(Icons.check_circle) : null,
            onTap: () {
              Navigator.of(context).pop(account);
            },
          ),
        )
        .toList();
    if (highlightActiveAccount && accounts.length > 1) {
      tiles.insert(1, const Divider());
    }

    final body = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...tiles,
          ...?children,
        ],
      ),
    );

    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(24),
          constraints: dialogTheme.constraints,
          child: body,
        ),
      ),
    );
  }
}

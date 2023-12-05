import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/account_tile.dart';

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
          constraints: NeonDialogTheme.of(context).constraints,
          child: body,
        ),
      ),
    );
  }
}

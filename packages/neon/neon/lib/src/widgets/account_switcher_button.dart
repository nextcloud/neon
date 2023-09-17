import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/pages/settings.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/account_selection_dialog.dart';
import 'package:neon/src/widgets/user_avatar.dart';

@internal
class AccountSwitcherButton extends StatelessWidget {
  const AccountSwitcherButton({
    super.key,
  });

  Future<void> _onPressed(final BuildContext context) async {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);

    final account = await showDialog<Account>(
      context: context,
      builder: (final context) => NeonAccountSelectionDialog(
        highlightActiveAccount: true,
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(AppLocalizations.of(context).settingsAccountManage),
            onTap: () {
              Navigator.of(context).pop();
              const SettingsRoute(initialCategory: SettingsCategories.accounts).push(context);
            },
          ),
        ],
      ),
    );

    if (account != null) {
      accountsBloc.setActiveAccount(account);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final account = accountsBloc.activeAccount.value!;

    return IconButton(
      onPressed: () async => _onPressed(context),
      tooltip: AppLocalizations.of(context).settingsAccount,
      icon: NeonUserAvatar(
        account: account,
      ),
    );
  }
}

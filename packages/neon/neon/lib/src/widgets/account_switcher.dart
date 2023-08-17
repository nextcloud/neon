import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/pages/settings.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/widgets/account_tile.dart';
import 'package:neon/src/widgets/user_avatar.dart';
import 'package:provider/provider.dart';

@internal
class AccountSwitcherButton extends StatelessWidget {
  const AccountSwitcherButton({
    super.key,
  });

  Future<void> _onPressed(final BuildContext context) async {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final accounts = accountsBloc.accounts.value;
    final aa = accountsBloc.activeAccount.value!;

    await showDialog(
      context: context,
      builder: (final context) {
        final body = Column(
          children: [
            NeonAccountTile(
              account: aa,
              trailing: const Icon(Icons.check_circle),
              onTap: Navigator.of(context).pop,
            ),
            const Divider(),
            if (accounts.length > 1)
              Builder(
                builder: (final context) {
                  final inactiveAccounts = List.of(accounts)..removeWhere((final account) => (account.id == aa.id));
                  final tiles = inactiveAccounts.map(
                    (final account) => NeonAccountTile(
                      account: account,
                      onTap: () {
                        accountsBloc.setActiveAccount(account);
                        Navigator.of(context).pop();
                      },
                    ),
                  );

                  return SingleChildScrollView(
                    child: ListBody(
                      children: tiles.toList(),
                    ),
                  );
                },
              ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(AppLocalizations.of(context).settingsAccountManage),
              onTap: () {
                Navigator.of(context).pop();
                const SettingsRoute(initialCategory: SettingsCageories.accounts).push(context);
              },
            ),
          ],
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
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
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

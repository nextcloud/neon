import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/adaptive_widgets/list_tile.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';

@internal
class AccountSwitcherButton extends StatelessWidget {
  const AccountSwitcherButton({
    super.key,
  });

  Future<void> _onPressed(BuildContext context) async {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);

    final account = await showDialog<Account>(
      context: context,
      builder: (context) => NeonAccountSelectionDialog(
        highlightActiveAccount: true,
        children: [
          AdaptiveListTile(
            leading: Icon(AdaptiveIcons.settings),
            title: Text(NeonLocalizations.of(context).settings),
            onTap: () {
              Navigator.of(context).pop();
              const SettingsRoute().push<void>(context);
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
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async => _onPressed(context),
      tooltip: NeonLocalizations.of(context).settingsAccount,
      padding: const EdgeInsets.all(8),
      icon: NeonUserAvatar(
        account: NeonProvider.of<Account>(context),
        userStatusBloc: NeonProvider.of<UserStatusBloc>(context),
      ),
    );
  }
}

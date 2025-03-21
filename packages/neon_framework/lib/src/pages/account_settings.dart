import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon_framework/src/settings/widgets/option_settings_tile.dart';
import 'package:neon_framework/src/settings/widgets/settings_category.dart';
import 'package:neon_framework/src/settings/widgets/settings_list.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/utils.dart';
import 'package:provider/provider.dart';

/// Account settings page.
///
/// Displays settings for an [Account]. Settings are specified as `Option`s.
@internal
class AccountSettingsPage extends StatelessWidget {
  /// Creates a new account settings page for the given [account].
  const AccountSettingsPage({
    required this.account,
    super.key,
  });

  /// The account to display the settings for.
  final Account account;

  @override
  Widget build(BuildContext context) {
    final bloc = NeonProvider.of<AccountsBloc>(context);
    final options = bloc.getOptionsFor(account);
    final userDetailsBloc = bloc.getUserDetailsBlocFor(account);
    final name = account.humanReadableID;

    final appBar = AppBar(
      title: Text(name),
      actions: [
        IconButton(
          onPressed: () async {
            final decision = await showAdaptiveDialog<AccountDeletion>(
              context: context,
              builder: (context) => NeonAccountDeletionDialog(
                account: account,
                capabilitiesBloc: bloc.getCapabilitiesBlocFor(account),
              ),
            );

            switch (decision) {
              case null:
                break;
              case AccountDeletion.remote:
                if (context.mounted) {
                  await launchUrl(NeonProvider.of<Account>(context), '/index.php/settings/user/drop_account');
                }
              case AccountDeletion.local:
                final isActive = bloc.activeAccount.valueOrNull == account;

                options.reset();
                bloc.removeAccount(account);

                if (!context.mounted) {
                  return;
                }

                if (isActive) {
                  const HomeRoute().go(context);
                } else {
                  Navigator.of(context).pop();
                }
            }
          },
          tooltip: NeonLocalizations.of(context).accountOptionsRemove,
          icon: const Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () async {
            final content =
                '${NeonLocalizations.of(context).settingsResetForConfirmation(name)} ${NeonLocalizations.of(context).settingsResetForExplanation}';
            final decision = await showAdaptiveDialog<bool>(
              context: context,
              builder: (context) => NeonConfirmationDialog(
                icon: const Icon(Icons.restart_alt),
                title: NeonLocalizations.of(context).settingsReset,
                content: Text(content),
              ),
            );

            if (decision ?? false) {
              options.reset();
            }
          },
          tooltip: NeonLocalizations.of(context).settingsResetFor(name),
          icon: const Icon(MdiIcons.cogRefresh),
        ),
      ],
    );

    final body = SettingsList(
      categories: [
        SettingsCategory(
          title: Text(NeonLocalizations.of(context).accountOptionsCategoryStorageInfo),
          tiles: [
            ResultBuilder.behaviorSubject(
              subject: userDetailsBloc.userDetails,
              builder: (context, userDetails) {
                if (userDetails.hasError) {
                  return NeonError(
                    userDetails.error ?? 'Something went wrong',
                    type: NeonErrorType.listTile,
                    onRetry: userDetailsBloc.refresh,
                  );
                }

                double? value;
                Widget? subtitle;
                if (userDetails.hasData) {
                  final quotaRelative = userDetails.data?.quota.relative ?? 0;
                  final quotaTotal = userDetails.data?.quota.total ?? 0;
                  final quotaUsed = userDetails.data?.quota.used ?? 0;

                  value = quotaRelative / 100;
                  subtitle = Text(
                    NeonLocalizations.of(context).accountOptionsQuotaUsedOf(
                      filesize(quotaUsed, 1),
                      filesize(quotaTotal, 1),
                      quotaRelative.toString(),
                    ),
                  );
                }

                return CustomSettingsTile(
                  title: LinearProgressIndicator(
                    value: value,
                    minHeight: isCupertino(context) ? 15 : null,
                    borderRadius: BorderRadius.circular(isCupertino(context) ? 5 : 3),
                    backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  ),
                  subtitle: subtitle,
                );
              },
            ),
          ],
        ),
        SettingsCategory(
          title: Text(NeonLocalizations.of(context).optionsCategoryGeneral),
          tiles: [
            SelectSettingsTile(
              option: options.initialApp,
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: NeonDialogTheme.of(context).constraints,
            child: Provider<Account>.value(
              value: account,
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon/src/settings/widgets/select_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:neon/src/settings/widgets/settings_list.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/confirmation_dialog.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;

/// Account settings page.
///
/// Displays settings for an [Account]. Settings are specified as `Option`s.
@internal
class AccountSettingsPage extends StatelessWidget {
  /// Creates a new account settings page for the given [account].
  const AccountSettingsPage({
    required this.bloc,
    required this.account,
    super.key,
  });

  /// The bloc managing the accounts and their settings.
  final AccountsBloc bloc;

  /// The account to display the settings for.
  final Account account;

  @override
  Widget build(final BuildContext context) {
    final options = bloc.getOptionsFor(account);
    final userDetailsBloc = bloc.getUserDetailsBlocFor(account);
    final name = account.humanReadableID;

    final appBar = AppBar(
      title: Text(name),
      actions: [
        IconButton(
          onPressed: () async {
            if (await showConfirmationDialog(
              context,
              NeonLocalizations.of(context).accountOptionsRemoveConfirm(account.humanReadableID),
            )) {
              final isActive = bloc.activeAccount.valueOrNull == account;

              bloc.removeAccount(account);

              // ignore: use_build_context_synchronously
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
            if (await showConfirmationDialog(
              context,
              NeonLocalizations.of(context).settingsResetForConfirmation(name),
            )) {
              options.reset();
            }
          },
          tooltip: NeonLocalizations.of(context).settingsResetFor(name),
          icon: const Icon(MdiIcons.cogRefresh),
        ),
      ],
    );

    final body = ResultBuilder<provisioning_api.UserDetails>.behaviorSubject(
      subject: userDetailsBloc.userDetails,
      builder: (final context, final userDetails) {
        final quotaRelative = userDetails.data?.quota.relative?.$int ?? userDetails.data?.quota.relative?.$double ?? 0;
        final quotaTotal = userDetails.data?.quota.total?.$int ?? userDetails.data?.quota.total?.$double ?? 0;
        final quotaUsed = userDetails.data?.quota.used?.$int ?? userDetails.data?.quota.used?.$double ?? 0;

        return SettingsList(
          categories: [
            SettingsCategory(
              title: Text(NeonLocalizations.of(context).accountOptionsCategoryStorageInfo),
              tiles: [
                CustomSettingsTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (userDetails.hasData) ...[
                        LinearProgressIndicator(
                          value: quotaRelative / 100,
                          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          NeonLocalizations.of(context).accountOptionsQuotaUsedOf(
                            filesize(quotaUsed, 1),
                            filesize(quotaTotal, 1),
                            quotaRelative.toString(),
                          ),
                        ),
                      ],
                      NeonError(
                        userDetails.error,
                        onRetry: userDetailsBloc.refresh,
                      ),
                      NeonLinearProgressIndicator(
                        visible: userDetails.isLoading,
                      ),
                    ],
                  ),
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
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Center(
        child: ConstrainedBox(
          constraints: NeonDialogTheme.of(context).constraints,
          child: body,
        ),
      ),
    );
  }
}

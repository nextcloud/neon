import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon/src/settings/widgets/dropdown_button_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:neon/src/settings/widgets/settings_list.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/confirmation_dialog.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/nextcloud.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({
    required this.bloc,
    required this.account,
    super.key,
  });

  final AccountsBloc bloc;
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
              AppLocalizations.of(context).accountOptionsRemoveConfirm(account.humanReadableID),
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
          tooltip: AppLocalizations.of(context).accountOptionsRemove,
          icon: const Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () async {
            if (await showConfirmationDialog(
              context,
              AppLocalizations.of(context).settingsResetForConfirmation(name),
            )) {
              options.reset();
            }
          },
          tooltip: AppLocalizations.of(context).settingsResetFor(name),
          icon: const Icon(MdiIcons.cogRefresh),
        ),
      ],
    );

    final body = ResultBuilder<ProvisioningApiUserDetails>.behaviorSubject(
      stream: userDetailsBloc.userDetails,
      builder: (final context, final userDetails) => SettingsList(
        categories: [
          SettingsCategory(
            title: Text(AppLocalizations.of(context).accountOptionsCategoryStorageInfo),
            tiles: [
              CustomSettingsTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userDetails.hasData) ...[
                      LinearProgressIndicator(
                        value: (userDetails.requireData.quota.relative ?? 0) / 100,
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context).accountOptionsQuotaUsedOf(
                          filesize(userDetails.requireData.quota.used ?? 0, 1),
                          filesize(userDetails.requireData.quota.total ?? 0, 1),
                          (userDetails.requireData.quota.relative ?? 0).toString(),
                        ),
                      ),
                    ],
                    NeonException(
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
            title: Text(AppLocalizations.of(context).optionsCategoryGeneral),
            tiles: [
              DropdownButtonSettingsTile(
                option: options.initialApp,
              ),
            ],
          ),
        ],
      ),
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

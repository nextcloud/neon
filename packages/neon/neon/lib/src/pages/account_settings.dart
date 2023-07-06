import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon/src/settings/widgets/dropdown_button_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:neon/src/settings/widgets/settings_list.dart';
import 'package:neon/src/utils/confirmation_dialog.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:nextcloud/nextcloud.dart';

class AccountSettingsPage extends StatelessWidget {
  AccountSettingsPage({
    required this.bloc,
    required this.account,
    super.key,
  });

  final AccountsBloc bloc;
  final Account account;

  late final _options = bloc.getOptionsFor(account);
  late final _userDetailsBloc = bloc.getUserDetailsBlocFor(account);
  late final _name = account.client.humanReadableID;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(_name),
          actions: [
            IconButton(
              onPressed: () async {
                if (await showConfirmationDialog(
                  context,
                  AppLocalizations.of(context).accountOptionsRemoveConfirm(account.client.humanReadableID),
                )) {
                  bloc.removeAccount(account);
                }
              },
              tooltip: AppLocalizations.of(context).accountOptionsRemove,
              icon: Icon(MdiIcons.delete),
            ),
            IconButton(
              onPressed: () async {
                if (await showConfirmationDialog(
                  context,
                  AppLocalizations.of(context).settingsResetForConfirmation(_name),
                )) {
                  await _options.reset();
                }
              },
              tooltip: AppLocalizations.of(context).settingsResetFor(_name),
              icon: Icon(MdiIcons.cogRefresh),
            ),
          ],
        ),
        body: ResultBuilder<ProvisioningApiUserDetails>.behaviorSubject(
          stream: _userDetailsBloc.userDetails,
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
                            value: userDetails.requireData.quota.relative / 100,
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context).accountOptionsQuotaUsedOf(
                              filesize(userDetails.requireData.quota.used, 1),
                              filesize(userDetails.requireData.quota.total, 1),
                              userDetails.requireData.quota.relative.toString(),
                            ),
                          ),
                        ],
                        NeonException(
                          userDetails.error,
                          onRetry: _userDetailsBloc.refresh,
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
                    option: _options.initialApp,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

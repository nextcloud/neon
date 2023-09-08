import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/router.dart';
import 'package:neon/src/settings/utils/settings_export_helper.dart';
import 'package:neon/src/settings/widgets/account_settings_tile.dart';
import 'package:neon/src/settings/widgets/checkbox_settings_tile.dart';
import 'package:neon/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon/src/settings/widgets/dropdown_button_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:neon/src/settings/widgets/settings_list.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';
import 'package:neon/src/settings/widgets/text_settings_tile.dart';
import 'package:neon/src/theme/branding.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/confirmation_dialog.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/save_file.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum SettingsCategories {
  apps,
  theme,
  navigation,
  pushNotifications,
  startup,
  systemTray,
  accounts,
  other,
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    this.initialCategory,
    super.key,
  });

  final SettingsCategories? initialCategory;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(final BuildContext context) {
    final globalOptions = Provider.of<GlobalOptions>(context);
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final appImplementations = Provider.of<Iterable<AppImplementation>>(context);
    final branding = Branding.of(context);

    final appBar = AppBar(
      title: Text(AppLocalizations.of(context).settings),
      actions: [
        IconButton(
          onPressed: () async {
            if (await showConfirmationDialog(context, AppLocalizations.of(context).settingsResetAllConfirmation)) {
              globalOptions.reset();

              for (final appImplementation in appImplementations) {
                appImplementation.options.reset();
              }

              for (final account in accountsBloc.accounts.value) {
                accountsBloc.getOptionsFor(account).reset();
              }
            }
          },
          tooltip: AppLocalizations.of(context).settingsResetAll,
          icon: const Icon(MdiIcons.cogRefresh),
        ),
      ],
    );
    final body = StreamBuilder<List<Account>>(
      stream: accountsBloc.accounts,
      initialData: accountsBloc.accounts.valueOrNull,
      builder: (
        final context,
        final accountsSnapshot,
      ) =>
          ValueListenableBuilder<bool>(
        valueListenable: globalOptions.pushNotificationsEnabled,
        builder: (
          final context,
          final _,
          final __,
        ) =>
            SettingsList(
          initialCategory: widget.initialCategory?.name,
          categories: [
            SettingsCategory(
              title: Text(AppLocalizations.of(context).settingsApps),
              key: ValueKey(SettingsCategories.apps.name),
              tiles: <SettingsTile>[
                for (final appImplementation in appImplementations) ...[
                  if (appImplementation.options.options.isNotEmpty) ...[
                    CustomSettingsTile(
                      leading: appImplementation.buildIcon(),
                      title: Text(appImplementation.name(context)),
                      onTap: () {
                        NextcloudAppSettingsRoute(appid: appImplementation.id).go(context);
                      },
                    ),
                  ],
                ],
              ],
            ),
            SettingsCategory(
              title: Text(AppLocalizations.of(context).optionsCategoryTheme),
              key: ValueKey(SettingsCategories.theme.name),
              tiles: [
                DropdownButtonSettingsTile(
                  option: globalOptions.themeMode,
                ),
                CheckBoxSettingsTile(
                  option: globalOptions.themeOLEDAsDark,
                ),
                CheckBoxSettingsTile(
                  option: globalOptions.themeKeepOriginalAccentColor,
                ),
              ],
            ),
            SettingsCategory(
              title: Text(AppLocalizations.of(context).optionsCategoryNavigation),
              key: ValueKey(SettingsCategories.navigation.name),
              tiles: [
                DropdownButtonSettingsTile(
                  option: globalOptions.navigationMode,
                ),
              ],
            ),
            if (NeonPlatform.instance.canUsePushNotifications) ...[
              SettingsCategory(
                title: Text(AppLocalizations.of(context).optionsCategoryPushNotifications),
                key: ValueKey(SettingsCategories.pushNotifications.name),
                tiles: [
                  if (!globalOptions.pushNotificationsEnabled.enabled) ...[
                    TextSettingsTile(
                      text: AppLocalizations.of(context).globalOptionsPushNotificationsEnabledDisabledNotice,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                  CheckBoxSettingsTile(
                    option: globalOptions.pushNotificationsEnabled,
                  ),
                  DropdownButtonSettingsTile(
                    option: globalOptions.pushNotificationsDistributor,
                  ),
                ],
              ),
            ],
            if (NeonPlatform.instance.canUseWindowManager) ...[
              SettingsCategory(
                title: Text(AppLocalizations.of(context).optionsCategoryStartup),
                key: ValueKey(SettingsCategories.startup.name),
                tiles: [
                  CheckBoxSettingsTile(
                    option: globalOptions.startupMinimized,
                  ),
                  CheckBoxSettingsTile(
                    option: globalOptions.startupMinimizeInsteadOfExit,
                  ),
                ],
              ),
            ],
            if (NeonPlatform.instance.canUseWindowManager && NeonPlatform.instance.canUseSystemTray) ...[
              SettingsCategory(
                title: Text(AppLocalizations.of(context).optionsCategorySystemTray),
                key: ValueKey(SettingsCategories.systemTray.name),
                tiles: [
                  CheckBoxSettingsTile(
                    option: globalOptions.systemTrayEnabled,
                  ),
                  CheckBoxSettingsTile(
                    option: globalOptions.systemTrayHideToTrayWhenMinimized,
                  ),
                ],
              ),
            ],
            SettingsCategory(
              title: Text(AppLocalizations.of(context).optionsCategoryAccounts),
              key: ValueKey(SettingsCategories.accounts.name),
              tiles: [
                if (accountsSnapshot.requireData.length > 1) ...[
                  CheckBoxSettingsTile(
                    option: globalOptions.rememberLastUsedAccount,
                  ),
                  DropdownButtonSettingsTile(
                    option: globalOptions.initialAccount,
                  ),
                ],
                for (final account in accountsSnapshot.requireData) ...[
                  AccountSettingsTile(
                    account: account,
                    onTap: () {
                      AccountSettingsRoute(accountid: account.id).go(context);
                    },
                  ),
                ],
                CustomSettingsTile(
                  title: ElevatedButton.icon(
                    onPressed: () async => const LoginRoute().push(context),
                    icon: const Icon(MdiIcons.accountPlus),
                    label: Text(AppLocalizations.of(context).globalOptionsAccountsAdd),
                  ),
                ),
              ],
            ),
            SettingsCategory(
              title: Text(AppLocalizations.of(context).optionsCategoryOther),
              key: ValueKey(SettingsCategories.other.name),
              tiles: <SettingsTile>[
                if (branding.sourceCodeURL != null)
                  CustomSettingsTile(
                    leading: Icon(
                      Icons.code,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(AppLocalizations.of(context).sourceCode),
                    onTap: () async {
                      await launchUrlString(
                        branding.sourceCodeURL!,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                if (branding.issueTrackerURL != null)
                  CustomSettingsTile(
                    leading: Icon(
                      MdiIcons.textBoxEditOutline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(AppLocalizations.of(context).issueTracker),
                    onTap: () async {
                      await launchUrlString(
                        branding.issueTrackerURL!,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                  ),
                CustomSettingsTile(
                  leading: Icon(
                    MdiIcons.scriptText,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(AppLocalizations.of(context).licenses),
                  onTap: () async {
                    showLicensePage(
                      context: context,
                      applicationName: branding.name,
                      applicationIcon: branding.logo,
                      applicationLegalese: branding.legalese,
                      applicationVersion: Provider.of<PackageInfo>(context, listen: false).version,
                    );
                  },
                ),
                CustomSettingsTile(
                  leading: Icon(
                    MdiIcons.export,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(AppLocalizations.of(context).settingsExport),
                  onTap: () async {
                    final settingsExportHelper = _buildSettingsExportHelper(context);

                    try {
                      final fileName = 'nextcloud-neon-settings-${DateTime.now().millisecondsSinceEpoch ~/ 1000}.json';

                      final data = settingsExportHelper.exportToFile();
                      await saveFileWithPickDialog(fileName, data);
                    } catch (e, s) {
                      debugPrint(e.toString());
                      debugPrint(s.toString());
                      if (mounted) {
                        NeonException.showSnackbar(context, e);
                      }
                    }
                  },
                ),
                CustomSettingsTile(
                  leading: Icon(
                    MdiIcons.import,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(AppLocalizations.of(context).settingsImport),
                  onTap: () async {
                    final settingsExportHelper = _buildSettingsExportHelper(context);

                    try {
                      final result = await FilePicker.platform.pickFiles(
                        withReadStream: true,
                      );

                      if (result == null) {
                        return;
                      }

                      if (!result.files.single.path!.endsWith('.json')) {
                        if (mounted) {
                          NeonException.showSnackbar(
                            context,
                            AppLocalizations.of(context).settingsImportWrongFileExtension,
                          );
                        }
                        return;
                      }

                      await settingsExportHelper.applyFromFile(result.files.single.readStream);
                    } catch (e, s) {
                      debugPrint(e.toString());
                      debugPrint(s.toString());
                      if (mounted) {
                        NeonException.showSnackbar(context, e);
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
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

  SettingsExportHelper _buildSettingsExportHelper(final BuildContext context) {
    final globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final appImplementations = Provider.of<Iterable<AppImplementation>>(context, listen: false);

    return SettingsExportHelper(
      exportables: {
        globalOptions,
        AccountsBlocExporter(accountsBloc),
        AppImplementationsExporter(appImplementations),
      },
    );
  }
}

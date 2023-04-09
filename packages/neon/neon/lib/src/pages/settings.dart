part of '../../neon.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(final BuildContext context) {
    final globalOptions = Provider.of<GlobalOptions>(context);
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final appImplementations = Provider.of<List<AppImplementation>>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
        actions: [
          IconButton(
            onPressed: () async {
              // ignore: use_build_context_synchronously
              if (await showConfirmationDialog(context, AppLocalizations.of(context).settingsResetAllConfirmation)) {
                await globalOptions.reset();

                for (final appImplementation in appImplementations) {
                  await appImplementation.options.reset();
                }

                for (final account in accountsBloc.accounts.value) {
                  await accountsBloc.getOptions(account).reset();
                }
              }
            },
            icon: const Icon(MdiIcons.cogRefresh),
          ),
        ],
      ),
      body: StreamBuilder<List<Account>>(
        stream: accountsBloc.accounts,
        builder: (
          final context,
          final accountsSnapshot,
        ) {
          final settingsExportHelper = SettingsExportHelper(
            globalOptions: globalOptions,
            appImplementations: appImplementations,
            accountSpecificOptions: {
              if (accountsSnapshot.hasData) ...{
                for (final account in accountsSnapshot.data!) ...{
                  account: accountsBloc.getOptions(account).options,
                },
              },
            },
          );
          final platform = Provider.of<NeonPlatform>(context, listen: false);
          return StreamBuilder<Account?>(
            stream: accountsBloc.activeAccount,
            builder: (
              final context,
              final activeAccountSnapshot,
            ) =>
                StreamBuilder<bool>(
              stream: globalOptions.pushNotificationsEnabled.enabled,
              builder: (
                final context,
                final pushNotificationsEnabledEnabledSnapshot,
              ) =>
                  SettingsList(
                categories: [
                  SettingsCategory(
                    title: Text(AppLocalizations.of(context).settingsApps),
                    tiles: <SettingsTile>[
                      for (final appImplementation in appImplementations) ...[
                        if (appImplementation.options.options.isNotEmpty) ...[
                          CustomSettingsTile(
                            leading: appImplementation.buildIcon(context),
                            title: Text(appImplementation.name(context)),
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (final context) => NextcloudAppSettingsPage(
                                    appImplementation: appImplementation,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ],
                    ],
                  ),
                  SettingsCategory(
                    title: Text(AppLocalizations.of(context).optionsCategoryTheme),
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
                    tiles: [
                      DropdownButtonSettingsTile(
                        option: globalOptions.navigationMode,
                      ),
                    ],
                  ),
                  if (platform.canUsePushNotifications) ...[
                    SettingsCategory(
                      title: Text(AppLocalizations.of(context).optionsCategoryPushNotifications),
                      tiles: [
                        if (pushNotificationsEnabledEnabledSnapshot.data != null &&
                            !pushNotificationsEnabledEnabledSnapshot.data!) ...[
                          TextSettingsTile(
                            text: AppLocalizations.of(context).globalOptionsPushNotificationsEnabledDisabledNotice,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.red,
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
                  if (platform.canUseWindowManager) ...[
                    SettingsCategory(
                      title: Text(AppLocalizations.of(context).optionsCategoryStartup),
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
                  if (platform.canUseWindowManager && platform.canUseSystemTray) ...[
                    SettingsCategory(
                      title: Text(AppLocalizations.of(context).optionsCategorySystemTray),
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
                  if (accountsSnapshot.hasData) ...[
                    SettingsCategory(
                      title: Text(AppLocalizations.of(context).optionsCategoryAccounts),
                      tiles: [
                        if (accountsSnapshot.data!.length > 1) ...[
                          CheckBoxSettingsTile(
                            option: globalOptions.rememberLastUsedAccount,
                          ),
                          DropdownButtonSettingsTile(
                            option: globalOptions.initialAccount,
                          ),
                        ],
                        for (final account in accountsSnapshot.data!) ...[
                          AccountSettingsTile(
                            account: account,
                            onTap: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (final context) => AccountSettingsPage(
                                    bloc: accountsBloc,
                                    account: account,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                        CustomSettingsTile(
                          title: ElevatedButton.icon(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (final context) => const LoginPage(),
                                ),
                              );
                            },
                            icon: const Icon(MdiIcons.accountPlus),
                            label: Text(AppLocalizations.of(context).globalOptionsAccountsAdd),
                          ),
                        )
                      ],
                    ),
                  ],
                  SettingsCategory(
                    title: Text(AppLocalizations.of(context).optionsCategoryOther),
                    tiles: <SettingsTile>[
                      CustomSettingsTile(
                        leading: Icon(
                          MdiIcons.scriptText,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        title: Text(AppLocalizations.of(context).licenses),
                        onTap: () async {
                          showLicensePage(
                            context: context,
                            applicationName: AppLocalizations.of(context).appName,
                            applicationIcon: const NeonLogo(
                              withoutText: true,
                            ),
                            applicationLegalese: await rootBundle.loadString('assets/LEGALESE.txt'),
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
                          try {
                            final fileName =
                                'nextcloud-neon-settings-${DateTime.now().millisecondsSinceEpoch ~/ 1000}.json.base64';
                            final data = base64.encode(
                              utf8.encode(
                                json.encode(
                                  settingsExportHelper.toJsonExport(),
                                ),
                              ),
                            );
                            await saveFileWithPickDialog(fileName, Uint8List.fromList(utf8.encode(data)));
                          } catch (e, s) {
                            debugPrint(e.toString());
                            debugPrint(s.toString());
                            ExceptionWidget.showSnackbar(context, e);
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
                          try {
                            final result = await FilePicker.platform.pickFiles(
                              withData: true,
                            );

                            if (result == null) {
                              return;
                            }

                            if (!result.files.single.path!.endsWith('.json.base64')) {
                              if (mounted) {
                                ExceptionWidget.showSnackbar(
                                  context,
                                  AppLocalizations.of(context).settingsImportWrongFileExtension,
                                );
                              }
                              return;
                            }

                            final data =
                                json.decode(utf8.decode(base64.decode(utf8.decode(result.files.single.bytes!))));
                            await settingsExportHelper.applyFromJson(data as Map<String, dynamic>);
                          } catch (e, s) {
                            debugPrint(e.toString());
                            debugPrint(s.toString());
                            ExceptionWidget.showSnackbar(context, e);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum SettingsAccountAction {
  settings,
  delete,
}

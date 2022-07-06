part of '../../harbour.dart';

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
    final accountsBloc = RxBlocProvider.of<AccountsBloc>(context);
    final appImplementations = Provider.of<List<AppImplementation>>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: RxBlocBuilder<AccountsBloc, List<Account>>(
        bloc: accountsBloc,
        state: (final bloc) => bloc.accounts,
        builder: (
          final context,
          final accountsSnapshot,
          final _,
        ) {
          final settingsExportHelper = SettingsExportHelper(
            globalOptions: globalOptions,
            appImplementations: appImplementations,
            accountSpecificOptions: {
              if (accountsSnapshot.hasData) ...{
                for (final account in accountsSnapshot.data!) ...{
                  account: accountsBloc.getOptions(account)!.options,
                },
              },
            },
          );
          final platform = Provider.of<HarbourPlatform>(context, listen: false);
          return RxBlocBuilder<AccountsBloc, Account?>(
            bloc: accountsBloc,
            state: (final bloc) => bloc.activeAccount,
            builder: (
              final context,
              final activeAccountSnapshot,
              final _,
            ) =>
                OptionBuilder<bool>(
              option: globalOptions.rememberLastUsedAccount,
              builder: (final context, final rememberLastUsedAccount) => rememberLastUsedAccount == null
                  ? Container()
                  : OptionBuilder<String?>(
                      option: globalOptions.lastAccount,
                      builder: (final context, final lastAccount) => SettingsList(
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
                                          builder: (final context) => NextcloudAppSpecificSettingsPage(
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
                            ],
                          ),
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
                                ],
                                for (final account in accountsSnapshot.data!) ...[
                                  AccountSettingsTile(
                                    account: account,
                                    color: activeAccountSnapshot.data == account && accountsSnapshot.data!.length > 1
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).colorScheme.onBackground,
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        PopupMenuButton<_AccountAction>(
                                          itemBuilder: (final context) => [
                                            PopupMenuItem(
                                              value: _AccountAction.settings,
                                              child: Text(AppLocalizations.of(context).settings),
                                            ),
                                            PopupMenuItem(
                                              value: _AccountAction.delete,
                                              child: Text(AppLocalizations.of(context).delete),
                                            ),
                                          ],
                                          onSelected: (final action) async {
                                            switch (action) {
                                              case _AccountAction.settings:
                                                await Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (final context) => AccountSpecificSettingsPage(
                                                      bloc: accountsBloc,
                                                      account: account,
                                                    ),
                                                  ),
                                                );
                                                break;
                                              case _AccountAction.delete:
                                                if (await showConfirmationDialog(
                                                  context,
                                                  AppLocalizations.of(context).globalOptionsAccountsRemoveConfirm(
                                                    account.username,
                                                    account.serverURL,
                                                  ),
                                                )) {
                                                  accountsBloc.removeAccount(account);
                                                }
                                                break;
                                            }
                                          },
                                        ),
                                        if (accountsSnapshot.data!.length > 1) ...[
                                          Radio<String>(
                                            groupValue: lastAccount,
                                            value: account.id,
                                            onChanged: !rememberLastUsedAccount ? globalOptions.lastAccount.set : null,
                                          ),
                                        ],
                                      ],
                                    ),
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
                                    applicationIcon: const HarbourLogo(
                                      withoutText: true,
                                    ),
                                    applicationLegalese: await rootBundle.loadString('assets/LEGALESE.txt'),
                                    applicationVersion: (await PackageInfo.fromPlatform()).version,
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
                                        'nextcloud-harbour-settings-${DateTime.now().millisecondsSinceEpoch ~/ 1000}.json.base64';
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
                                    debugPrintStack(stackTrace: s);
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

                                    final data = json
                                        .decode(utf8.decode(base64.decode(utf8.decode(result.files.single.bytes!))));
                                    await settingsExportHelper.applyFromJson(data as Map<String, dynamic>);
                                  } catch (e, s) {
                                    debugPrint(e.toString());
                                    debugPrintStack(stackTrace: s);
                                    ExceptionWidget.showSnackbar(context, e);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

enum _AccountAction {
  settings,
  delete,
}

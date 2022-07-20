part of '../../neon.dart';

class AccountSpecificSettingsPage extends StatefulWidget {
  const AccountSpecificSettingsPage({
    required this.bloc,
    required this.account,
    required this.appsBloc,
    super.key,
  });

  final AccountsBloc bloc;
  final Account account;
  final AppsBloc appsBloc;

  @override
  State<AccountSpecificSettingsPage> createState() => _AccountSpecificSettingsPageState();
}

class _AccountSpecificSettingsPageState extends State<AccountSpecificSettingsPage> {
  late final _options = widget.bloc.getOptions(widget.account)!;
  late final _userDetailsBloc = widget.bloc.getUserDetailsBloc(widget.account);
  late final _name = widget.account.client.humanReadableID;

  late final FilesSyncBloc _filesSyncBloc;

  @override
  void initState() {
    super.initState();

    _filesSyncBloc = RxBlocProvider.of<FilesSyncBloc>(context);
  }

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
                  AppLocalizations.of(context).accountOptionsRemoveConfirm(widget.account.client.humanReadableID),
                )) {
                  widget.bloc.removeAccount(widget.account);
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(MdiIcons.delete),
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
              icon: const Icon(MdiIcons.cogRefresh),
            ),
          ],
        ),
        body: StreamBuilder<Map<FilesSyncMapping, bool?>>(
          stream: _filesSyncBloc.mappingStatuses,
          builder: (final context, final mappingsSnapshot) =>
              StandardRxResultBuilder<UserDetailsBloc, ProvisioningApiUserDetails>(
            bloc: _userDetailsBloc,
            state: (final bloc) => bloc.userDetails,
            builder:
                (final context, final userDetailsData, final userDetailsError, final userDetailsLoading, final _) =>
                    SettingsList(
              categories: [
                SettingsCategory(
                  title: Text(AppLocalizations.of(context).accountOptionsCategoryStorageInfo),
                  tiles: [
                    CustomSettingsTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (userDetailsData != null) ...[
                            LinearProgressIndicator(
                              value: userDetailsData.quota!.relative! / 100,
                              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              AppLocalizations.of(context).accountOptionsQuotaUsedOf(
                                filesize(userDetailsData.quota!.used!, 1),
                                filesize(userDetailsData.quota!.total!, 1),
                                userDetailsData.quota!.relative!.toString(),
                              ),
                            ),
                          ],
                          ExceptionWidget(
                            userDetailsError,
                            onRetry: () {
                              _userDetailsBloc.refresh();
                            },
                          ),
                          CustomLinearProgressIndicator(
                            visible: userDetailsLoading,
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
                SettingsCategory(
                  title: Text(AppLocalizations.of(context).filesSyncMappings),
                  tiles: [
                    for (final entry in (mappingsSnapshot.data ?? <FilesSyncMapping, bool?>{}).entries) ...[
                      if (entry.key.accountId == widget.account.id) ...[
                        CustomSettingsTile(
                          title: Text(entry.key.localPath),
                          subtitle: Text(entry.key.remotePath.join('/')),
                          leading: FilesSyncStatusIcon(
                            status: entry.value,
                            size: 40,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.sync),
                            onPressed: () {
                              _filesSyncBloc.syncMapping(entry.key, {});
                            },
                          ),
                          onLongPress: () async {
                            if (await showConfirmationDialog(
                              context,
                              AppLocalizations.of(context).filesSyncConfirmRemoveMapping,
                            )) {
                              _filesSyncBloc.removeMapping(entry.key);
                            }
                          },
                        ),
                      ],
                    ],
                    CustomSettingsTile(
                      title: ElevatedButton.icon(
                        onPressed: () async {
                          final appImplementation = Provider.of<List<AppImplementation>>(context, listen: false)
                              .singleWhere((final a) => a.id == 'files');
                          final filesBloc = widget.appsBloc.getAppBloc<FilesBloc>(appImplementation);
                          final b = filesBloc.getNewFilesBrowserBloc();
                          final remotePath = await showDialog<List<String>?>(
                            context: context,
                            builder: (final context) => FilesChooseFolderDialog(
                              bloc: b,
                              filesBloc: filesBloc,
                            ),
                          );
                          b.dispose();
                          if (remotePath == null) {
                            return;
                          }

                          final localPath = await FileUtils.pickDirectory();
                          if (localPath == null || !mounted) {
                            return;
                          }

                          _filesSyncBloc.addMapping(
                            FilesSyncMapping(
                              accountId: widget.account.id,
                              remotePath: remotePath,
                              localPath: localPath,
                            ),
                          );
                        },
                        icon: const Icon(MdiIcons.folderPlus),
                        label: Text(AppLocalizations.of(context).filesSyncAddMapping),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

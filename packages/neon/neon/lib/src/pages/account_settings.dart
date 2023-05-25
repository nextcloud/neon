part of '../../neon.dart';

class AccountSettingsPage extends StatelessWidget {
  AccountSettingsPage({
    required this.bloc,
    required this.account,
    super.key,
  });

  final AccountsBloc bloc;
  final Account account;

  late final _options = bloc.getOptions(account);
  late final _userDetailsBloc = bloc.getUserDetailsBloc(account);
  late final _name = account.client.humanReadableID;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(_name),
          actions: [
            IconButton(
              onPressed: () async {
                // ignore: use_build_context_synchronously
                if (await showConfirmationDialog(
                  context,
                  // ignore: use_build_context_synchronously
                  AppLocalizations.of(context).accountOptionsRemoveConfirm(account.client.humanReadableID),
                )) {
                  bloc.removeAccount(account);
                }
              },
              tooltip: AppLocalizations.of(context).accountOptionsRemove,
              icon: const Icon(MdiIcons.delete),
            ),
            IconButton(
              onPressed: () async {
                // ignore: use_build_context_synchronously
                if (await showConfirmationDialog(
                  context,
                  // ignore: use_build_context_synchronously
                  AppLocalizations.of(context).settingsResetForConfirmation(_name),
                )) {
                  await _options.reset();
                }
              },
              tooltip: AppLocalizations.of(context).settingsResetFor(_name),
              icon: const Icon(MdiIcons.cogRefresh),
            ),
          ],
        ),
        body: ResultBuilder<NextcloudProvisioningApiUserDetails>(
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
                        if (userDetails.data != null) ...[
                          LinearProgressIndicator(
                            value: userDetails.data!.quota.relative / 100,
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context).accountOptionsQuotaUsedOf(
                              filesize(userDetails.data!.quota.used, 1),
                              filesize(userDetails.data!.quota.total, 1),
                              userDetails.data!.quota.relative.toString(),
                            ),
                          ),
                        ],
                        NeonException(
                          userDetails.error,
                          onRetry: _userDetailsBloc.refresh,
                        ),
                        NeonLinearProgressIndicator(
                          visible: userDetails.loading,
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

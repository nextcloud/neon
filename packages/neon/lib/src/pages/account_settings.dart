part of '../neon.dart';

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
                if (await showConfirmationDialog(
                  context,
                  AppLocalizations.of(context).accountOptionsRemoveConfirm(account.client.humanReadableID),
                )) {
                  bloc.removeAccount(account);
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
        body: ResultBuilder<UserDetailsBloc, ProvisioningApiUserDetails>(
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
                        ExceptionWidget(
                          userDetails.error,
                          onRetry: _userDetailsBloc.refresh,
                        ),
                        CustomLinearProgressIndicator(
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

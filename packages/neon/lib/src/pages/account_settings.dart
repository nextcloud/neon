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
        body: StandardRxResultBuilder<UserDetailsBloc, ProvisioningApiUserDetails>(
          bloc: _userDetailsBloc,
          state: (final bloc) => bloc.userDetails,
          builder: (final context, final userDetailsData, final userDetailsError, final userDetailsLoading, final _) =>
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
                            value: userDetailsData.quota.relative / 100,
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context).accountOptionsQuotaUsedOf(
                              filesize(userDetailsData.quota.used, 1),
                              filesize(userDetailsData.quota.total, 1),
                              userDetailsData.quota.relative.toString(),
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
            ],
          ),
        ),
      );
}

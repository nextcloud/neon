part of '../../neon.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(final BuildContext context) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final options = accountsBloc.getOptionsFor(account);
    final userDetailsBloc = accountsBloc.getUserDetailsBlocFor(account);
    final name = account.client.humanReadableID;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () async {
              // ignore: use_build_context_synchronously
              if (await showConfirmationDialog(
                context,
                // ignore: use_build_context_synchronously
                AppLocalizations.of(context).accountOptionsRemoveConfirm(account.client.humanReadableID),
              )) {
                final isActive = accountsBloc.activeAccount.value == account;

                accountsBloc.removeAccount(account);

                if (isActive) {
                  // ignore: use_build_context_synchronously
                  const HomeRoute().go(context);
                } else {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                }
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
                AppLocalizations.of(context).settingsResetForConfirmation(name),
              )) {
                await options.reset();
              }
            },
            tooltip: AppLocalizations.of(context).settingsResetFor(name),
            icon: const Icon(MdiIcons.cogRefresh),
          ),
        ],
      ),
      body: ResultBuilder<NextcloudProvisioningApiUserDetails>(
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
                        onRetry: userDetailsBloc.refresh,
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
                  option: options.initialApp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

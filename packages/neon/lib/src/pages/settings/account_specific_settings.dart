part of '../../neon.dart';

class AccountSpecificSettingsPage extends StatelessWidget {
  AccountSpecificSettingsPage({
    required this.bloc,
    required this.account,
    super.key,
  });

  final AccountsBloc bloc;
  final Account account;

  late final _options = bloc.getOptions(account)!;
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
        body: SettingsList(
          categories: [
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
      );
}

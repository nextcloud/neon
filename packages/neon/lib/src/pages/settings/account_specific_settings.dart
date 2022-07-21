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

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).settingsForAccount(
              account.username,
              Uri.parse(account.serverURL).host,
            ),
          ),
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

part of '../neon.dart';

class GlobalPopups extends StatefulWidget {
  const GlobalPopups({
    super.key,
  });

  @override
  State<GlobalPopups> createState() => _GlobalPopupsState();
}

class _GlobalPopupsState extends State<GlobalPopups> {
  late GlobalOptions _globalOptions;
  late FirstLaunchBloc _firstLaunchBloc;
  late NextPushBloc _nextPushBloc;

  @override
  void initState() {
    super.initState();

    _globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    _firstLaunchBloc = Provider.of<FirstLaunchBloc>(context, listen: false);
    _nextPushBloc = Provider.of<NextPushBloc>(context, listen: false);

    _firstLaunchBloc.onFirstLaunch.listen((final _) async {
      if (await _globalOptions.pushNotificationsEnabled.enabled.first) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).firstLaunchGoToSettingsToEnablePushNotifications),
            action: SnackBarAction(
              label: AppLocalizations.of(context).settings,
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),
        );
      }
    });

    _nextPushBloc.onNextPushSupported.listen((final _) async {
      await showDialog(
        context: context,
        builder: (final context) => AlertDialog(
          title: Text(AppLocalizations.of(context).nextPushSupported),
          content: Text(AppLocalizations.of(context).nextPushSupportedText),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context).no),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                launchUrlString(
                  'https://f-droid.org/packages/$unifiedPushNextPushID',
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Text(AppLocalizations.of(context).nextPushSupportedInstall),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(final BuildContext context) => Container();
}

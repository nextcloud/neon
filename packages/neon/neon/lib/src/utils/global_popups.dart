part of '../../neon.dart';

class GlobalPopups {
  factory GlobalPopups() => instance ??= GlobalPopups._();

  @visibleForTesting
  factory GlobalPopups.mocked(final GlobalPopups mock) => instance ??= mock;

  GlobalPopups._();

  @visibleForTesting
  static GlobalPopups? instance;

  bool _registered = false;

  void register(final BuildContext context) {
    if (_registered) {
      return;
    }

    final globalOptions = Provider.of<GlobalOptions>(context, listen: false);
    final firstLaunchBloc = Provider.of<FirstLaunchBloc>(context, listen: false);
    final nextPushBloc = Provider.of<NextPushBloc>(context, listen: false);

    firstLaunchBloc.onFirstLaunch.listen((final _) async {
      if (await globalOptions.pushNotificationsEnabled.enabled.first) {
        // ignore: use_build_context_synchronously
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).firstLaunchGoToSettingsToEnablePushNotifications),
            action: SnackBarAction(
              label: AppLocalizations.of(context).settings,
              onPressed: () {
                const SettingsRoute().go(context);
              },
            ),
          ),
        );
      }
    });

    nextPushBloc.onNextPushSupported.listen((final _) async {
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
              child: Text(AppLocalizations.of(context).actionNo),
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

    _registered = true;
  }
}

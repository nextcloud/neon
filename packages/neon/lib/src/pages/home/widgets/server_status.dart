part of '../../../neon.dart';

class ServerStatus extends StatefulWidget {
  const ServerStatus({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  State<ServerStatus> createState() => _ServerStatusState();
}

class _ServerStatusState extends State<ServerStatus> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((final _) async {
      try {
        final status = await widget.account.client.core.getStatus();
        if (status.maintenance && mounted) {
          ExceptionWidget.showSnackbar(context, AppLocalizations.of(context).errorServerInMaintenanceMode);
        }
      } catch (e) {
        debugPrint(e.toString());
        ExceptionWidget.showSnackbar(context, e);
      }
    });
  }

  @override
  Widget build(final BuildContext context) => Container();
}

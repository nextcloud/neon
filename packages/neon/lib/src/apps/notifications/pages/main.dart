part of '../app.dart';

class NotificationsMainPage extends StatefulWidget {
  const NotificationsMainPage({
    required this.bloc,
    super.key,
  });

  final NotificationsBloc bloc;

  @override
  State<NotificationsMainPage> createState() => _NotificationsMainPageState();
}

class _NotificationsMainPageState extends State<NotificationsMainPage> {
  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      ExceptionWidget.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => ResultBuilder<NotificationsBloc, List<NotificationsNotification>>(
        stream: widget.bloc.notifications,
        builder: (final context, final notifications) => Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              widget.bloc.deleteAllNotifications();
            },
            child: const Icon(MdiIcons.checkAll),
          ),
          body: CustomListView<NotificationsNotification>(
            scrollKey: 'notifications-notifications',
            withFloatingActionButton: true,
            items: notifications.data,
            isLoading: notifications.loading,
            error: notifications.error,
            onRetry: () async {
              await widget.bloc.refresh();
            },
            onRefresh: () async {
              await widget.bloc.refresh();
            },
            builder: _buildNotification,
          ),
        ),
      );

  Widget _buildNotification(
    final BuildContext context,
    final NotificationsNotification notification,
  ) {
    final matchingAppImplementations = Provider.of<List<AppImplementation>>(context, listen: false)
        .where((final a) => a.id == notification.app)
        .toList();

    return ListTile(
      title: Text(notification.subject),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (notification.message.isNotEmpty) ...[
            Text(
              notification.message,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
          RelativeTime(
            date: DateTime.parse(notification.datetime),
          ),
        ],
      ),
      leading: matchingAppImplementations.isNotEmpty
          ? matchingAppImplementations.single.buildIcon(
              context,
              width: 40,
              height: 40,
            )
          : SizedBox(
              width: 40,
              height: 40,
              child: CachedURLImage(
                url: notification.icon,
                width: 40,
                height: 40,
                svgColor: Theme.of(context).colorScheme.primary,
              ),
            ),
      onTap: () async {
        final allAppImplementations = Provider.of<List<AppImplementation>>(context, listen: false);
        final matchingAppImplementations = allAppImplementations.where((final a) => a.id == notification.app);
        if (matchingAppImplementations.isNotEmpty) {
          final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
          accountsBloc.getAppsBloc(accountsBloc.activeAccount.value!).setActiveApp(notification.app);
        } else {
          await showDialog(
            context: context,
            builder: (final context) => AlertDialog(
              title: Text(AppLocalizations.of(context).notificationsNextcloudAppNotImplementedYet),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context).close),
                ),
              ],
            ),
          );
        }
      },
      onLongPress: () {
        widget.bloc.deleteNotification(notification.notificationId);
      },
    );
  }
}

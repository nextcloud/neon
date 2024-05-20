import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/src/widgets/action.dart';
import 'package:nextcloud/ids.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:timezone/timezone.dart' as tz;

class NotificationsNotification extends StatelessWidget {
  const NotificationsNotification({
    required this.notification,
    required this.onDelete,
    super.key,
  });

  final notifications.Notification notification;

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final app = NeonProvider.of<BuiltSet<AppImplementation>>(context).tryFind(notification.app);

    final icon = app?.buildIcon(size: largeIconSize) ??
        SizedBox.fromSize(
          size: const Size.square(largeIconSize),
          child: NeonUriImage(
            account: NeonProvider.of<Account>(context),
            uri: Uri.parse(notification.icon!),
            size: const Size.square(largeIconSize),
            svgColorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
          ),
        );

    return ListTile(
      title: Text(notification.subject),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (notification.message.isNotEmpty)
            Text(
              notification.message,
              overflow: TextOverflow.ellipsis,
            ),
          RelativeTime(
            date: tz.TZDateTime.parse(tz.UTC, notification.datetime),
          ),
          if (notification.actions.isNotEmpty)
            Row(
              children: notification.actions
                  .map(
                    (action) => NotificationsAction(
                      action: action,
                    ),
                  )
                  .toList(),
            ),
        ]
            .intersperse(
              const SizedBox(
                height: 5,
              ),
            )
            .toList(),
      ),
      leading: icon,
      onTap: () async {
        if (notification.app == AppIDs.notifications) {
          return;
        }
        if (app != null) {
          // TODO: use go_router once implemented
          NeonProvider.of<AppsBloc>(context).setActiveApp(app.id);
        } else {
          await showUnimplementedDialog(
            context: context,
            title: NotificationsLocalizations.of(context).notificationAppNotImplementedYet,
          );
        }
      },
      onLongPress: onDelete,
    );
  }
}

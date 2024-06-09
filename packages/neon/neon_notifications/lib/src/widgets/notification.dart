import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notifications/src/widgets/action.dart';
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
      leading: NeonUriImage(
        account: NeonProvider.of<Account>(context),
        uri: Uri.parse(notification.icon!),
        size: const Size.square(largeIconSize),
        svgColorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
      ),
      onTap: notification.link.isNotEmpty ? () => context.go(notification.link) : null,
      onLongPress: onDelete,
    );
  }
}

import 'package:meta/meta.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';

/// Creates a mocked [PushNotification] object.
@visibleForTesting
PushNotification createPushNotification({
  String accountID = 'accountID',
  String priority = 'priority',
  String type = 'type',
  int nid = 0,
  String app = 'app',
  String subject = 'subject',
  String id = 'id',
  bool delete = false,
  bool deleteAll = false,
}) {
  return PushNotification(
    (b) => b
      ..accountID = accountID
      ..priority = priority
      ..type = type
      ..subject.update(
        (b) => b
          ..nid = nid
          ..app = app
          ..subject = subject
          ..type = type
          ..id = id
          ..delete = delete
          ..deleteAll = deleteAll,
      ),
  );
}

import 'package:nextcloud_test/nextcloud_test.dart';

import 'core.dart' as core;
import 'news.dart' as news;
import 'notes.dart' as notes;
import 'notifications.dart' as notifications;
import 'provisioning_api.dart' as provisioning_api;
import 'user_status.dart' as user_status;
import 'webdav.dart' as webdav;

Future main() async {
  final image = await getDockerImage();
  await core.run(image);
  await news.run(image);
  await notes.run(image);
  await notifications.run(image);
  await provisioning_api.run(image);
  await user_status.run(image);
  await webdav.run(image);
}

import 'package:neon/platform.dart';
import 'package:neon/utils.dart';
import 'package:neon_files/neon_files.dart';
import 'package:neon_news/neon_news.dart';
import 'package:neon_notes/neon_notes.dart';
import 'package:neon_notifications/neon_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<AppImplementation> getAppImplementations(
  final SharedPreferences sharedPreferences,
  final RequestManager requestManager,
  final NeonPlatform platform,
) =>
    [
      FilesApp(sharedPreferences, requestManager, platform),
      NewsApp(sharedPreferences, requestManager, platform),
      NotesApp(sharedPreferences, requestManager, platform),
      NotificationsApp(sharedPreferences, requestManager, platform),
    ];

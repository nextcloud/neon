import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:neon_dashboard/neon_dashboard.dart';
import 'package:neon_files/neon_files.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_news/neon_news.dart';
import 'package:neon_notes/neon_notes.dart';
import 'package:neon_notifications/neon_notifications.dart';
import 'package:neon_talk/neon_talk.dart';

/// The collection of clients enabled for the Neon app.
final BuiltSet<AppImplementation> appImplementations = BuiltSet({
  DashboardApp(),
  FilesApp(),
  NewsApp(),
  NotesApp(),
  NotificationsApp(),
  if (kDebugMode) TalkApp(),
});

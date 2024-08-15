import 'package:built_collection/built_collection.dart';
import 'package:dashboard_app/dashboard_app.dart';
import 'package:files_app/files_app.dart';
import 'package:flutter/foundation.dart';
import 'package:neon_framework/models.dart';
import 'package:news_app/news_app.dart';
import 'package:notes_app/notes_app.dart';
import 'package:notifications_app/notifications_app.dart';
import 'package:talk_app/talk_app.dart';

/// The collection of clients enabled for the Neon app.
final BuiltSet<AppImplementation> appImplementations = BuiltSet({
  DashboardApp(),
  FilesApp(),
  NewsApp(),
  NotesApp(),
  NotificationsApp(),
  if (kDebugMode) TalkApp(),
});

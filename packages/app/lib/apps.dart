import 'package:neon/models.dart';
import 'package:neon_files/neon_files.dart';
import 'package:neon_news/neon_news.dart';
import 'package:neon_notes/neon_notes.dart';
import 'package:neon_notifications/neon_notifications.dart';

final List<AppImplementation> appImplementations = [
  FilesApp(),
  NewsApp(),
  NotesApp(),
  NotificationsApp(),
];

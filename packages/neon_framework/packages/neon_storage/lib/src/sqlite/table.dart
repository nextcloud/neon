import 'dart:async';

import 'package:neon_storage/src/sqlite/sqlite.dart';
import 'package:sqflite_common/sqlite_api.dart';

/// A SQLite table abstraction that mimics the `openDatabase` function from the sqflite package.
///
/// Depending on the current [version], [onCreate], [onUpgrade], and [onDowngrade] can
/// be called. These functions are mutually exclusive — only one of them can be
/// called depending on the context.
abstract mixin class Table {
  /// The name of the table.
  String get name;

  /// The value must be a 32-bit integer greater than `0`.
  int get version;

  /// The owning multi table database.
  late MultiTableDatabase controller;

  /// A callback for creating the required schema for the table.
  ///
  /// It is only called called if the table did not exist prior.
  void onCreate(Batch db, int version) {}

  /// A callback for upgrading the schema of a table.
  ///
  /// It is only called called if the database already exists and [version] is
  /// higher than the last database version.
  void onUpgrade(Batch db, int oldVersion, int newVersion) {}

  /// A callback for downgrading the required schema for the table.
  ///
  /// It is only called called when [version] is lower than the last database
  /// version. This is a rare case and should only come up if a newer version of
  /// your code has created a database that is then interacted with by an older
  /// version of your code. You should try to avoid this scenario.
  void onDowngrade(Batch db, int oldVersion, int newVersion) {}

  /// A callback invoked after all the table versions are set.
  Future<void> onOpen() async {}
}

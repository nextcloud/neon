import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Initializes the sqlite database factory with the [databaseFactoryFfi].

void setupDatabase() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

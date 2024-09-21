import 'package:sqflite_common/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

/// Initializes the sqlite database factory with the [databaseFactoryFfiWeb].
void setupDatabase() {
  databaseFactory = databaseFactoryFfiWeb;
}

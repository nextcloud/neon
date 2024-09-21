import 'package:path/path.dart' as p;

/// The default database file extension.
const String databaseExtension = '.db';

/// Builds the database storage path from a directory and file name.
String buildDatabasePath(String? directory, String name) {
  if (p.basenameWithoutExtension(name) != name) {
    throw ArgumentError.value(name, 'name', 'MUST NOT contain any directory or file extension.');
  }

  final nameWithExtension = p.setExtension(name, databaseExtension);

  if (directory == null) {
    return nameWithExtension;
  }

  return p.join(directory, nameWithExtension);
}

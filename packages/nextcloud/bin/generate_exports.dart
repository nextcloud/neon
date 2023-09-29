// ignore_for_file: depend_on_referenced_packages
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:path/path.dart' as p;

void main() {
  final files =
      Directory('lib/src/api').listSync().cast<File>().where((final file) => file.path.endsWith('.openapi.dart'));

  final idStatements = <String>[];
  final exportStatements = <String>[
    "export 'ids.dart';",
    "export 'src/client.dart';",
    "export 'webdav.dart';",
  ];

  for (final file in files) {
    final basename = p.basename(file.path);
    final id = basename.substring(0, basename.length - 13);
    final variablePrefix = toDartName(id);
    final classPrefix = toDartName(id, uppercaseFirstCharacter: true);

    idStatements.add("  static const $variablePrefix = '$id';");
    exportStatements.add("export '$id.dart';");

    final exports = ["export 'src/api/$id.openapi.dart';"];
    if (File('lib/src/helpers/$id.dart').existsSync()) {
      exports.add("export 'src/helpers/$id.dart';");
    }

    File('lib/$id.dart').writeAsStringSync('''
import 'package:nextcloud/src/api/$id.openapi.dart';
import 'package:nextcloud/src/client.dart';

${exports.join('\n')}

// ignore: public_member_api_docs
extension ${classPrefix}Extension on NextcloudClient {
  static final _$variablePrefix = Expando<${classPrefix}Client>();

  /// Client for the $id APIs
  ${classPrefix}Client get $variablePrefix => _$variablePrefix[this] ??= ${classPrefix}Client.fromClient(this);
}
''');
  }

  File('lib/ids.dart').writeAsStringSync('''
// ignore_for_file: public_member_api_docs

final class AppIDs {
${idStatements.join('\n')}
}
''');

  File('lib/nextcloud.dart').writeAsStringSync('''
export 'package:dynamite_runtime/http_client.dart' show CookieJar, DynamiteApiException, DynamiteRawResponse, DynamiteResponse;

${exportStatements.sorted((final a, final b) => a.compareTo(b)).join('\n')}
''');
}

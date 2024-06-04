import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/logger.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResult? resolveMimeTypeDecode(
  openapi.Response response,
  State state,
  String identifier,
) {
  if (response.content != null) {
    if (response.content!.length > 1) {
      dynamiteLog.multipleMimeTypes();
    }

    for (final content in response.content!.entries) {
      final mimeType = content.key;
      final mediaType = content.value;

      final result = resolveType(
        state,
        mediaType.schema!.rebuild((b) {
          b.identifier = toDartName(
            '$identifier-$mimeType',
            className: true,
          );
        }),
      );

      if (mimeType == '*/*' || mimeType == 'application/octet-stream' || mimeType.startsWith('image/')) {
        return TypeResultBase('Uint8List');
      } else if (mimeType.startsWith('text/') || mimeType == 'application/javascript') {
        return TypeResultBase('String');
      } else if (mimeType == 'application/json') {
        return result;
      }
    }
    throw Exception('Can not parse any mime type of Operation: "$identifier"');
  }
  return null;
}

void resolveMimeTypeEncode(
  String mimeType,
  TypeResult result,
  StringSink output,
) {
  output.writeln("_request.headers['Content-Type'] = '$mimeType';");

  if (result.nullable) {
    output.writeln(r'if ($body != null) {');
  }

  switch (mimeType) {
    case 'application/json':
    case 'application/x-www-form-urlencoded':
      output.writeln('_request.body = ${result.encode(r'$body', mimeType: mimeType)};');
    case 'application/octet-stream':
      output.writeln('_request.bodyBytes = ${result.encode(r'$body', mimeType: mimeType)};');
    case _:
      throw Exception('Can not parse any mime type of the Operation.');
  }

  if (result.nullable) {
    output.writeln('}');
  }
}

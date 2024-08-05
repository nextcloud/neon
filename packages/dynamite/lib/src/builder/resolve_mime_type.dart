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
  // ignore: avoid_positional_boolean_parameters
  bool dartParameterNullable,
  String? $default,
  StringSink output,
) {
  output.writeln("_request.headers['Content-Type'] = '$mimeType';");

  switch (mimeType) {
    case 'application/json':
    case 'application/x-www-form-urlencoded':
      if (dartParameterNullable) {
        output.writeln(
          '_request.body = \$body != null ? ${result.encode(result.serialize(r'$body'), mimeType: mimeType)} : ${$default != null ? result.encode($default, mimeType: mimeType) : result.encode(result.serialize('${result.name}()'), mimeType: mimeType)};',
        );
      } else {
        output.writeln('_request.body = ${result.encode(result.serialize(r'$body'), mimeType: mimeType)};');
      }
    case 'application/octet-stream':
      if (dartParameterNullable) {
        output.writeln(
          '_request.bodyBytes = \$body != null ? ${result.encode(r'$body', mimeType: mimeType)} : ${$default != null ? result.encode($default, mimeType: mimeType) : 'Uint8List(0)'};',
        );
      } else {
        output.writeln('_request.bodyBytes = ${result.encode(r'$body', mimeType: mimeType)};');
      }
    case _:
      throw Exception('Can not parse any mime type of the Operation.');
  }
}

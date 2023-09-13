import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/operation.dart';
import 'package:dynamite/src/models/response.dart';
import 'package:dynamite/src/type_result/type_result.dart';

(String? dataType, String? dataValue, bool? dataNeedsAwait) resolveMimeTypeDecode(
  final Response response,
  final OpenAPI spec,
  final State state,
  final String identifier,
) {
  if (response.content != null) {
    if (response.content!.length > 1) {
      print('Can not work with multiple mime types right now. Using the first supported.');
    }

    for (final content in response.content!.entries) {
      final mimeType = content.key;
      final mediaType = content.value;

      final result = resolveType(
        spec,
        state,
        'identifier-$mimeType',
        mediaType.schema!,
      );

      if (mimeType == '*/*' || mimeType == 'application/octet-stream' || mimeType.startsWith('image/')) {
        return ('Uint8List', '_response.bodyBytes', true);
      } else if (mimeType.startsWith('text/') || mimeType == 'application/javascript') {
        return ('String', '_response.body', true);
      } else if (mimeType == 'application/json') {
        String? dataValue;
        bool? dataNeedsAwait;
        if (result.name == 'dynamic') {
          dataValue = '';
        } else if (result.name == 'String') {
          dataValue = '_response.body';
          dataNeedsAwait = true;
        } else if (result is TypeResultEnum || result is TypeResultBase) {
          dataValue = result.deserialize(result.decode('await _response.body'));
          dataNeedsAwait = false;
        } else {
          dataValue = result.deserialize('await _response.jsonBody');
          dataNeedsAwait = false;
        }
        return (result.name, dataValue, dataNeedsAwait);
      }
    }
    throw Exception('Can not parse any mime type of Operation:"$identifier"');
  }
  return (null, null, null);
}

void resolveMimeTypeEncode(
  final Operation operation,
  final OpenAPI spec,
  final State state,
  final String identifier,
  final MethodBuilder b,
  final StringBuffer code,
) {
  if (operation.requestBody != null) {
    if (operation.requestBody!.content!.length > 1) {
      print('Can not work with multiple mime types right now. Using the first supported.');
    }
    for (final content in operation.requestBody!.content!.entries) {
      final mimeType = content.key;
      final mediaType = content.value;

      code.write("_headers['Content-Type'] = '$mimeType';");

      final dartParameterNullable = isDartParameterNullable(
        operation.requestBody!.required,
        mediaType.schema,
      );

      final result = resolveType(
        spec,
        state,
        toDartName('$identifier-request-$mimeType', uppercaseFirstCharacter: true),
        mediaType.schema!,
        nullable: dartParameterNullable,
      );
      final parameterName = toDartName(result.name.replaceFirst(state.classPrefix, ''));
      switch (mimeType) {
        case 'application/json':
        case 'application/x-www-form-urlencoded':
          final dartParameterRequired = isRequired(
            operation.requestBody!.required,
            mediaType.schema?.$default,
          );
          b.optionalParameters.add(
            Parameter(
              (final b) => b
                ..name = parameterName
                ..type = refer(result.nullableName)
                ..named = true
                ..required = dartParameterRequired,
            ),
          );

          if (dartParameterNullable) {
            code.write('if ($parameterName != null) {');
          }
          code.write(
            '_body = utf8.encode(${result.encode(parameterName, mimeType: mimeType)}) as Uint8List;',
          );
          if (dartParameterNullable) {
            code.write('}');
          }
          return;
        case 'application/octet-stream':
          final dartParameterRequired = isRequired(
            operation.requestBody!.required,
            mediaType.schema?.$default,
          );
          b.optionalParameters.add(
            Parameter(
              (final b) => b
                ..name = parameterName
                ..type = refer(result.nullableName)
                ..named = true
                ..required = dartParameterRequired,
            ),
          );

          if (dartParameterNullable) {
            code.write('if ($parameterName != null) {');
          }
          code.write(
            '_body = ${result.encode(parameterName, mimeType: mimeType)};',
          );
          if (dartParameterNullable) {
            code.write('}');
          }
          return;
      }
    }

    throw Exception('Can not parse any mime type of Operation:"$identifier"');
  }
}

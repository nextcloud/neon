import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/openapi/parameter.dart';
import 'package:dynamite/src/models/openapi/request_body.dart';
import 'package:dynamite/src/models/openapi/response.dart';

part 'operation.g.dart';

abstract class Operation implements Built<Operation, OperationBuilder> {
  factory Operation([void Function(OperationBuilder) updates]) = _$Operation;

  const Operation._();

  static Serializer<Operation> get serializer => _$operationSerializer;

  String? get operationId;

  @BuiltValueField(compare: false)
  String? get summary;

  @BuiltValueField(compare: false)
  String? get description;

  bool get deprecated;

  BuiltSet<String>? get tags;

  BuiltList<Parameter>? get parameters;

  RequestBody? get requestBody;

  BuiltMap<String, Response>? get responses;

  BuiltList<BuiltMap<String, BuiltList<String>>>? get security;

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(OperationBuilder b) {
    b.deprecated ??= false;
  }

  String formattedDescription(
    String methodName, {
    bool isRequest = false,
    bool requiresAuth = false,
  }) {
    final buffer = StringBuffer();

    final summary = formatDescription(this.summary);
    if (summary != null) {
      buffer
        ..writeln(summary)
        ..write('\n');
    }

    final description = formatDescription(this.description);
    if (description != null) {
      buffer
        ..writeln(description)
        ..write('\n');
    }

    if (isRequest) {
      buffer.writeln('Returns a `DynamiteRequest` backing the [$methodName] operation.');
    } else {
      buffer.writeln(
        'Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.',
      );
    }
    buffer
      ..writeln('Throws a `DynamiteApiException` if the API call does not return an expected status code.')
      ..write('\n');

    if (parameters != null && parameters!.isNotEmpty) {
      buffer.writeln('Parameters:');
      for (final parameter in parameters!) {
        buffer.writeln(parameter.formattedDescription);
      }
      buffer.write('\n');
    }

    if (requestBody?.description?.isNotEmpty ?? false) {
      buffer.writeln('Request body: [\$body] ${requestBody!.description!}\n');
    }

    if (responses != null && responses!.isNotEmpty) {
      buffer.writeln('Status codes:');
      for (final response in responses!.entries) {
        final statusCode = response.key;
        final description = response.value.description;

        buffer.write('  * $statusCode');
        if (description.isNotEmpty) {
          buffer
            ..write(': ')
            ..write(description);
        }

        buffer.write('\n');
      }
      buffer.write('\n');
    }

    buffer.writeln('See:');
    if (isRequest) {
      buffer
        ..writeln(' * [$methodName] for a method executing this request and parsing the response.')
        ..writeln(
          ' * [\$${methodName}_Serializer] for a converter to parse the `Response` from an executed this request.',
        );
    } else {
      buffer
        ..writeln(' * [\$${methodName}_Request] for the request send by this method.')
        ..writeln(' * [\$${methodName}_Serializer] for a converter to parse the `Response` from an executed request.');
    }

    return buffer.toString();
  }
}

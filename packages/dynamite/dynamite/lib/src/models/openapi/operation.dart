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

  Iterable<String> formattedDescription(
    String methodName, {
    bool isRequest = false,
    bool requiresAuth = false,
  }) sync* {
    if (summary != null && summary!.isNotEmpty) {
      yield* descriptionToDocs(summary);
      yield docsSeparator;
    }

    if (description != null && description!.isNotEmpty) {
      yield* descriptionToDocs(description);
      yield docsSeparator;
    }

    if (isRequest) {
      yield '$docsSeparator Returns a `DynamiteRequest` backing the [$methodName] operation.';
    } else {
      yield '$docsSeparator Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.';
    }
    yield '$docsSeparator Throws a `DynamiteApiException` if the API call does not return an expected status code.';
    yield docsSeparator;

    if (parameters != null && parameters!.isNotEmpty) {
      yield '$docsSeparator Parameters:';
      for (final parameter in parameters!) {
        yield parameter.formattedDescription;
      }
      yield docsSeparator;
    }

    if (responses != null && responses!.isNotEmpty) {
      yield '$docsSeparator Status codes:';
      for (final response in responses!.entries) {
        final statusCode = response.key;
        final description = response.value.description;

        final buffer = StringBuffer()
          ..write('$docsSeparator ')
          ..write('  * $statusCode');

        if (description.isNotEmpty) {
          buffer
            ..write(': ')
            ..write(description);
        }

        yield buffer.toString();
      }
      yield docsSeparator;
    }

    yield '$docsSeparator See:';
    if (isRequest) {
      yield '$docsSeparator  * [$methodName] for a method executing this request and parsing the response.';
      yield '$docsSeparator  * [\$${methodName}_Serializer] for a converter to parse the `Response` from an executed this request.';
    } else {
      yield '$docsSeparator  * [\$${methodName}_Request] for the request send by this method.';
      yield '$docsSeparator  * [\$${methodName}_Serializer] for a converter to parse the `Response` from an executed request.';
    }
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/openapi/parameter.dart';
import 'package:dynamite/src/models/openapi/request_body.dart';
import 'package:dynamite/src/models/openapi/response.dart';

part 'operation.g.dart';

abstract class Operation implements Built<Operation, OperationBuilder> {
  factory Operation([final void Function(OperationBuilder) updates]) = _$Operation;

  const Operation._();

  static Serializer<Operation> get serializer => _$operationSerializer;

  String? get operationId;

  @BuiltValueField(compare: false)
  String? get summary;

  @BuiltValueField(compare: false)
  String? get description;

  bool? get deprecated;

  BuiltList<String>? get tags;

  BuiltList<Parameter>? get parameters;

  RequestBody? get requestBody;

  BuiltMap<String, Response>? get responses;

  BuiltList<BuiltMap<String, BuiltList<String>>>? get security;

  Iterable<String> get formattedDescription sync* {
    yield* descriptionToDocs(summary);

    if (summary != null && summary!.isNotEmpty && description != null && description!.isNotEmpty) {
      yield docsSeparator;
    }

    yield* descriptionToDocs(description);
  }
}

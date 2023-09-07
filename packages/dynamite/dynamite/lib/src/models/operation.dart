import 'package:collection/collection.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/parameter.dart';
import 'package:dynamite/src/models/request_body.dart';
import 'package:dynamite/src/models/response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'operation.g.dart';

@JsonSerializable()
@immutable
class Operation {
  const Operation({
    this.operationId,
    this.summary,
    this.description,
    this.deprecated,
    this.tags,
    this.parameters,
    this.requestBody,
    this.responses,
    this.security,
  });

  factory Operation.fromJson(final Map<String, dynamic> json) => _$OperationFromJson(json);
  Map<String, dynamic> toJson() => _$OperationToJson(this);

  final String? operationId;

  // Ignored in the comparison as it doesn't affect the generated code
  final String? summary;

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  final bool? deprecated;

  final List<String>? tags;

  final List<Parameter>? parameters;

  final RequestBody? requestBody;

  final Map<String, Response>? responses;

  final List<Map<String, List<String>>>? security;

  Iterable<String> get formattedDescription sync* {
    yield* descriptionToDocs(summary);

    if (summary != null && description != null) {
      yield docsSeparator;
    }

    yield* descriptionToDocs(description);
  }

  @override
  bool operator ==(final Object other) =>
      other is Operation &&
      operationId == other.operationId &&
      deprecated == other.deprecated &&
      const ListEquality().equals(tags, other.tags) &&
      const ListEquality().equals(parameters, other.parameters) &&
      requestBody == other.requestBody &&
      const MapEquality().equals(responses, other.responses) &&
      const DeepCollectionEquality().equals(security, other.security);

  @override
  int get hashCode =>
      operationId.hashCode +
      deprecated.hashCode +
      const ListEquality().hash(tags) +
      const ListEquality().hash(parameters) +
      requestBody.hashCode +
      const MapEquality().hash(responses) +
      const DeepCollectionEquality().hash(security);
}

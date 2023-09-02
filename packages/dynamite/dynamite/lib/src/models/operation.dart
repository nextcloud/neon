import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/parameter.dart';
import 'package:dynamite/src/models/request_body.dart';
import 'package:dynamite/src/models/response.dart';
import 'package:dynamite/src/models/responses.dart';
import 'package:dynamite/src/models/security_requirement.dart';
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

  final String? summary;

  final String? description;

  final bool? deprecated;

  final List<String>? tags;

  final List<Parameter>? parameters;

  final RequestBody? requestBody;

  final Responses? responses;

  final List<SecurityRequirement>? security;

  Iterable<String> get formattedDescription sync* {
    yield* descriptionToDocs(summary);

    if (summary != null && description != null) {
      yield docsSeparator;
    }

    yield* descriptionToDocs(description);
  }
}

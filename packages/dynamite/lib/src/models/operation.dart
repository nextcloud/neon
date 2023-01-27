import 'package:dynamite/src/models/parameter.dart';
import 'package:dynamite/src/models/request_body.dart';
import 'package:dynamite/src/models/response.dart';
import 'package:dynamite/src/models/responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'operation.g.dart';

@JsonSerializable()
class Operation {
  Operation({
    this.operationId,
    this.summary,
    this.description,
    this.tags,
    this.parameters,
    this.requestBody,
    this.responses,
  });

  factory Operation.fromJson(final Map<String, dynamic> json) => _$OperationFromJson(json);
  Map<String, dynamic> toJson() => _$OperationToJson(this);

  final String? operationId;

  final String? summary;

  final String? description;

  final List<String>? tags;

  final List<Parameter>? parameters;

  final RequestBody? requestBody;

  final Responses? responses;
}

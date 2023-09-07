import 'package:collection/collection.dart';
import 'package:dynamite/src/models/operation.dart';
import 'package:dynamite/src/models/parameter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'path_item.g.dart';

@JsonSerializable()
@immutable
class PathItem {
  const PathItem({
    this.description,
    this.parameters,
    this.get,
    this.put,
    this.post,
    this.delete,
    this.options,
    this.head,
    this.patch,
    this.trace,
  });

  factory PathItem.fromJson(final Map<String, dynamic> json) => _$PathItemFromJson(json);
  Map<String, dynamic> toJson() => _$PathItemToJson(this);

  // Ignored in the comparison as it doesn't affect the generated code
  final String? description;

  final List<Parameter>? parameters;

  final Operation? get;

  final Operation? put;

  final Operation? post;

  final Operation? delete;

  final Operation? options;

  final Operation? head;

  final Operation? patch;

  final Operation? trace;

  Map<String, Operation> get operations => <String, Operation>{
        if (get != null) 'get': get!,
        if (put != null) 'put': put!,
        if (post != null) 'post': post!,
        if (delete != null) 'delete': delete!,
        if (options != null) 'options': options!,
        if (head != null) 'head': head!,
        if (patch != null) 'patch': patch!,
        if (trace != null) 'trace': trace!,
      };

  PathItem copyWithOperations(final Map<String, Operation> operations) => PathItem(
        description: description,
        parameters: parameters,
        get: operations['get'] ?? get,
        put: operations['put'] ?? put,
        post: operations['post'] ?? post,
        delete: operations['delete'] ?? delete,
        options: operations['options'] ?? options,
        head: operations['head'] ?? head,
        patch: operations['patch'] ?? patch,
        trace: operations['trace'] ?? trace,
      );

  @override
  bool operator ==(final Object other) =>
      other is PathItem &&
      const ListEquality().equals(parameters, other.parameters) &&
      get == other.get &&
      put == other.put &&
      post == other.post &&
      delete == other.delete &&
      options == other.options &&
      head == other.head &&
      patch == other.patch &&
      trace == other.trace;

  @override
  int get hashCode =>
      const ListEquality().hash(parameters) +
      get.hashCode +
      put.hashCode +
      post.hashCode +
      delete.hashCode +
      options.hashCode +
      head.hashCode +
      patch.hashCode +
      trace.hashCode;
}

// ignore_for_file: public_member_api_docs

class Spec {
  Spec({
    required this.version,
    required this.info,
    required this.paths,
    this.servers,
    this.security,
    this.components,
  });

  Map<String, dynamic> toMap() => {
        'openapi': version,
        'info': info.toMap(),
        if (servers != null) 'servers': servers!.map((final s) => s.toMap()).toList(),
        if (security != null) 'security': security!,
        if (components != null) 'components': components!.toMap(),
        'paths': paths.map((final key, final value) => MapEntry(key, value.toMap())),
      };

  final String version;
  final Info info;
  final Map<String, Path> paths;
  final List<Server>? servers;
  final Components? components;
  final List<Map<String, List>>? security;
}

class Info {
  Info({
    required this.title,
    required this.version,
    this.description,
    this.license,
  });

  Map<String, dynamic> toMap() => {
        'title': title,
        'version': version,
        if (description != null) 'description': description,
        if (license != null) 'license': license!.toMap(),
      };

  final String title;
  final String version;
  final String? description;
  final License? license;
}

class License {
  License({
    required this.name,
    this.url,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        if (url != null) 'url': url,
      };

  final String name;
  final String? url;
}

class Server {
  Server({
    required this.url,
    this.description,
    this.variables,
  });

  final String url;
  final String? description;
  final Map<String, ServerVariable>? variables;

  Map<String, dynamic> toMap() => {
        'url': url,
        if (description != null) 'description': description,
        if (variables != null)
          'variables': variables!.map(
            (final key, final value) => MapEntry(
              key,
              value.toMap(),
            ),
          ),
      };
}

class ServerVariable {
  ServerVariable({
    required this.default_,
    this.enum_,
    this.description,
  });

  final String default_;
  final List<String>? enum_;
  final String? description;

  Map<String, dynamic> toMap() => {
        if (enum_ != null) 'enum': enum_,
        'default': default_,
        if (description != null) 'description': description,
      };
}

class Path {
  Path({
    this.summary,
    this.description,
    this.servers,
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

  Map<String, dynamic> toMap() => {
        if (summary != null) 'summary': summary,
        if (description != null) 'description': description,
        if (servers != null) 'servers': servers!.map((final s) => s.toMap()).toList(),
        if (parameters != null && parameters!.isNotEmpty)
          'parameters': parameters!.map((final p) => p.toMap()).toList(),
        if (get != null) 'get': get!.toMap(),
        if (put != null) 'put': put!.toMap(),
        if (post != null) 'post': post!.toMap(),
        if (delete != null) 'delete': delete!.toMap(),
        if (options != null) 'options': options!.toMap(),
        if (head != null) 'head': head!.toMap(),
        if (patch != null) 'patch': patch!.toMap(),
        if (trace != null) 'trace': trace!.toMap(),
      };

  final String? summary;
  final String? description;
  final List<Server>? servers;
  final List<Parameter>? parameters;
  Operation? get;
  Operation? put;
  Operation? post;
  Operation? delete;
  Operation? options;
  Operation? head;
  Operation? patch;
  Operation? trace;
}

class Parameter {
  Parameter({
    required this.name,
    required this.in_,
    this.description,
    this.required,
    this.deprecated,
    this.allowEmptyValue,
    this.schema,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'in': in_,
        if (description != null) 'description': description,
        if (required != null) 'required': required,
        if (deprecated != null) 'deprecated': deprecated,
        if (allowEmptyValue != null) 'allowEmptyValue': allowEmptyValue,
        if (schema != null) 'schema': schema,
      };

  final String name;
  final String in_;
  final String? description;
  final bool? required;
  final bool? deprecated;
  final bool? allowEmptyValue;
  final Map<String, dynamic>? schema;
}

class Operation {
  Operation({
    required this.responses,
    this.parameters,
    this.operationID,
  });

  Map<String, dynamic> toMap() => {
        if (operationID != null) ...{
          'operationId': operationID,
        },
        if (parameters != null) ...{
          'parameters': parameters!.map((final p) => p.toMap()).toList(),
        },
        'responses': responses.map(
          (final key, final value) => MapEntry(
            key.toString(),
            value.toMap(),
          ),
        ),
      };

  final Map<dynamic, Response> responses;
  final List<Parameter>? parameters;
  final String? operationID;
}

class Response {
  Response({
    required this.description,
    this.content,
  });

  Map<String, dynamic> toMap() => {
        'description': description,
        if (content != null)
          'content': content!.map(
            (final key, final value) => MapEntry(
              key,
              value.toMap(),
            ),
          ),
      };

  final String description;
  final Map<String, MediaType>? content;
}

class MediaType {
  MediaType({
    this.schema,
  });

  Map<String, dynamic> toMap() => {
        'schema': schema,
      };

  final Map<String, dynamic>? schema;
}

class Components {
  Components({
    this.securitySchemes,
  });

  Map<String, dynamic> toMap() => {
        if (securitySchemes != null)
          'securitySchemes': securitySchemes!.map((final key, final value) => MapEntry(key, value.toMap()))
      };

  final Map<String, SecurityScheme>? securitySchemes;
}

class SecurityScheme {
  SecurityScheme({
    required this.type,
    required this.scheme,
    this.description,
  });

  Map<String, dynamic> toMap() => {
        'type': type,
        'scheme': scheme,
        if (description != null) 'description': description,
      };

  final String type;
  final String scheme;
  final String? description;
}

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite/src/models/components.dart';
import 'package:dynamite/src/models/discriminator.dart';
import 'package:dynamite/src/models/header.dart';
import 'package:dynamite/src/models/info.dart';
import 'package:dynamite/src/models/license.dart';
import 'package:dynamite/src/models/media_type.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/operation.dart';
import 'package:dynamite/src/models/parameter.dart';
import 'package:dynamite/src/models/path_item.dart';
import 'package:dynamite/src/models/request_body.dart';
import 'package:dynamite/src/models/response.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/models/security_scheme.dart';
import 'package:dynamite/src/models/server.dart';
import 'package:dynamite/src/models/server_variable.dart';
import 'package:dynamite/src/models/tag.dart';

part 'serializers.g.dart';

@SerializersFor([
  Components,
  Discriminator,
  Header,
  Info,
  License,
  MediaType,
  OpenAPI,
  Operation,
  Parameter,
  PathItem,
  RequestBody,
  Response,
  Schema,
  SecurityScheme,
  Server,
  ServerVariable,
  Tag,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltMap, [
          FullType(String),
          FullType(BuiltList, [FullType(String)]),
        ]),
        MapBuilder<String, BuiltList<String>>.new,
      )
      ..addPlugin(StandardJsonPlugin()))
    .build();

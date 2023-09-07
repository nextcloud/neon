// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math';

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
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

Components getComponents() => Components(
      securitySchemes: {'': getSecurityScheme()},
      schemas: {'': getSchema()},
    );

Discriminator getDiscriminator() => Discriminator(
      propertyName: '',
      mapping: {'': ''},
    );

Header getHeader() => Header(
      description: getRandomString(),
      required: true,
      schema: getSchema(),
    );

Info getInfo() => Info(
      title: getRandomString(),
      version: '',
      license: getLicense(),
      description: getRandomString(),
    );

License getLicense() => License(
      name: '',
      identifier: '',
      url: '',
    );

MediaType getMediaType() => MediaType(
      schema: getSchema(),
    );

OpenAPI getOpenAPI() => OpenAPI(
      version: '',
      info: getInfo(),
      servers: [getServer()],
      security: [
        {
          '': [''],
        }
      ],
      tags: [getTag()],
      components: getComponents(),
      paths: {'': getPathItem()},
    );

Operation getOperation() => Operation(
      operationId: '',
      summary: getRandomString(),
      description: getRandomString(),
      deprecated: true,
      tags: [''],
      parameters: [getParameter()],
      requestBody: getRequestBody(),
      responses: {'': getResponse()},
      security: [
        {
          '': [''],
        }
      ],
    );

Parameter getParameter() => Parameter(
      name: '',
      in_: '',
      description: getRandomString(),
      required: true,
      schema: getSchema(),
    );

PathItem getPathItem() => PathItem(
      description: getRandomString(),
      parameters: [getParameter()],
      get: getOperation(),
      put: getOperation(),
      post: getOperation(),
      delete: getOperation(),
      options: getOperation(),
      head: getOperation(),
      patch: getOperation(),
      trace: getOperation(),
    );

RequestBody getRequestBody() => RequestBody(
      description: getRandomString(),
      content: {'': getMediaType()},
      required: true,
    );

Response getResponse() => Response(
      description: getRandomString(),
      content: {'': getMediaType()},
      headers: {'': getHeader()},
    );

Schema getSchema() => Schema(
      ref: '',
      oneOf: [Schema()],
      anyOf: [Schema()],
      allOf: [Schema()],
      description: getRandomString(),
      deprecated: true,
      type: '',
      format: '',
      default_: '',
      enum_: [''],
      properties: {'': Schema()},
      required: [''],
      items: Schema(),
      additionalProperties: Schema(),
      contentMediaType: '',
      contentSchema: Schema(),
      discriminator: getDiscriminator(),
      pattern: '',
      minLength: 0,
      maxLength: 0,
      nullable: true,
    );

SecurityScheme getSecurityScheme() => SecurityScheme(
      type: '',
      description: getRandomString(),
      scheme: '',
    );

Server getServer() => Server(
      url: '',
      variables: {'': getServerVariable()},
    );

ServerVariable getServerVariable() => ServerVariable(
      default_: '',
      enum_: [''],
      description: getRandomString(),
    );

Tag getTag() => Tag(
      name: '',
      description: getRandomString(),
    );

void expectSame(final dynamic a, final dynamic b) {
  expect(a, equals(b));
  expect(a.hashCode, equals(b.hashCode));
}

String getRandomString() {
  final r = Random();
  return String.fromCharCodes(List.generate(16, (final index) => r.nextInt(33) + 89));
}

void main() {
  test('Components', () {
    expectSame(getComponents(), getComponents());
  });

  test('Discriminator', () {
    expectSame(getDiscriminator(), getDiscriminator());
  });

  test('Header', () {
    expectSame(getHeader(), getHeader());
  });

  test('Info', () {
    expectSame(getInfo(), getInfo());
  });

  test('License', () {
    expectSame(getLicense(), getLicense());
  });

  test('MediaType', () {
    expectSame(getMediaType(), getMediaType());
  });

  test('OpenAPI', () {
    expectSame(getOpenAPI(), getOpenAPI());
  });

  test('Operation', () {
    expectSame(getOperation(), getOperation());
  });

  test('Parameter', () {
    expectSame(getParameter(), getParameter());
  });

  test('PathItem', () {
    expectSame(getPathItem(), getPathItem());
  });

  test('RequestBody', () {
    expectSame(getRequestBody(), getRequestBody());
  });

  test('Response', () {
    expectSame(getResponse(), getResponse());
  });

  test('Schema', () {
    expectSame(getSchema(), getSchema());
  });

  test('SecurityScheme', () {
    expectSame(getSecurityScheme(), getSecurityScheme());
  });

  test('Server', () {
    expectSame(getServer(), getServer());
  });

  test('ServerVariable', () {
    expectSame(getServerVariable(), getServerVariable());
  });

  test('Tag', () {
    expectSame(getTag(), getTag());
  });
}

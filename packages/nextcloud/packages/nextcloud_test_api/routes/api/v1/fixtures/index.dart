import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nextcloud_test_api/api.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _put(context);
    case HttpMethod.post:
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
      return Response.json(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _put(RequestContext context) async {
  final request = context.request;
  final params = request.uri.queryParameters;
  final fixtureID = params['fixtureID'];

  final dataSource = context.read<NextcloudTestState>();

  final fixture = dataSource.getFixture(fixtureID: fixtureID);

  return Response.json(
    body: ValidateFixtureResponse((b) {
      b.fixture = fixture;
    }),
    statusCode: fixture != null ? HttpStatus.ok : HttpStatus.notFound,
  );
}

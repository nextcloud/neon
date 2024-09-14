import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nextcloud_test_api/api.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.get:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response.json(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context) async {
  final request = context.request;
  final body = await request.body();
  final preset = Preset.fromJson(
    jsonDecode(body) as Map<String, dynamic>,
  );

  final dataSource = context.read<NextcloudTestState>();

  final target = await dataSource.setup(
    preset: preset,
  );

  return Response.json(
    body: SetupResponse((b) {
      b
        ..hostURL = target.hostURL
        ..targetURL = target.targetURL;
    }),
  );
}

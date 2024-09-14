import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nextcloud_test_api/api.dart';

FutureOr<Response> onRequest(RequestContext context, String group) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _post(context, group);
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response.json(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _post(RequestContext context, String group) async {
  final dataSource = context.read<NextcloudTestState>();
  final presets = dataSource.getPresets(group);

  if (presets.isEmpty) {
    return Response.json(statusCode: HttpStatus.notFound);
  }

  return Response.json(
    body: GetPresetsResponse((b) {
      b.presets.addAll(presets);
    }),
  );
}

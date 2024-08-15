import 'dart:convert';
import 'dart:typed_data';

import 'package:dynamite_end_to_end_test/request_body.openapi.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() async {
  test('Request body parameter name conflict', () async {
    // No body
    var client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.body, isEmpty);
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.post();

    // with body
    client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.bodyBytes, utf8.encode('value'));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.post($body: 'value');
  });

  test('Request Object body', () async {
    // No body
    var client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.body, json.encode({}));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.getObject();

    // with required body and field default
    client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.body, json.encode({'test': '123'}));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.postObject(
      $body: PostObjectRequestApplicationJson(
        (b) => b..test = '123',
      ),
    );

    // with nullable body
    client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.body, json.encode({'test': '123'}));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.putObject();

    // with body with default
    client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.body, json.encode({'test': '123'}));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.deleteObject();
  });

  test('Request Binary body', () async {
    // No body
    var client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.bodyBytes, <int>[]);
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.getBinary();

    // with required body and field default
    client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.bodyBytes, utf8.encode('test'));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.postBinary(
      $body: Uint8List.fromList([116, 101, 115, 116]),
    );

    // with body with default
    client = $Client(
      Uri.parse('example.com'),
      httpClient: MockClient((request) async {
        expect(request.bodyBytes, utf8.encode('test'));
        return Response('{}', 200, headers: {'content-type': 'application/json'});
      }),
    );
    await client.putBinary();
  });
}

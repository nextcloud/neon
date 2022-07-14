// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

extension HttpClientResponseBody on HttpClientResponse {
  Future<Uint8List> get bodyBytes async =>
      Uint8List.fromList((await toList()).reduce((final value, final element) => [...value, ...element]));

  Future<String> get body async => utf8.decode(await bodyBytes);
}

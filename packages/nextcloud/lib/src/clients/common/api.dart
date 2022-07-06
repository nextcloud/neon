//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'model/ocs_meta.dart';

const apiDelimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const apiDateEpochMarker = 'epoch';
final apiDateFormatter = DateFormat('yyyy-MM-dd');
final apiRegList = RegExp(r'^List<(.*)>$');
final apiRegSet = RegExp(r'^Set<(.*)>$');
final apiRegMap = RegExp(r'^Map<String,(.*)>$');

abstract class ApiInstance<T extends BaseApiClient> {
  ApiInstance(this.apiClient);

  final T apiClient;
}

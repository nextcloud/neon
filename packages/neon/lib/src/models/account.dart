import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'account.g.dart';

String userAgent(final PackageInfo packageInfo) => 'Neon ${packageInfo.version}+${packageInfo.buildNumber}';

@JsonSerializable()
class Account {
  Account({
    required this.serverURL,
    required this.username,
    this.password,
    this.appPassword,
  }) : assert(
          (password != null && appPassword == null) || (password == null && appPassword != null),
          'Either password or appPassword has to be set',
        );

  factory Account.fromJson(final Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  final String serverURL;
  final String username;
  final String? password;
  final String? appPassword;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(final Object other) =>
      other is Account &&
      other.serverURL == serverURL &&
      other.username == username &&
      other.password == password &&
      other.appPassword == appPassword;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => serverURL.hashCode + username.hashCode;

  String get id => client.id;

  NextcloudClient? _client;

  void setupClient(final PackageInfo packageInfo) {
    _client ??= NextcloudClient(
      serverURL,
      username: username,
      password: appPassword ?? password,
      userAgentOverride: userAgent(packageInfo),
    );
  }

  NextcloudClient get client {
    if (_client == null) {
      throw Exception('You need to call setupClient() first');
    }

    return _client!;
  }
}

Map<String, String> _idCache = {};

extension NextcloudClientHelpers on NextcloudClient {
  String get id {
    final key = '$username@$baseURL';
    if (_idCache[key] != null) {
      return _idCache[key]!;
    }
    return _idCache[key] = sha1.convert(utf8.encode(key)).toString();
  }

  String get humanReadableID {
    final uri = Uri.parse(baseURL);
    // Maybe also show path if it is not '/' ?
    return '${username!}@${uri.port != 443 ? '${uri.host}:${uri.port}' : uri.host}';
  }
}

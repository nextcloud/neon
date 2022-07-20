import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:harbour/src/harbour.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';

part 'account.g.dart';

String userAgentOverride() => 'Harbour ${Global.packageInfo.version}+${Global.packageInfo.buildNumber}';

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

  NextcloudClient get client => _client ??= NextcloudClient(
        serverURL,
        username: username,
        password: password ?? appPassword,
        userAgentOverride: userAgentOverride(),
      );
}

Map<String, String> _idCache = {};

extension NextcloudClientID on NextcloudClient {
  String get id {
    final key = '$username@$baseURL';
    if (_idCache[key] != null) {
      return _idCache[key]!;
    }
    return _idCache[key] = sha1.convert(utf8.encode(key)).toString();
  }
}

class AccountSpecificOptions {
  AccountSpecificOptions(this._storage);

  final Storage _storage;
  final _appIDsSubject = BehaviorSubject<Map<String?, LabelBuilder>>();

  late final List<Option> options = [
    initialApp,
  ];

  void updateApps(final List<NextcloudApp> apps) {
    if (apps.isEmpty) {
      return;
    }
    _appIDsSubject.add({
      null: (final context) => AppLocalizations.of(context).accountOptionsAutomatic,
      for (final app in apps) ...{
        app.id: (final _) => app.name!,
      },
    });
  }

  void dispose() {
    // ignore: discarded_futures
    _appIDsSubject.close();
    for (final option in options) {
      option.dispose();
    }
  }

  late final initialApp = SelectOption<String?>(
    storage: _storage,
    key: 'initial-app',
    label: (final context) => AppLocalizations.of(context).accountOptionsInitialApp,
    defaultValue: BehaviorSubject.seeded(null),
    values: _appIDsSubject,
  );
}

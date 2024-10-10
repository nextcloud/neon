import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/src/sync/models/mapping.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:synchronize/synchronize.dart';

@immutable
abstract interface class SyncImplementation<S extends SyncMapping<T1, T2>, T1, T2> implements Findable {
  @override
  String get id;

  FutureOr<SyncSources<T1, T2>> getSources(Account account, S mapping);

  Map<String, dynamic> serializeMapping(S mapping);

  S deserializeMapping(Map<String, dynamic> json);

  FutureOr<S?> addMapping(BuildContext context, Account account);

  String getMappingDisplayTitle(S mapping);

  String getMappingDisplaySubtitle(S mapping);

  String getMappingId(S mapping);

  Widget getConflictDetailsLocal(BuildContext context, T2 object);

  Widget getConflictDetailsRemote(BuildContext context, T1 object);
}

extension SyncImplementationGlobalUniqueMappingId
    on SyncImplementation<SyncMapping<dynamic, dynamic>, dynamic, dynamic> {
  String getGlobalUniqueMappingId(SyncMapping<dynamic, dynamic> mapping) =>
      '${mapping.accountId}-${mapping.appId}-${getMappingId(mapping)}';
}

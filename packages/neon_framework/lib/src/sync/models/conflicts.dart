import 'package:account_repository/account_repository.dart';
import 'package:neon_framework/src/sync/models/implementation.dart';
import 'package:neon_framework/src/sync/models/mapping.dart';
import 'package:synchronize/synchronize.dart';

class SyncConflicts<T1, T2> {
  SyncConflicts(
    this.account,
    this.implementation,
    this.mapping,
    this.conflicts,
  );

  final Account account;
  final SyncImplementation<SyncMapping<T1, T2>, T1, T2> implementation;
  final SyncMapping<T1, T2> mapping;
  final List<SyncConflict<T1, T2>> conflicts;
}

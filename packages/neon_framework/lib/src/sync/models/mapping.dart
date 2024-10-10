import 'package:meta/meta.dart';
import 'package:synchronize/synchronize.dart';

abstract interface class SyncMapping<T1, T2> {
  String get accountId;
  String get appId;
  SyncJournal get journal;

  /// This method can be implemented to watch local or remote changes and update the status accordingly.
  void watch(void Function() onUpdated) {}

  @mustBeOverridden
  void dispose() {}

  @override
  String toString() => 'SyncMapping(accountId: $accountId, appId: $appId)';
}

enum SyncMappingStatus {
  unknown,
  incomplete,
  complete,
}

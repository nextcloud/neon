import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';

/// Bloc for fetching Talk rooms
sealed class TalkBloc implements InteractiveBloc {
  /// Creates a new Talk Bloc instance.
  @internal
  factory TalkBloc(Account account) => _TalkBloc(account);
}

class _TalkBloc extends InteractiveBloc implements TalkBloc {
  _TalkBloc(this.account);

  final Account account;

  @override
  Future<void> refresh() async {}
}

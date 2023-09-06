import 'package:neon/models.dart';
import 'package:neon/src/models/disposable.dart';

/// Cache for [Account] specific [Disposable] objects.
class AccountCache<T extends Disposable> implements Disposable {
  AccountCache();

  final Map<String, T> _cache = {};

  /// Disposes all entries and clears the cache.
  @override
  void dispose() {
    _cache
      ..disposeAll()
      ..clear();
  }

  /// Updates the cache against the given [accounts].
  ///
  /// Every cache entry with an account no longer in [accounts] is removed and
  /// disposed. This method is in O(N²).
  void pruneAgainst(final Iterable<Account> accounts) {
    _cache.removeWhere((final key, final value) {
      if (accounts.tryFind(key) == null) {
        value.dispose();
        return true;
      }

      return false;
    });
  }

  /// The value for the given [account], or `null` if [account] is not in the cache.
  T? operator [](final Account account) => _cache[account.id];

  /// Associates the [account] with the given [value].
  ///
  /// If the account was already in the cache, its associated value is changed.
  /// Otherwise the account/value pair is added to the cache.
  void operator []=(final Account account, final T value) => _cache[account.id] = value;
}

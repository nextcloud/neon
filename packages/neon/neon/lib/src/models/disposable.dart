import 'package:meta/meta.dart';

/// Interface of a disposable class.
abstract interface class Disposable {
  /// Discards any resources used by the object. After this is called, the
  /// object is not in a usable state and should be discarded (calls to
  /// streams or other state should throw after the object is disposed).
  ///
  /// This method should only be called by the object's owner.
  @mustCallSuper
  void dispose();
}

extension DisposeableIterableBloc on Iterable<Disposable> {
  /// Calls [Disposable.dispose] on all entries.
  ///
  /// The disposed values will not be removed from the iteraable.
  void disposeAll() {
    for (final bloc in this) {
      bloc.dispose();
    }
  }
}

extension DisposeableMapBloc on Map<dynamic, Disposable> {
  /// Calls [Disposable.dispose] on all entries.
  ///
  /// The disposed values will not be removed from the map.
  /// Call [clear] to remove them.
  void disposeAll() {
    values.disposeAll();
  }
}

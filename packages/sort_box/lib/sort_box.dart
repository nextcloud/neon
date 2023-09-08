/// Signature of a function returning a [Comparable].
typedef ComparableGetter<T> = Comparable<Object> Function(T);

/// Sorting Box to sort [List]s on multiple properties.
class SortBox<T extends Enum, R> {
  /// Constructs a new SortBox.
  ///
  /// A *Box* is a record of a property and how to order it.
  SortBox(
    this._properties,
    this._boxes,
  );

  /// A mapping of all values [T] to their [ComparableGetter].
  final Map<T, ComparableGetter<R>> _properties;

  /// A mapping of values [T] to their *Boxes*.
  ///
  /// The Boxes are applied if two elements are considered equal regarding their property [T].
  final Map<T, Set<(T property, SortBoxOrder order)>> _boxes;

  /// Sorts the [input] list according to their [box].
  ///
  /// A box contains the property and [SortBoxOrder] how the list should be sorted.
  /// In case the property of two elements is considered equal all following boxes specified at `_boxes[property]` are applied.
  /// If specified [presort] will be applied before [box] and [_boxes].
  ///
  /// This function sorts the input in place and a reference to it mutating the provided list.
  List<R> sort(
    final List<R> input,
    final (T property, SortBoxOrder order) box, [
    final Set<(T property, SortBoxOrder order)>? presort,
  ]) {
    if (input.length <= 1) {
      return input;
    }

    final boxes = {
      ...?presort,
      box,
      ...?_boxes[box.$1],
    };

    final sorted = input..sort((final item1, final item2) => _compare(item1, item2, boxes.iterator..moveNext()));

    return sorted;
  }

  int _compare(
    final R item1,
    final R item2,
    final Iterator<(T property, SortBoxOrder order)> iterator,
  ) {
    final box = iterator.current;
    final (property, sortBoxOrder) = box;
    final comparableGetter = _properties[property]!;

    final comparable1 = comparableGetter(item1);
    final comparable2 = comparableGetter(item2);

    final order = switch (sortBoxOrder) {
      SortBoxOrder.ascending => comparable1.compareTo(comparable2),
      SortBoxOrder.descending => comparable2.compareTo(comparable1),
    };

    if (order == 0 && iterator.moveNext()) {
      return _compare(item1, item2, iterator);
    }

    return order;
  }
}

/// Sorting order used by [SortBox].
enum SortBoxOrder {
  /// Ascending sorting order.
  ascending,

  /// Descending sorting order.
  descending,
}

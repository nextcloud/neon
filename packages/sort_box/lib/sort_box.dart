// ignore_for_file: public_member_api_docs

typedef ComparableGetter<T> = Comparable Function(T);

class SortBox<T extends Enum, R> {
  SortBox(
    this._properties,
    this._boxes,
  );

  final Map<T, ComparableGetter<R>> _properties;
  final Map<T, Set<Box<T>>> _boxes;

  List<R> sort(final List<R> input, final Box<T> box) {
    if (input.length <= 1) {
      return input;
    }

    final sorted = input
      ..sort((final item1, final item2) => _compare(item1, item2, box, _boxes[box.property]?.iterator));

    return sorted;
  }

  int _compare(
    final R item1,
    final R item2,
    final Box<T> box,
    final Iterator<Box<T>>? iterator,
  ) {
    final comparableGetter = _properties[box.property]!;

    final comparable1 = comparableGetter(item1);
    final comparable2 = comparableGetter(item2);

    final order =
        box.order == SortBoxOrder.ascending ? comparable1.compareTo(comparable2) : comparable2.compareTo(comparable1);

    if (order == 0 && iterator != null && iterator.moveNext()) {
      return _compare(item1, item2, iterator.current, iterator);
    }

    return order;
  }
}

enum SortBoxOrder {
  ascending,
  descending,
}

class Box<T extends Enum> {
  Box(
    this.property,
    this.order,
  );

  final T property;
  final SortBoxOrder order;
}

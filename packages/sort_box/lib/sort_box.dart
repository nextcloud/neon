// ignore_for_file: public_member_api_docs

typedef ComparableGetter<T> = Comparable Function(T);

class SortBox<T extends Enum, R> {
  SortBox(
    this._properties,
    this._boxes,
  );

  final Map<T, ComparableGetter<R>> _properties;
  final Map<T, Set<(T property, SortBoxOrder order)>> _boxes;

  List<R> sort(final List<R> input, final (T property, SortBoxOrder order) box) {
    if (input.length <= 1) {
      return input;
    }

    final sorted = input..sort((final item1, final item2) => _compare(item1, item2, box, _boxes[box.$1]?.iterator));

    return sorted;
  }

  int _compare(
    final R item1,
    final R item2,
    final (T property, SortBoxOrder order) box,
    final Iterator<(T property, SortBoxOrder order)>? iterator,
  ) {
    final (property, sortBoxOrder) = box;
    final comparableGetter = _properties[property]!;

    final comparable1 = comparableGetter(item1);
    final comparable2 = comparableGetter(item2);

    final order = switch (sortBoxOrder) {
      SortBoxOrder.ascending => comparable1.compareTo(comparable2),
      SortBoxOrder.descending => comparable2.compareTo(comparable1),
    };

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

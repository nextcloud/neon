// ignore_for_file: public_member_api_docs

typedef ComparableGetter<T> = Comparable Function(T);

class SortBox<T extends Enum, R> {
  SortBox(
    this._properties,
    this._secondaryBoxes,
  );

  final Map<T, ComparableGetter<R>> _properties;
  final Map<T, Box<T>> _secondaryBoxes;

  List<R> sort(final List<R> input, final Box<T> box) {
    if (input.length <= 1) {
      return input;
    }

    final comparableGetter = _properties[box.property]!;
    final secondaryBox = _secondaryBoxes[box.property];
    final comparableGetter2 = _properties[secondaryBox?.property];

    return input
      ..sort(
        (final item1, final item2) {
          final first = _compare(item1, item2, box.order, comparableGetter);

          if (first == 0 && secondaryBox != null) {
            return _compare(item1, item2, secondaryBox.order, comparableGetter2!);
          }

          return first;
        },
      );
  }

  int _compare(final R item1, final R item2, final SortBoxOrder order, final ComparableGetter<R> getter) {
    final comparable1 = getter(item1);
    final comparable2 = getter(item2);

    return order == SortBoxOrder.ascending ? comparable1.compareTo(comparable2) : comparable2.compareTo(comparable1);
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

// ignore_for_file: public_member_api_docs

class SortBox<T extends Enum, R> {
  SortBox(
    this._properties,
    this._secondaryBoxes,
  );

  final Map<T, Comparable Function(R)> _properties;
  final Map<T, Box<T>> _secondaryBoxes;

  List<R> sort(
    final List<R> input,
    final Box<T> box, {
    final bool preventSecondarySort = false,
  }) {
    if (input.length <= 1) {
      return input;
    }

    final counters = <int, List<R>>{};
    final comparableGetter = _properties[box.property]!;

    for (final item1 in input) {
      var counter = 0;
      for (final item2 in input) {
        if (item2 != item1) {
          final comparable1 = comparableGetter(item1);
          final comparable2 = comparableGetter(item2);
          counter += box.order == SortBoxOrder.descending
              ? comparable1.compareTo(comparable2)
              : comparable2.compareTo(comparable1);
        }
      }
      if (counters[counter] == null) {
        counters[counter] = [];
      }
      counters[counter]!.add(item1);
    }

    final secondaryBox = _secondaryBoxes[box.property];

    final counterValues = counters.keys.toList()..sort((final a, final b) => b.compareTo(a));
    if (counterValues.length == 1 && counterValues.first == 0) {
      if (secondaryBox != null && !preventSecondarySort) {
        return sort(
          counters[0]!,
          secondaryBox,
          preventSecondarySort: true,
        );
      }

      return counters[0]!;
    }

    final output = <R>[];
    for (final counterValue in counterValues) {
      var values = counters[counterValue]!;
      if (secondaryBox != null) {
        values = sort(values, secondaryBox);
      }
      output.addAll(values);
    }

    return output;
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

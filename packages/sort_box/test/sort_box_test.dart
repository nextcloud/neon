import 'package:sort_box/sort_box.dart';
import 'package:test/test.dart';

enum FruitSort {
  alphabetical,
  count,
}

class Fruit {
  Fruit(
    this.name,
    this.count,
  );

  final String name;
  final int count;

  @override
  String toString() => 'Fruit(name: $name, count: $count)';
}

void main() {
  final sortBox = SortBox<FruitSort, Fruit>(
    {
      FruitSort.alphabetical: (final fruit) => fruit.name.toLowerCase(),
      FruitSort.count: (final fruit) => fruit.count,
    },
    {
      FruitSort.alphabetical: Box(FruitSort.count, SortBoxOrder.ascending),
      FruitSort.count: Box(FruitSort.alphabetical, SortBoxOrder.ascending),
    },
  );

  group('Primary', () {
    test('Alphabetical', () {
      final fruits = [
        Fruit('Apple', 1),
        Fruit('Banana', 2),
        Fruit('Apple', 3),
        Fruit('Banana', 4),
        Fruit('Apple', 5),
      ];
      final sorted = sortBox.sort(fruits, Box(FruitSort.alphabetical, SortBoxOrder.ascending));

      for (var i = 0; i < 3; i++) {
        expect(sorted[i].name, 'Apple');
      }
      for (var i = 3; i < 5; i++) {
        expect(sorted[i].name, 'Banana');
      }
    });

    test('Count', () {
      final fruits = [
        Fruit('Apple', 1),
        Fruit('Banana', 5),
        Fruit('Apple', 4),
        Fruit('Banana', 2),
        Fruit('Apple', 3),
      ];
      final sorted = sortBox.sort(fruits, Box(FruitSort.count, SortBoxOrder.ascending));

      final names = ['Apple', 'Banana', 'Apple', 'Apple', 'Banana'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, i + 1);
      }
    });
  });

  group('Secondary', () {
    test('Alphabetical', () {
      final fruits = [
        Fruit('Apple', 1),
        Fruit('Banana', 2),
        Fruit('Apple', 2),
        Fruit('Banana', 1),
        Fruit('Apple', 2),
      ];
      final sorted = sortBox.sort(fruits, Box(FruitSort.count, SortBoxOrder.ascending));

      final names = ['Apple', 'Banana', 'Apple', 'Apple', 'Banana'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }

      final counts = [1, 1, 2, 2, 2];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, counts[i]);
      }
    });

    test('Count', () {
      final fruits = [
        Fruit('Apple', 3),
        Fruit('Banana', 4),
        Fruit('Apple', 1),
        Fruit('Banana', 2),
        Fruit('Apple', 5),
      ];
      final sorted = sortBox.sort(fruits, Box(FruitSort.alphabetical, SortBoxOrder.ascending));

      for (var i = 0; i < 3; i++) {
        expect(sorted[i].name, 'Apple');
      }
      for (var i = 3; i < 5; i++) {
        expect(sorted[i].name, 'Banana');
      }
      final counts = [1, 3, 5, 2, 4];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].count, counts[i]);
      }
    });

    test('Primary all equal', () {
      final fruits = [
        Fruit('Coconut', 1),
        Fruit('Banana', 1),
        Fruit('Apple', 1),
        Fruit('Elderberry', 1),
        Fruit('Damson', 1),
      ];
      final sorted = sortBox.sort(fruits, Box(FruitSort.count, SortBoxOrder.ascending));

      final names = ['Apple', 'Banana', 'Coconut', 'Damson', 'Elderberry'];
      for (var i = 0; i < 5; i++) {
        expect(sorted[i].name, names[i]);
      }
    });
  });
}

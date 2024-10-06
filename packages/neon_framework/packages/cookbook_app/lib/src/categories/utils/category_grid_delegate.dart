import 'dart:math' as math;

import 'package:flutter/rendering.dart';

/// Controls the layout of the category cards in a grid.
class CategoryGridDelegate extends SliverGridDelegate {
  /// Creates a delegate for the category card layout.
  const CategoryGridDelegate({
    this.extent = 0.0,
  });

  /// The height extend the card will take.
  final double extent;

  static const double _maxCrossAxisExtent = 250;
  static const double _mainAxisSpacing = 8;
  static const double _crossAxisSpacing = 8;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    var crossAxisCount = (constraints.crossAxisExtent / (_maxCrossAxisExtent + _crossAxisSpacing)).ceil();
    // Ensure a minimum count of 1, can be zero and result in an infinite extent
    // below when the window size is 0.
    crossAxisCount = math.max(1, crossAxisCount);
    final double usableCrossAxisExtent = math.max(
      0,
      constraints.crossAxisExtent - _crossAxisSpacing * (crossAxisCount - 1),
    );
    final childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final childMainAxisExtent = childCrossAxisExtent + extent;

    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + _mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + _crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(CategoryGridDelegate oldDelegate) => oldDelegate.extent != extent;
}

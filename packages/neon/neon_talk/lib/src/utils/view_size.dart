import 'dart:math';
import 'dart:ui';

Size calculateViewSize(int count, Size constraints) {
  const aspectRatio = 2 / 3;
  Size? bestSize;

  for (var i = 1.0; i < min(constraints.width, constraints.height / aspectRatio) + 1; i++) {
    final width = i;
    final height = i * aspectRatio;
    if ((constraints.width ~/ width) * (constraints.height ~/ height) >= count) {
      bestSize = Size(
        width,
        height,
      );
    } else {
      break;
    }
  }

  return bestSize ?? Size.zero;
}

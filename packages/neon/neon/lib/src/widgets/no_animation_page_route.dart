part of '../../neon.dart';

class NoAnimationPageRoute extends MaterialPageRoute {
  NoAnimationPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Duration get transitionDuration => Duration.zero;
}

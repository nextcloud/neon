import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class NeonTabBar extends InheritedWidget {
  const NeonTabBar({
    required this.tabBarLayout,
    required super.child,
    super.key,
  });

  final SlotLayout tabBarLayout;

  static NeonTabBar? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NeonTabBar>();
  }

  static NeonTabBar of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No NeonTabBar found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NeonTabBar oldWidget) =>
      tabBarLayout != oldWidget.tabBarLayout;
}

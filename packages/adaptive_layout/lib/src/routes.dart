import 'package:adaptive_layout/src/files/files.dart';
import 'package:adaptive_layout/src/main_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _appsKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootKey,
  initialLocation: const FilesAppRoute().location,
  routes: [
    ShellRoute(
      navigatorKey: _appsKey,
      builder: (context, state, navigator) {
        return NeonMainView(
          state: state,
          view: navigator,
        );
      },
      routes: [
        ...apps.map((a) => a.route),
      ],
    ),
  ],
);

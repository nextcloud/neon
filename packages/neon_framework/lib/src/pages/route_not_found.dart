import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/router.dart';

@internal
class RouteNotFoundPage extends StatelessWidget {
  const RouteNotFoundPage({
    required this.uri,
    super.key,
  });

  final Uri uri;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          onPressed: () {
            const HomeRoute().go(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            NeonLocalizations.of(context).errorRouteNotFound(uri.toString()),
          ),
        ),
      ),
    );
  }
}

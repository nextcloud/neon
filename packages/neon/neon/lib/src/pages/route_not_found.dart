import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neon/blocs.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RouteNotFoundPage extends StatefulWidget {
  const RouteNotFoundPage({
    required this.uri,
    super.key,
  });

  final Uri uri;

  @override
  State<RouteNotFoundPage> createState() => _RouteNotFoundPageState();
}

class _RouteNotFoundPageState extends State<RouteNotFoundPage> {
  @override
  void initState() {
    super.initState();

    unawaited(_checkLaunchable());
  }

  Future _checkLaunchable() async {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    if (!accountsBloc.hasAccounts) {
      return;
    }

    final activeAccount = accountsBloc.activeAccount.value!;

    final launched = await launchUrl(
      activeAccount.completeUri(widget.uri),
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      return;
    }

    if (context.mounted) {
      const HomeRoute().go(context);
    }
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: CloseButton(
            onPressed: () {
              const HomeRoute().go(context);
            },
          ),
        ),
        body: Center(
          child: Text(AppLocalizations.of(context).errorRouteNotFound(widget.uri.toString())),
        ),
      );
}

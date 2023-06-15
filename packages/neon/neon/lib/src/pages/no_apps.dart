import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';

@internal
class NoAppsPage extends StatelessWidget {
  const NoAppsPage({super.key});

  @override
  Widget build(final BuildContext context) => Center(
        child: Text(
          AppLocalizations.of(context).errorNoCompatibleNextcloudAppsFound,
          textAlign: TextAlign.center,
        ),
      );
}

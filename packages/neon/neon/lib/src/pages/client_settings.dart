import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:meta/meta.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/client_implementation.dart';
import 'package:neon/src/settings/widgets/option_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:neon/src/settings/widgets/settings_list.dart';
import 'package:neon/src/theme/dialog.dart';
import 'package:neon/src/utils/confirmation_dialog.dart';

@internal
class NextcloudClientSettingsPage extends StatelessWidget {
  const NextcloudClientSettingsPage({
    required this.clientImplementation,
    super.key,
  });

  final ClientImplementation clientImplementation;

  @override
  Widget build(final BuildContext context) {
    final appBar = AppBar(
      title: Text(clientImplementation.name(context)),
      actions: [
        IconButton(
          onPressed: () async {
            if (await showConfirmationDialog(
              context,
              NeonLocalizations.of(context).settingsResetForConfirmation(clientImplementation.name(context)),
            )) {
              clientImplementation.options.reset();
            }
          },
          tooltip: NeonLocalizations.of(context).settingsResetFor(clientImplementation.name(context)),
          icon: const Icon(MdiIcons.cogRefresh),
        ),
      ],
    );

    final body = SettingsList(
      categories: [
        for (final category in [...clientImplementation.options.categories, null]) ...[
          if (clientImplementation.options.options.where((final option) => option.category == category).isNotEmpty) ...[
            SettingsCategory(
              title: Text(
                category != null ? category.name(context) : NeonLocalizations.of(context).optionsCategoryOther,
              ),
              tiles: [
                for (final option
                    in clientImplementation.options.options.where((final option) => option.category == category)) ...[
                  OptionSettingsTile(option: option),
                ],
              ],
            ),
          ],
        ],
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Center(
        child: ConstrainedBox(
          constraints: NeonDialogTheme.of(context).constraints,
          child: body,
        ),
      ),
    );
  }
}

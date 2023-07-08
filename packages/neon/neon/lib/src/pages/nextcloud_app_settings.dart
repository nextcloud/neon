import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/settings/models/select_option.dart';
import 'package:neon/src/settings/models/toggle_option.dart';
import 'package:neon/src/settings/widgets/checkbox_settings_tile.dart';
import 'package:neon/src/settings/widgets/dropdown_button_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:neon/src/settings/widgets/settings_list.dart';
import 'package:neon/src/utils/confirmation_dialog.dart';

class NextcloudAppSettingsPage extends StatelessWidget {
  const NextcloudAppSettingsPage({
    required this.appImplementation,
    super.key,
  });

  final AppImplementation appImplementation;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appImplementation.name(context)),
          actions: [
            IconButton(
              onPressed: () async {
                if (await showConfirmationDialog(
                  context,
                  AppLocalizations.of(context).settingsResetForConfirmation(appImplementation.name(context)),
                )) {
                  appImplementation.options.reset();
                }
              },
              tooltip: AppLocalizations.of(context).settingsResetFor(appImplementation.name(context)),
              icon: Icon(MdiIcons.cogRefresh),
            ),
          ],
        ),
        body: SettingsList(
          categories: [
            for (final category in [...appImplementation.options.categories, null]) ...[
              if (appImplementation.options.options
                  .where((final option) => option.category == category)
                  .isNotEmpty) ...[
                SettingsCategory(
                  title: Text(
                    category != null ? category.name(context) : AppLocalizations.of(context).optionsCategoryOther,
                  ),
                  tiles: [
                    for (final option
                        in appImplementation.options.options.where((final option) => option.category == category)) ...[
                      if (option is ToggleOption) ...[
                        CheckBoxSettingsTile(
                          option: option,
                        ),
                      ] else if (option is SelectOption) ...[
                        DropdownButtonSettingsTile(
                          option: option,
                        ),
                      ],
                    ],
                  ],
                ),
              ],
            ],
          ],
        ),
      );
}

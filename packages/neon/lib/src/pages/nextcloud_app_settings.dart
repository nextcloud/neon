part of '../neon.dart';

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
                // ignore: use_build_context_synchronously
                if (await showConfirmationDialog(
                  context,
                  // ignore: use_build_context_synchronously
                  AppLocalizations.of(context).settingsResetForConfirmation(appImplementation.name(context)),
                )) {
                  await appImplementation.options.reset();
                }
              },
              icon: const Icon(MdiIcons.cogRefresh),
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

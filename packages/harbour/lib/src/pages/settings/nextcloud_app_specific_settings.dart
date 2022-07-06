part of '../../harbour.dart';

class NextcloudAppSpecificSettingsPage extends StatelessWidget {
  const NextcloudAppSpecificSettingsPage({
    required this.appImplementation,
    super.key,
  });

  final AppImplementation appImplementation;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).settingsForApp(appImplementation.name(context))),
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

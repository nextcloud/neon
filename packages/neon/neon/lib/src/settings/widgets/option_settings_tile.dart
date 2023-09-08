import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:neon/settings.dart';
import 'package:neon/src/settings/widgets/checkbox_settings_tile.dart';
import 'package:neon/src/settings/widgets/dropdown_button_settings_tile.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

@internal
class OptionSettingsTile extends InputSettingsTile {
  const OptionSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => switch (option) {
        ToggleOption() => CheckBoxSettingsTile(option: option as ToggleOption),
        SelectOption() => DropdownButtonSettingsTile(option: option as SelectOption),
      };
}

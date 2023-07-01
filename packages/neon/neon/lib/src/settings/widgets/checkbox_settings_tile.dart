import 'package:flutter/material.dart';
import 'package:neon/src/settings/models/toggle_option.dart';
import 'package:neon/src/settings/widgets/option_builder.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

class CheckBoxSettingsTile extends InputSettingsTile<ToggleOption> {
  const CheckBoxSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => OptionBuilder<bool>(
        option: option,
        builder: (final context, final value) => StreamBuilder<bool>(
          stream: option.enabled,
          builder: (final context, final enabledSnapshot) => !enabledSnapshot.hasData
              ? const SizedBox()
              : CheckboxListTile(
                  title: Text(option.label(context)),
                  value: value,
                  onChanged: enabledSnapshot.requireData
                      ? (final value) async {
                          await option.set(value!);
                        }
                      : null,
                ),
        ),
      );
}

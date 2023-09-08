import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

@internal
class CheckBoxSettingsTile extends InputSettingsTile<ToggleOption> {
  const CheckBoxSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder(
        valueListenable: option,
        builder: (final context, final value, final child) => CheckboxListTile.adaptive(
          enabled: option.enabled,
          title: child,
          value: value,
          onChanged: (final value) {
            option.value = value!;
          },
        ),
        child: Text(option.label(context)),
      );
}

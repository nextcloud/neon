import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/models/option.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

@internal
class ToggleSettingsTile extends InputSettingsTile<ToggleOption> {
  const ToggleSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder(
        valueListenable: option,
        builder: (final context, final value, final child) => SwitchListTile.adaptive(
          title: child,
          value: value,
          onChanged: option.enabled ? (final value) => option.value = value : null,
        ),
        child: Text(option.label(context)),
      );
}

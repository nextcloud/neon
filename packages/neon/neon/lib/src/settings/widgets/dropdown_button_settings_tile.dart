import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/models/select_option.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

@internal
class DropdownButtonSettingsTile<T> extends InputSettingsTile<SelectOption<T>> {
  const DropdownButtonSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ValueListenableBuilder(
        valueListenable: option,
        builder: (final context, final value, final child) => LayoutBuilder(
          builder: (final context, final constraints) => ListTile(
            enabled: option.enabled,
            title: child,
            trailing: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth * 0.5,
              ),
              child: IntrinsicWidth(
                child: DropdownButton<T>(
                  isExpanded: true,
                  value: value,
                  items: option.values.keys
                      .map(
                        (final k) => DropdownMenuItem(
                          value: k,
                          child: Text(
                            option.values[k]!(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: option.enabled
                      ? (final value) {
                          option.value = value as T;
                        }
                      : null,
                ),
              ),
            ),
          ),
        ),
        child: Text(
          option.label(context),
        ),
      );
}

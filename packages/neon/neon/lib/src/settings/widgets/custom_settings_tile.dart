import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

@internal
class CustomSettingsTile extends SettingsTile {
  const CustomSettingsTile({
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    super.key,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(final BuildContext context) => ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      );
}

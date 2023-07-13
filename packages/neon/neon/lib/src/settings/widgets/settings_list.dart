import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';

@internal
class SettingsList extends StatelessWidget {
  const SettingsList({
    required this.categories,
    super.key,
  });

  final List<SettingsCategory> categories;

  @override
  Widget build(final BuildContext context) => Scrollbar(
        child: ListView(
          primary: true,
          padding: const EdgeInsets.all(20),
          children: categories.cast<Widget>().intersperse(const Divider()).toList(),
        ),
      );
}

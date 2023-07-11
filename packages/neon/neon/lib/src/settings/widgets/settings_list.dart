import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/widgets/settings_category.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

@internal
class SettingsList extends StatelessWidget {
  const SettingsList({
    required this.categories,
    this.initialCategory,
    super.key,
  });

  final List<SettingsCategory> categories;
  final String? initialCategory;

  int? _getIndex(final String? initialCategory) {
    if (initialCategory == null) {
      return null;
    }

    final key = Key(initialCategory);
    final index = categories.indexWhere((final category) => category.key == key);

    return index != -1 ? index : null;
  }

  @override
  Widget build(final BuildContext context) => ScrollablePositionedList.separated(
        padding: const EdgeInsets.all(20),
        itemCount: categories.length,
        initialScrollIndex: _getIndex(initialCategory) ?? 0,
        itemBuilder: (final context, final index) => categories[index],
        separatorBuilder: (final context, final index) => const Divider(),
      );
}

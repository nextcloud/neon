part of '../../settings.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({
    required this.categories,
    super.key,
  });

  final List<SettingsCategory> categories;

  @override
  Widget build(final BuildContext context) => Scrollbar(
        interactive: true,
        child: ListView(
          primary: true,
          padding: const EdgeInsets.all(20),
          children: categories.cast<Widget>().intersperse(const Divider()).toList(),
        ),
      );
}

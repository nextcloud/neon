import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        Icons.person_outline,
        color: colorScheme.onPrimary,
      ),
      title: Text(
        name,
        style: TextStyle(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class NeonDrawerHeader extends StatelessWidget {
  const NeonDrawerHeader({
    this.name = 'NextCloud',
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            const Icon(
              Icons.cloud_outlined,
              size: 60,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class NeonSettingsDrawerItem extends StatelessWidget {
  const NeonSettingsDrawerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      // maybe drawerdestination
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          Icon(Icons.settings_outlined),
          SizedBox(width: 12),
          Text('settings'),
        ],
      ),
    );
  }
}

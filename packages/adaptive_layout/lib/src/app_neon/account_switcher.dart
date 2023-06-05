import 'package:adaptive_layout/src/app_neon/data.dart';
import 'package:flutter/material.dart';

class NeonAccountSwitcher extends StatefulWidget {
  const NeonAccountSwitcher({super.key});

  @override
  State<NeonAccountSwitcher> createState() => _NeonAccountSwitcherState();
}

class _NeonAccountSwitcherState extends State<NeonAccountSwitcher> {
  int _activeAccount = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        dropdownColor: colorScheme.primary,
        iconEnabledColor: colorScheme.onPrimary,
        value: _activeAccount,
        items: const [
          DropdownMenuItem(
            value: 0,
            child: DrawerItem(name: 'John Doe'),
          ),
          DropdownMenuItem(
            value: 1,
            child: DrawerItem(name: 'John Doe Work'),
          ),
        ],
        onChanged: (id) {
          setState(() {
            _activeAccount = id ?? 0;
          });
        },
      ),
    );
  }
}

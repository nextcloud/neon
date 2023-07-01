import 'package:flutter/widgets.dart';
import 'package:neon/src/settings/models/option.dart';

abstract class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
  });
}

abstract class InputSettingsTile<T extends Option> extends SettingsTile {
  const InputSettingsTile({
    required this.option,
    super.key,
  });

  final T option;
}

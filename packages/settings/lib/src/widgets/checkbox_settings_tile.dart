part of '../../settings.dart';

class CheckBoxSettingsTile extends InputSettingsTile<ToggleOption> {
  const CheckBoxSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => OptionBuilder<bool>(
        option: option,
        builder: (final context, final value) => StreamBuilder<bool>(
          stream: option.enabled,
          builder: (final context, final enabledSnapshot) => !enabledSnapshot.hasData
              ? Container()
              : CheckboxListTile(
                  title: Text(option.label(context)),
                  value: value,
                  onChanged: enabledSnapshot.requireData
                      ? (final value) async {
                          await option.set(value!);
                        }
                      : null,
                ),
        ),
      );
}

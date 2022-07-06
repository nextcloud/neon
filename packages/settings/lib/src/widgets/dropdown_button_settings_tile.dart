part of '../../settings.dart';

class DropdownButtonSettingsTile<T> extends InputSettingsTile<SelectOption<T>> {
  const DropdownButtonSettingsTile({
    required super.option,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => OptionBuilder<T>(
        option: option,
        builder: (
          final context,
          final value,
        ) =>
            StreamBuilder<bool>(
          stream: option.enabled,
          builder: (
            final context,
            final enabledSnapshot,
          ) =>
              StreamBuilder<Map<T, LabelBuilder>>(
            stream: option.values,
            builder: (
              final context,
              final valuesSnapshot,
            ) =>
                ListTile(
              title: Text(
                option.label(context),
                style: enabledSnapshot.data ?? false
                    ? null
                    : Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).disabledColor),
              ),
              trailing: valuesSnapshot.hasData
                  ? DropdownButtonHideUnderline(
                      child: DropdownButton<T>(
                        value: value,
                        items: valuesSnapshot.data!.keys
                            .map(
                              (final k) => DropdownMenuItem(
                                value: k,
                                child: Text(valuesSnapshot.data![k]!(context)),
                              ),
                            )
                            .toList(),
                        onChanged: enabledSnapshot.data ?? false
                            ? (final value) async {
                                await option.set(value as T);
                              }
                            : null,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      );
}

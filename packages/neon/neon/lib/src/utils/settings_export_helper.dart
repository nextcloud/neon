import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/app_implementation.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:settings/settings.dart';

class SettingsExportHelper {
  SettingsExportHelper({
    required this.globalOptions,
    required this.appImplementations,
    required this.accountSpecificOptions,
  });

  final GlobalOptions globalOptions;
  final Iterable<AppImplementation> appImplementations;
  final Map<Account, List<Option>> accountSpecificOptions;

  Future applyFromJson(final Map<String, dynamic> data) async {
    final globalOptionsData = data['global'] as Map<String, dynamic>;
    await _applyOptionsMapToOptions(
      globalOptions.options,
      globalOptionsData,
    );

    final appImplementationsData = data['apps'] as Map<String, dynamic>;
    for (final appId in appImplementationsData.keys) {
      final app = appImplementations.tryFind(appId);
      if (app == null) {
        return;
      }
      final appImplementationData = appImplementationsData[appId]! as Map<String, dynamic>;
      await _applyOptionsMapToOptions(
        app.options.options,
        appImplementationData,
      );
    }

    final accountsData = data['accounts'] as Map<String, dynamic>;
    for (final accountId in accountsData.keys) {
      final account = accountSpecificOptions.keys.tryFind(accountId);
      if (account == null) {
        return;
      }
      final accountData = accountsData[accountId]! as Map<String, dynamic>;
      await _applyOptionsMapToOptions(
        accountSpecificOptions[account]!,
        accountData,
      );
    }
  }

  Future _applyOptionsMapToOptions(final List<Option> options, final Map<String, dynamic> data) async {
    for (final optionKey in data.keys) {
      for (final option in options) {
        if (option.key == optionKey) {
          await option.set(await option.deserialize(data[optionKey]));
        }
      }
    }
  }

  Map<String, dynamic> toJsonExport() => {
        'global': {
          for (final option in globalOptions.options) ...{
            if (option.enabled.value) ...{
              option.key: option.serialize(),
            },
          },
        },
        'apps': {
          for (final appImplementation in appImplementations) ...{
            appImplementation.id: {
              for (final option in appImplementation.options.options) ...{
                if (option.enabled.value) ...{
                  option.key: option.serialize(),
                },
              },
            },
          },
        },
        'accounts': {
          for (final account in accountSpecificOptions.keys) ...{
            account.id: {
              for (final option in accountSpecificOptions[account]!) ...{
                if (option.enabled.value) ...{
                  option.key: option.serialize(),
                },
              },
            },
          },
        },
      };
}

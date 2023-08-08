import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/sync.dart';
import 'package:neon_framework/src/pages/sync_mapping_settings.dart';
import 'package:neon_framework/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon_framework/src/settings/widgets/settings_category.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/src/widgets/sync_status_icon.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final syncBloc = NeonProvider.of<SyncBloc>(context);
    final appImplementations =
        NeonProvider.of<Iterable<AppImplementation>>(context).where((app) => app.syncImplementation != null);

    final body = StreamBuilder(
      stream: syncBloc.mappingStatuses,
      builder: (context, mappingStatuses) => !mappingStatuses.hasData
          ? const SizedBox.shrink()
          : ListView(
              children: appImplementations.map(
                (appImplementation) {
                  final appName = NeonLocalizations.of(context).appImplementationName(appImplementation.id);
                  final appMappingStatuses = mappingStatuses.requireData.entries
                      .where((mappingStatus) => mappingStatus.key.appId == appImplementation.id);

                  return SettingsCategory(
                    title: Row(
                      children: [
                        appImplementation.buildIcon(),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(appName),
                      ],
                    ),
                    tiles: [
                      if (appMappingStatuses.isEmpty)
                        CustomSettingsTile(
                          title: Text(NeonLocalizations.of(context).syncOptionsNoSynchronizations(appName)),
                        ),
                      for (final mappingStatus in appMappingStatuses) ...[
                        CustomSettingsTile(
                          title: Text(appImplementation.syncImplementation!.getMappingDisplayTitle(mappingStatus.key)),
                          subtitle:
                              Text(appImplementation.syncImplementation!.getMappingDisplaySubtitle(mappingStatus.key)),
                          leading: NeonUserAvatar(
                            account: accountsBloc.accountByID(mappingStatus.key.accountId)!,
                            userStatusBloc: null,
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              await syncBloc.syncMapping(mappingStatus.key);
                            },
                            tooltip: NeonLocalizations.of(context).syncOptionsSyncNow,
                            iconSize: 30,
                            icon: SyncStatusIcon(
                              status: mappingStatus.value,
                            ),
                          ),
                          onTap: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => SyncMappingSettingsPage(
                                  mapping: mappingStatus.key,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                      CustomSettingsTile(
                        title: ElevatedButton.icon(
                          onPressed: () async {
                            final account = await showDialog<Account>(
                              context: context,
                              builder: (context) => const NeonAccountSelectionDialog(),
                            );
                            if (account == null) {
                              return;
                            }

                            if (!context.mounted) {
                              return;
                            }

                            final mapping = await appImplementation.syncImplementation!.addMapping(context, account);
                            if (mapping == null) {
                              return;
                            }

                            await syncBloc.addMapping(mapping);
                          },
                          icon: const Icon(MdiIcons.cloudSync),
                          label: Text(NeonLocalizations.of(context).syncOptionsAdd(appName)),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(NeonLocalizations.of(context).sync),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: NeonDialogTheme.of(context).constraints,
            child: body,
          ),
        ),
      ),
    );
  }
}

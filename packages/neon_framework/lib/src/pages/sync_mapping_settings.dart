import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/blocs/sync.dart';
import 'package:neon_framework/src/settings/widgets/option_settings_tile.dart';
import 'package:neon_framework/src/settings/widgets/settings_category.dart';
import 'package:neon_framework/src/settings/widgets/settings_list.dart';
import 'package:neon_framework/src/sync/models/mapping.dart';
import 'package:neon_framework/src/utils/dialog.dart';
import 'package:provider/provider.dart';

class SyncMappingSettingsPage extends StatelessWidget {
  const SyncMappingSettingsPage({
    required this.mapping,
    super.key,
  });

  final SyncMapping<dynamic, dynamic> mapping;

  @override
  Widget build(BuildContext context) {
    final syncBloc = Provider.of<SyncBloc>(context, listen: false);
    final options = syncBloc.getSyncMappingOptionsFor(mapping);

    return Scaffold(
      appBar: AppBar(
        title: Text(NeonLocalizations.of(context).sync),
        actions: [
          IconButton(
            onPressed: () async {
              if (await showConfirmationDialog(
                context: context,
                title: NeonLocalizations.of(context).syncOptionsRemoveConfirmation,
              )) {
                await syncBloc.removeMapping(mapping);

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
            tooltip: NeonLocalizations.of(context).syncOptionsRemove,
            icon: const Icon(MdiIcons.delete),
          ),
          IconButton(
            onPressed: () async {
              if (await showConfirmationDialog(
                context: context,
                title: NeonLocalizations.of(context).settingsResetAllConfirmation,
              )) {
                options.reset();
              }
            },
            tooltip: NeonLocalizations.of(context).settingsResetAll,
            icon: const Icon(MdiIcons.cogRefresh),
          ),
        ],
      ),
      body: SettingsList(
        categories: [
          SettingsCategory(
            title: Text(NeonLocalizations.of(context).optionsCategoryGeneral),
            tiles: [
              ToggleSettingsTile(
                option: options.automaticSync,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

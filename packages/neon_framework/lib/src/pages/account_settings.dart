import 'dart:async';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/user_details.dart';
import 'package:neon_framework/src/router.dart';
import 'package:neon_framework/src/settings/widgets/custom_settings_tile.dart';
import 'package:neon_framework/src/settings/widgets/option_settings_tile.dart';
import 'package:neon_framework/src/settings/widgets/settings_category.dart';
import 'package:neon_framework/src/settings/widgets/settings_list.dart';
import 'package:neon_framework/src/theme/dialog.dart';
import 'package:neon_framework/src/utils/account_options.dart';
import 'package:neon_framework/src/widgets/dialog.dart';
import 'package:neon_framework/src/widgets/settings_profile_section.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;
import 'package:provider/provider.dart';

/// Account settings page.
///
/// Displays settings for an [Account]. Settings are specified as `Option`s.
@internal
class AccountSettingsPage extends StatefulWidget {
  /// Creates a new account settings page for the given [account].
  const AccountSettingsPage({
    required this.account,
    super.key,
  });

  /// The account to display the settings for.
  final Account account;

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  late final AccountsBloc bloc;
  late final AccountOptions options;
  late final UserDetailsBloc userDetailsBloc;
  late final name = widget.account.humanReadableID;
  late final StreamSubscription<Object> errorSubscription;

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<AccountsBloc>(context);
    options = bloc.getOptionsFor(widget.account);
    userDetailsBloc = bloc.getUserDetailsBlocFor(widget.account);

    errorSubscription = userDetailsBloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });
  }

  @override
  void dispose() {
    unawaited(errorSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(widget.account.humanReadableID),
      actions: [
        IconButton(
          onPressed: () async {
            final decision = await showAdaptiveDialog<AccountDeletion>(
              context: context,
              builder: (context) => NeonAccountDeletionDialog(
                account: widget.account,
                capabilitiesBloc: bloc.getCapabilitiesBlocFor(widget.account),
              ),
            );

            switch (decision) {
              case null:
                break;
              case AccountDeletion.remote:
                if (context.mounted) {
                  await launchUrl(widget.account, '/index.php/settings/user/drop_account');
                }
              case AccountDeletion.local:
                final isActive = bloc.activeAccount.valueOrNull == widget.account;

                options.reset();
                bloc.removeAccount(widget.account);

                if (!context.mounted) {
                  return;
                }

                if (isActive) {
                  const HomeRoute().go(context);
                } else {
                  Navigator.of(context).pop();
                }
            }
          },
          tooltip: NeonLocalizations.of(context).accountOptionsRemove,
          icon: const Icon(Icons.logout),
        ),
        IconButton(
          onPressed: () async {
            final content =
                '${NeonLocalizations.of(context).settingsResetForConfirmation(name)} ${NeonLocalizations.of(context).settingsResetForExplanation}';
            final decision = await showAdaptiveDialog<bool>(
              context: context,
              builder: (context) => NeonConfirmationDialog(
                icon: const Icon(Icons.restart_alt),
                title: NeonLocalizations.of(context).settingsReset,
                content: Text(content),
              ),
            );

            if (decision ?? false) {
              options.reset();
            }
          },
          tooltip: NeonLocalizations.of(context).settingsResetFor(name),
          icon: const Icon(MdiIcons.cogRefresh),
        ),
      ],
    );

    final body = ResultBuilder.behaviorSubject(
      subject: userDetailsBloc.userDetails,
      builder: (context, userDetails) {
        final categories = <Widget>[_buildGeneralSection(context, options)];

        if (userDetails.hasError) {
          categories.add(
            NeonError(
              userDetails.error,
              type: NeonErrorType.listTile,
              onRetry: userDetailsBloc.refresh,
            ),
          );
        }
        if (userDetails.hasData) {
          categories
            ..add(
              _buildStorageSection(
                context,
                userDetails.requireData,
              ),
            )
            ..add(
              NeonSettingsProfileSection(
                userDetails: userDetails.requireData,
                onUpdateProperty: userDetailsBloc.updateProperty,
              ),
            );
        }

        return SettingsList(
          categories: categories,
        );
      },
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: NeonDialogTheme.of(context).constraints,
            child: Provider<Account>.value(
              value: widget.account,
              child: body,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGeneralSection(BuildContext context, AccountOptions options) {
    return SettingsCategory(
      title: Text(NeonLocalizations.of(context).optionsCategoryGeneral),
      tiles: [
        SelectSettingsTile(
          option: options.initialApp,
        ),
      ],
    );
  }

  Widget _buildStorageSection(
    BuildContext context,
    provisioning_api.UserDetails userDetails,
  ) {
    return SettingsCategory(
      title: Text(NeonLocalizations.of(context).accountOptionsCategoryStorageInfo),
      tiles: [
        CustomSettingsTile(
          title: LinearProgressIndicator(
            value: userDetails.quota.relative / 100,
            minHeight: isCupertino(context) ? 15 : null,
            borderRadius: BorderRadius.circular(isCupertino(context) ? 5 : 3),
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
          subtitle: Text(
            NeonLocalizations.of(context).accountOptionsQuotaUsedOf(
              filesize(userDetails.quota.used, 1),
              filesize(userDetails.quota.total, 1),
              userDetails.quota.relative.toString(),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/capabilities.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:neon_framework/src/utils/relative_time.dart';
import 'package:neon_framework/src/utils/user_status_clear_at.dart';
import 'package:neon_framework/src/widgets/account_tile.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:neon_framework/src/widgets/user_status_icon.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher_string.dart';

/// An button typically used in an [AlertDialog.adaptive].
///
/// It adaptively creates an [CupertinoDialogAction] based on the closest
/// [ThemeData.platform].

class NeonDialogAction extends StatelessWidget {
  /// Creates a new adaptive Neon dialog action.
  const NeonDialogAction({
    required this.onPressed,
    required this.child,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    super.key,
  });

  /// The callback that is called when the button is tapped or otherwise
  /// activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// Set to true if button is the default choice in the dialog.
  ///
  /// Default buttons have higher emphasis. Similar to
  /// [CupertinoDialogAction.isDefaultAction]. More than one action can have
  /// this attribute set to true in the same [Dialog].
  ///
  /// This parameters defaults to false and cannot be null.
  final bool isDefaultAction;

  /// Whether this action destroys an object.
  ///
  /// For example, an action that deletes an email is destructive.
  ///
  /// Defaults to false and cannot be null.
  final bool isDestructiveAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        if (isDestructiveAction) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.errorContainer,
              foregroundColor: colorScheme.onErrorContainer,
            ),
            onPressed: onPressed,
            child: child,
          );
        }

        if (isDefaultAction) {
          return ElevatedButton(onPressed: onPressed, child: child);
        }

        return OutlinedButton(onPressed: onPressed, child: child);

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(
          onPressed: onPressed,
          isDefaultAction: isDefaultAction,
          isDestructiveAction: isDestructiveAction,
          child: child,
        );
    }
  }
}

/// A Neon design dialog based on [AlertDialog.adaptive].
///
/// THis widget enforces the closest [NeonDialogTheme] and constraints the
/// [content] width accordingly. The [title] should never be larger than the
/// [NeonDialogTheme.constraints] and it it up to the caller to handle this.
class NeonDialog extends StatelessWidget {
  /// Creates a Neon dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const NeonDialog({
    this.icon,
    this.title,
    this.content,
    this.actions,
    this.automaticallyShowCancel = true,
    super.key,
  });

  /// {@template NeonDialog.icon}
  /// An optional icon to display at the top of the dialog.
  ///
  /// Typically, an [Icon] widget. Providing an icon centers the [title]'s text.
  /// {@endtemplate}
  final Widget? icon;

  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// It is up to the caller to enforce [NeonDialogTheme.constraints] is meat.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// {@template NeonDialog.content}
  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [AlertDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit, as the contents will otherwise overflow the dialog.
  ///
  /// The horizontal dimension of this widget is constrained by the closest
  /// [NeonDialogTheme.constraints].
  /// {@endtemplate}
  final Widget? content;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog with an [OverflowBar].
  ///
  /// Typically this is a list of [NeonDialogAction] widgets. It is recommended
  /// to set the [Text.textAlign] to [TextAlign.end] for the [Text] within the
  /// [TextButton], so that buttons whose labels wrap to an extra line align
  /// with the overall [OverflowBar]'s alignment within the dialog.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [OverflowBar] to separate the [title]
  /// from the [actions].
  final List<Widget>? actions;

  /// Whether to automatically show a cancel button when only less than two
  /// actions are supplied.
  ///
  /// This is needed for the ios where dialogs are not dismissible by tapping
  /// outside their boundary.
  ///
  /// Defaults to `true`.
  final bool automaticallyShowCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dialogTheme = NeonDialogTheme.of(context);

    var content = this.content;
    if (content != null) {
      content = ConstrainedBox(
        constraints: dialogTheme.constraints,
        child: content,
      );
    }

    final needsCancelAction = automaticallyShowCancel &&
        (actions == null || actions!.length <= 1) &&
        (theme.platform == TargetPlatform.iOS || theme.platform == TargetPlatform.macOS);

    return AlertDialog.adaptive(
      icon: icon,
      title: title,
      content: content,
      actions: [
        if (needsCancelAction)
          NeonDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              NeonLocalizations.of(context).actionCancel,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ...?actions,
      ],
    );
  }
}

/// A [NeonDialog] with predefined `actions` to confirm or decline.
class NeonConfirmationDialog extends StatelessWidget {
  /// Creates a new confirmation dialog.
  const NeonConfirmationDialog({
    required this.title,
    this.content,
    this.icon,
    this.confirmAction,
    this.declineAction,
    this.isDestructive = true,
    super.key,
  });

  /// The title of the dialog is displayed in a large font at the top of the
  /// dialog.
  ///
  /// It is up to the caller to enforce [NeonDialogTheme.constraints] is meat
  /// and the text does not overflow.
  final String title;

  /// {@macro NeonDialog.icon}
  final Widget? icon;

  /// {@macro NeonDialog.content}
  final Widget? content;

  /// An optional override for the confirming action.
  ///
  /// It is advised to wrap the action in a [Builder] to retain an up to date
  /// `context` for the Navigator.
  ///
  /// Typically this is a [NeonDialogAction] widget.
  final Widget? confirmAction;

  /// An optional override for the declining action.
  ///
  /// It is advised to wrap the action in a [Builder] to retain an up to date
  /// `context` for the Navigator.
  ///
  /// Typically this is a [NeonDialogAction] widget.
  final Widget? declineAction;

  /// Whether confirming this dialog destroys an object.
  ///
  /// For example, a warning dialog that when accepted deletes an email is
  /// considered destructive.
  /// This value will set the default confirming action to being destructive.
  ///
  /// Defaults to true and cannot be null.
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final confirm = confirmAction ??
        NeonDialogAction(
          isDestructiveAction: isDestructive,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            NeonLocalizations.of(context).actionContinue,
            textAlign: TextAlign.end,
          ),
        );

    final decline = declineAction ??
        NeonDialogAction(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            NeonLocalizations.of(context).actionCancel,
            textAlign: TextAlign.end,
          ),
        );

    return NeonDialog(
      icon: icon,
      title: Text(title),
      content: content,
      actions: [
        decline,
        confirm,
      ],
    );
  }
}

/// A [NeonDialog] that shows for renaming an object.
///
/// Use `showRenameDialog` to display this dialog.
///
/// When submitted the new value will be popped as a `String`.
/// If the new value is equal to the provided one `null` will be popped.
class NeonRenameDialog extends StatefulWidget {
  /// Creates a new Neon rename dialog.
  const NeonRenameDialog({
    required this.title,
    required this.value,
    super.key,
  });

  /// The title of the dialog.
  final String title;

  /// The initial value of the rename field.
  ///
  /// This is the current name of the object to be renamed.
  final String value;

  @override
  State<NeonRenameDialog> createState() => _NeonRenameDialogState();
}

class _NeonRenameDialogState extends State<NeonRenameDialog> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (controller.text != widget.value) {
      Navigator.of(context).pop(controller.text);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Material(
      child: TextFormField(
        autofocus: true,
        controller: controller,
        validator: (input) => validateNotEmpty(context, input),
        onFieldSubmitted: (_) {
          submit();
        },
      ),
    );

    return NeonDialog(
      title: Text(widget.title),
      content: Form(key: formKey, child: content),
      actions: [
        NeonDialogAction(
          isDefaultAction: true,
          onPressed: submit,
          child: Text(
            widget.title,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

/// A [NeonDialog] that informs the user about an error.
///
/// Use `showErrorDialog` to display this dialog.
class NeonErrorDialog extends StatelessWidget {
  /// Creates a new error dialog.
  const NeonErrorDialog({
    required this.content,
    this.title,
    super.key,
  });

  /// The (optional) title for the dialog.
  ///
  /// Defaults to [NeonLocalizations.errorDialog].
  final String? title;

  /// The content of the dialog.
  final String content;

  @override
  Widget build(BuildContext context) {
    final title = this.title ?? NeonLocalizations.of(context).errorDialog;

    final closeAction = NeonDialogAction(
      isDestructiveAction: true,
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        NeonLocalizations.of(context).actionClose,
        textAlign: TextAlign.end,
      ),
    );

    return NeonDialog(
      automaticallyShowCancel: false,
      icon: Icon(AdaptiveIcons.error),
      title: Text(title),
      content: Text(content),
      actions: [
        closeAction,
      ],
    );
  }
}

/// Account selection dialog.
///
/// Displays a list of all logged in accounts.
///
/// When one is selected the dialog gets pooped with the selected `Account`.
@internal
class NeonAccountSelectionDialog extends StatelessWidget {
  /// Creates a new account selection dialog.
  const NeonAccountSelectionDialog({
    this.highlightActiveAccount = false,
    this.showChangeStatusButton = true,
    this.children,
    super.key,
  });

  /// Whether the selected account is highlighted with a leading check icon.
  final bool highlightActiveAccount;

  /// Whether a button for setting the status of the active account should be shown.
  final bool showChangeStatusButton;

  /// The (optional) trailing children of this dialog.
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final dialogTheme = NeonDialogTheme.of(context);
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final accounts = accountsBloc.accounts.value;
    final activeAccount = accountsBloc.activeAccount.value!;

    final sortedAccounts = List.of(accounts)
      ..removeWhere((account) => account.id == activeAccount.id)
      ..insert(0, activeAccount);

    final tiles = sortedAccounts
        .map<Widget>(
          (account) => NeonAccountTile(
            account: account,
            userDetailsBloc: accountsBloc.getUserDetailsBlocFor(account),
            userStatusBloc: accountsBloc.getUserStatusBlocFor(account),
            trailing:
                highlightActiveAccount && account.id == activeAccount.id ? Icon(AdaptiveIcons.check_circle) : null,
            onTap: () {
              Navigator.of(context).pop(account);
            },
          ),
        )
        .toList();
    if (highlightActiveAccount && accounts.length > 1) {
      tiles.insert(1, const Divider());
    }
    if (showChangeStatusButton) {
      tiles.insert(
        1,
        TextButton.icon(
          onPressed: () async {
            await showDialog<void>(
              context: context,
              builder: (context) => const NeonUserStatusDialog(),
            );
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(AdaptiveIcons.edit),
          label: Text(NeonLocalizations.of(context).userStatusSetStatus),
        ),
      );
    }

    final body = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...tiles,
          ...?children,
        ],
      ),
    );

    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          padding: dialogTheme.padding,
          constraints: dialogTheme.constraints,
          child: body,
        ),
      ),
    );
  }
}

/// The way the account will be deleted.
@internal
enum AccountDeletion {
  /// The account is removed from the app.
  local,

  /// The account is deleted on the server.
  remote,
}

@internal

/// Displays a confirmation dialog for deleting the [account].
///
/// If the `drop_account` app is enabled the user can also choose to delete the account on the server
/// instead of only logging out the account.
///
/// Will pop a value of type [AccountDeletion] or null if the user canceled the dialog.
class NeonAccountDeletionDialog extends StatefulWidget {
  const NeonAccountDeletionDialog({
    required this.account,
    required this.capabilitiesBloc,
    super.key,
  });

  final Account account;

  final CapabilitiesBloc capabilitiesBloc;

  @override
  State<NeonAccountDeletionDialog> createState() => _NeonAccountDeletionDialogState();
}

class _NeonAccountDeletionDialogState extends State<NeonAccountDeletionDialog> {
  core.DropAccountCapabilities_DropAccount? dropAccountCapabilities;
  AccountDeletion value = AccountDeletion.local;
  late final StreamSubscription<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>>
      capabilitiesSubscription;

  void update(AccountDeletion value) {
    setState(() {
      this.value = value;
    });
  }

  @override
  void initState() {
    super.initState();

    capabilitiesSubscription = widget.capabilitiesBloc.capabilities.listen((result) {
      setState(() {
        dropAccountCapabilities = result.data?.capabilities.dropAccountCapabilities?.dropAccount;
        if (!(dropAccountCapabilities?.enabled ?? false)) {
          value = AccountDeletion.local;
        }
      });
    });
  }

  @override
  void dispose() {
    unawaited(capabilitiesSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = NeonLocalizations.of(context);

    const icon = Icon(Icons.logout);
    final title = localizations.accountOptionsRemove;
    final confirmAction = NeonDialogAction(
      isDestructiveAction: true,
      onPressed: () {
        Navigator.of(context).pop(value);
      },
      child: Text(
        localizations.actionContinue,
        textAlign: TextAlign.end,
      ),
    );
    final declineAction = NeonDialogAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        localizations.actionCancel,
        textAlign: TextAlign.end,
      ),
    );

    final capabilities = dropAccountCapabilities;
    if (capabilities == null) {
      return NeonConfirmationDialog(
        icon: icon,
        title: title,
        content: Text(localizations.accountOptionsRemoveConfirm(widget.account.humanReadableID)),
        confirmAction: confirmAction,
        declineAction: declineAction,
      );
    }

    Widget? subtitle;
    final details = capabilities.details;
    if (details != null) {
      subtitle = Text(details);
    } else if (capabilities.delay.enabled) {
      subtitle = Text(
        localizations.accountOptionsRemoveRemoteDelay(
          Duration(hours: capabilities.delay.hours).formatRelative(
            localizations,
            includeSign: false,
          ),
        ),
      );
    }

    return NeonDialog(
      icon: icon,
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            RadioListTile(
              value: AccountDeletion.local,
              groupValue: value,
              onChanged: (value) => update(value!),
              title: Text(localizations.accountOptionsRemoveLocal),
            ),
            RadioListTile<AccountDeletion>(
              value: AccountDeletion.remote,
              groupValue: value,
              onChanged: capabilities.enabled ? (value) => update(value!) : null,
              title: Text(localizations.accountOptionsRemoveRemote),
              subtitle: subtitle,
            ),
          ],
        ),
      ),
      actions: [
        declineAction,
        confirmAction,
      ],
    );
  }
}

/// A [NeonDialog] to inform the user about the UnifiedPush feature of neon.
@internal
class NeonUnifiedPushDialog extends StatelessWidget {
  /// Creates a new UnifiedPush dialog.
  const NeonUnifiedPushDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeonDialog(
      title: Text(NeonLocalizations.of(context).nextPushSupported),
      content: Text(NeonLocalizations.of(context).nextPushSupportedText),
      actions: [
        NeonDialogAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            NeonLocalizations.of(context).actionCancel,
            textAlign: TextAlign.end,
          ),
        ),
        NeonDialogAction(
          isDefaultAction: true,
          onPressed: () async {
            Navigator.pop(context);
            await launchUrlString(
              'https://f-droid.org/packages/$unifiedPushNextPushID',
              mode: LaunchMode.externalApplication,
            );
          },
          child: Text(
            NeonLocalizations.of(context).nextPushSupportedInstall,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

/// Shows an emoji picker.
///
/// When the user selects an emoji the dialog will pop and return the emoji as a `String`.
class NeonEmojiPickerDialog extends StatelessWidget {
  /// Creates a new emoji picker dialog.
  const NeonEmojiPickerDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final constraints = NeonDialogTheme.of(context).constraints;

    return NeonDialog(
      content: SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxWidth * 1.5,
        child: EmojiPicker(
          config: Config(
            emojiViewConfig: const EmojiViewConfig(
              emojiSizeMax: 25,
              backgroundColor: Colors.transparent,
            ),
            categoryViewConfig: CategoryViewConfig(
              backgroundColor: Colors.transparent,
              indicatorColor: theme.colorScheme.primary,
              iconColorSelected: theme.colorScheme.primary,
            ),
            skinToneConfig: SkinToneConfig(
              dialogBackgroundColor: theme.dialogBackgroundColor,
              indicatorColor: theme.colorScheme.primary,
            ),
            bottomActionBarConfig: const BottomActionBarConfig(
              enabled: false,
            ),
          ),
          onEmojiSelected: (category, emoji) {
            Navigator.of(context).pop(emoji.emoji);
          },
        ),
      ),
    );
  }
}

/// Shows a dialog to set the user status.
class NeonUserStatusDialog extends StatefulWidget {
  /// Creates a new user status dialog.
  const NeonUserStatusDialog({
    @visibleForTesting this.now,
    super.key,
  });

  /// The current time, only used for testing.
  final tz.TZDateTime? now;

  @override
  State<NeonUserStatusDialog> createState() => _NeonUserStatusDialogState();
}

class _NeonUserStatusDialogState extends State<NeonUserStatusDialog> {
  late final UserStatusBloc bloc;
  final messageController = TextEditingController();
  late final StreamSubscription<Result<user_status.$PublicInterface?>> statusSubscription;

  late final onlineStatuses = {
    user_status.$Type.online: (
      [user_status.$Type.online],
      NeonLocalizations.of(context).userStatusOnline,
      null,
    ),
    user_status.$Type.dnd: (
      [user_status.$Type.dnd],
      NeonLocalizations.of(context).userStatusDoNotDisturb,
      NeonLocalizations.of(context).userStatusDoNotDisturbDescription
    ),
    user_status.$Type.away: (
      [user_status.$Type.away],
      NeonLocalizations.of(context).userStatusAway,
      null,
    ),
    user_status.$Type.invisible: (
      [user_status.$Type.invisible, user_status.$Type.offline],
      NeonLocalizations.of(context).userStatusInvisible,
      NeonLocalizations.of(context).userStatusInvisibleDescription
    ),
  };

  final predefinedClearAts = [
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.period
        ..time = ($int: 1800, clearAtTimeType: null),
    ),
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.period
        ..time = ($int: 3600, clearAtTimeType: null),
    ),
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.period
        ..time = ($int: 14400, clearAtTimeType: null),
    ),
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.endOf
        ..time = ($int: null, clearAtTimeType: user_status.ClearAtTimeType.day),
    ),
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.endOf
        ..time = ($int: null, clearAtTimeType: user_status.ClearAtTimeType.week),
    ),
  ];

  @override
  void dispose() {
    messageController.dispose();
    unawaited(statusSubscription.cancel());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<UserStatusBloc>(context);

    statusSubscription = bloc.status.listen((result) {
      if (result.hasData) {
        messageController.text = result.requireData.message ?? '';
      }
    });

    messageController.addListener(() {
      if ((bloc.status.valueOrNull?.data?.message ?? '') != messageController.text) {
        final clearAt = bloc.status.valueOrNull?.data?.clearAt;
        bloc.setCustomMessage(
          message: messageController.text,
          icon: bloc.status.valueOrNull?.data?.icon,
          clearAt: clearAt != null ? DateTimeUtils.fromSecondsSinceEpoch(tz.UTC, clearAt) : null,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      child: ResultBuilder.behaviorSubject(
        subject: bloc.predefinedStatuses,
        builder: (context, predefinedStatusesResult) => ResultBuilder.behaviorSubject(
          subject: bloc.status,
          builder: (context, statusResult) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                NeonLocalizations.of(context).userStatusOnlineStatus,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              NeonError(
                statusResult.error,
                onRetry: bloc.refresh,
              ),
              NeonLinearProgressIndicator(
                visible: statusResult.isLoading,
              ),
              buildOnlineStatuses(
                status: statusResult.data,
              ),
              const Divider(),
              Text(
                NeonLocalizations.of(context).userStatusStatusMessage,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              NeonError(
                predefinedStatusesResult.error,
                onRetry: bloc.refresh,
              ),
              NeonLinearProgressIndicator(
                visible: predefinedStatusesResult.isLoading,
              ),
              if (predefinedStatusesResult.hasData)
                buildPredefinedStatuses(
                  predefinedStatuses: predefinedStatusesResult.requireData,
                  status: statusResult.data,
                ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: NeonLocalizations.of(context).userStatusStatusMessage,
                  icon: SizedBox.square(
                    dimension: 50,
                    child: IconButton(
                      onPressed: () async {
                        final emoji = await showDialog<String>(
                          context: context,
                          builder: (context) => const NeonEmojiPickerDialog(),
                        );
                        if (emoji != null) {
                          final clearAt = bloc.status.valueOrNull?.data?.clearAt;
                          bloc.setCustomMessage(
                            message: bloc.status.valueOrNull?.data?.message,
                            icon: emoji,
                            clearAt: clearAt != null ? DateTimeUtils.fromSecondsSinceEpoch(tz.UTC, clearAt) : null,
                          );
                        }
                      },
                      icon: Text(
                        statusResult.data?.icon ?? '😀',
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildClearAt(
                status: statusResult.data,
              ),
            ],
          ),
        ),
      ),
    );

    return NeonDialog(
      content: body,
      automaticallyShowCancel: false,
      actions: [
        NeonDialogAction(
          onPressed: () {
            bloc.clearMessage();
            Navigator.of(context).pop();
          },
          child: Text(NeonLocalizations.of(context).userStatusActionClear),
        ),
        NeonDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(NeonLocalizations.of(context).actionClose),
        ),
      ],
    );
  }

  Widget buildOnlineStatuses({
    required user_status.$PublicInterface? status,
  }) =>
      buildGrid(
        children: onlineStatuses.entries.map(
          (onlineStatus) {
            final (types, title, subtitle) = onlineStatus.value;
            return buildCard(
              selected: types.contains(status?.status),
              child: ListTile(
                leading: NeonUserStatusIcon(
                  type: onlineStatus.key,
                  size: 24,
                ),
                title: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  subtitle ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  bloc.setStatusType(onlineStatus.key.value);
                },
              ),
            );
          },
        ).toList(),
      );

  Widget buildPredefinedStatuses({
    required BuiltList<user_status.Predefined> predefinedStatuses,
    required user_status.$PublicInterface? status,
  }) {
    final localizations = NeonLocalizations.of(context);

    final selectedPredefinedStatus = status is user_status.Private ? status.messageId : null;

    return buildGrid(
      children: predefinedStatuses.map(
        (status) {
          final clearAt = status.clearAt;

          return buildCard(
            selected: selectedPredefinedStatus == status.id,
            child: ListTile(
              leading: Text(
                status.icon,
                style: const TextStyle(fontSize: 18),
              ),
              title: Text(status.message),
              subtitle: Text(clearAt?.formatRelative(localizations) ?? localizations.userStatusClearAtDoNotClear),
              onTap: () {
                bloc.setPredefinedMessage(
                  id: status.id,
                  clearAt: clearAt?.toDateTime(widget.now),
                );
              },
            ),
          );
        },
      ).toList(),
    );
  }

  Widget buildClearAt({
    required user_status.$PublicInterface? status,
  }) {
    final localizations = NeonLocalizations.of(context);

    final selected = status?.clearAt != null
        ? user_status.ClearAt(
            (b) => b
              ..type = user_status.ClearAt_Type.period
              ..time = (
                $int: DateTimeUtils.fromSecondsSinceEpoch(
                  tz.UTC,
                  status!.clearAt!,
                ).difference(DateTime.timestamp()).inSeconds,
                clearAtTimeType: null
              ),
          )
        : null;

    return InputDecorator(
      decoration: InputDecoration(
        icon: Text(NeonLocalizations.of(context).userStatusClearAfter),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<user_status.ClearAt?>(
          onChanged: (clearAt) {
            bloc.setCustomMessage(
              message: bloc.status.valueOrNull?.data?.message,
              icon: bloc.status.valueOrNull?.data?.icon,
              clearAt: clearAt?.toDateTime(widget.now),
            );
          },
          value: selected,
          items: [
            if (selected != null) selected,
            null,
            ...predefinedClearAts,
          ]
              .map(
                (clearAt) => DropdownMenuItem(
                  value: clearAt,
                  enabled: selected == null || clearAt != selected,
                  child: Text(clearAt?.formatRelative(localizations) ?? localizations.userStatusClearAtDoNotClear),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget buildCard({
    required bool selected,
    required Widget child,
  }) =>
      Card(
        clipBehavior: Clip.hardEdge,
        shape: selected ? selectedBorder : null,
        child: child,
      );

  ShapeBorder get selectedBorder => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 1.5,
        ),
      );

  Widget buildGrid({
    required List<Widget> children,
  }) {
    final constraints = NeonDialogTheme.of(context).constraints;
    return Flexible(
      child: Wrap(
        children: children
            .map(
              (child) => SizedBox(
                height: 72,
                width: constraints.maxWidth / 2,
                child: child,
              ),
            )
            .toList(),
      ),
    );
  }
}

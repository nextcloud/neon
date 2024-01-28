import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_dashboard/l10n/localizations.dart';
import 'package:neon_dashboard/src/blocs/dashboard.dart';
import 'package:neon_dashboard/src/widgets/dry_intrinsic_height.dart';
import 'package:neon_dashboard/src/widgets/widget.dart';
import 'package:neon_dashboard/src/widgets/widget_button.dart';
import 'package:neon_dashboard/src/widgets/widget_item.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;

/// Displays the whole dashboard page layout.
class DashboardMainPage extends StatelessWidget {
  /// Creates a new dashboard main page.
  const DashboardMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = NeonProvider.of<DashboardBloc>(context);
    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    final userStatusBloc = accountsBloc.activeUserStatusBloc;

    return NeonCustomBackground(
      child: ResultBuilder.behaviorSubject(
        subject: bloc.widgets,
        builder: (context, result) {
          final children = <Widget>[
            _buildStatuses(
              account: accountsBloc.activeAccount.value!,
              userStatusBloc: userStatusBloc,
            ),
          ];

          if (result.hasData) {
            var minHeight = 504.0;

            final widgets = <Widget>[];
            for (final widget in result.requireData.entries) {
              final items = buildWidgetItems(
                context: context,
                widget: widget.key,
                items: widget.value,
              ).toList();

              final height = items.map((i) => i.height!).reduce((a, b) => a + b);
              minHeight = max(minHeight, height);

              widgets.add(
                DashboardWidget(
                  widget: widget.key,
                  children: items,
                ),
              );
            }

            children.add(
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: widgets
                    .map(
                      (widget) => SizedBox(
                        width: 320,
                        height: minHeight + 24,
                        child: widget,
                      ),
                    )
                    .toList(),
              ),
            );
          }

          return Center(
            child: NeonListView.custom(
              scrollKey: 'dashboard',
              isLoading: result.isLoading,
              error: result.error,
              onRefresh: bloc.refresh,
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: children
                      .intersperse(
                        const SizedBox(
                          height: 40,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatuses({
    required Account account,
    required UserStatusBloc userStatusBloc,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ResultBuilder.behaviorSubject(
            subject: userStatusBloc.status,
            builder: (context, statusResult) {
              if (statusResult.hasData) {
                final status = statusResult.requireData;

                final label = StringBuffer();
                if (status.icon == null && status.message == null) {
                  label.write(DashboardLocalizations.of(context).setUserStatus);
                } else {
                  if (status.icon != null) {
                    label.write(status.icon);
                  }
                  if (status.icon != null && status.message != null) {
                    label.write(' ');
                  }
                  if (status.message != null) {
                    label.write(status.message);
                  }
                }

                return _buildStatus(
                  context: context,
                  icon: NeonServerIcon(icon: 'user-status-${status.status == 'offline' ? 'invisible' : status.status}'),
                  label: Text(label.toString()),
                  onPressed: () async {
                    await showDialog<void>(
                      context: context,
                      builder: (context) => NeonUserStatusDialog(
                        account: account,
                      ),
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ]
            .intersperse(
              const SizedBox(
                width: 20,
              ),
            )
            .toList(),
      );

  Widget _buildStatus({
    required BuildContext context,
    required Widget icon,
    required Widget label,
    required VoidCallback onPressed,
  }) =>
      ActionChip(
        avatar: icon,
        label: label,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        padding: const EdgeInsets.all(15),
        onPressed: onPressed,
      );

  /// Builds the list of messages, [items] and buttons for a [widget].
  @visibleForTesting
  static Iterable<SizedBox> buildWidgetItems({
    required BuildContext context,
    required dashboard.Widget widget,
    required dashboard.WidgetItems? items,
  }) sync* {
    yield SizedBox(
      height: 64,
      child: DryIntrinsicHeight(
        child: ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: SizedBox.square(
            dimension: largeIconSize,
            child: _buildWidgetIcon(
              context: context,
              widget: widget,
            ),
          ),
        ),
      ),
    );

    yield const SizedBox(
      height: 20,
    );

    final halfEmptyContentMessage = _buildMessage(items?.halfEmptyContentMessage);
    final emptyContentMessage = _buildMessage(items?.emptyContentMessage);
    if (halfEmptyContentMessage != null) {
      yield halfEmptyContentMessage;
    }
    if (emptyContentMessage != null) {
      yield emptyContentMessage;
    }
    if (halfEmptyContentMessage == null && emptyContentMessage == null && (items?.items.isEmpty ?? true)) {
      yield _buildMessage(DashboardLocalizations.of(context).noEntries)!;
    }

    if (items?.items != null) {
      for (final item in items!.items) {
        yield SizedBox(
          height: 64,
          child: DryIntrinsicHeight(
            child: DashboardWidgetItem(
              item: item,
              roundIcon: widget.itemIconsRound,
            ),
          ),
        );
      }
    }

    yield const SizedBox(
      height: 20,
    );

    if (widget.buttons != null) {
      for (final button in widget.buttons!) {
        yield SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: DashboardWidgetButton(
              button: button,
            ),
          ),
        );
      }
    }
  }

  static Widget _buildWidgetIcon({
    required BuildContext context,
    required dashboard.Widget widget,
  }) {
    final colorFilter = ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn);

    if (widget.iconUrl.isNotEmpty) {
      return NeonUrlImage(
        uri: Uri.parse(widget.iconUrl),
        svgColorFilter: colorFilter,
        size: const Size.square(largeIconSize),
      );
    }

    if (widget.iconClass.isNotEmpty) {
      return NeonServerIcon(
        icon: widget.iconClass,
        colorFilter: colorFilter,
        size: largeIconSize,
      );
    }

    return Icon(
      Icons.question_mark,
      color: Theme.of(context).colorScheme.primary,
      size: largeIconSize,
    );
  }

  static SizedBox? _buildMessage(String? message) {
    if (message == null || message.isEmpty) {
      return null;
    }

    return SizedBox(
      height: 60,
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.check,
              size: largeIconSize,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}

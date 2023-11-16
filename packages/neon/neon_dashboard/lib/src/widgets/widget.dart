import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/theme.dart';
import 'package:neon/widgets.dart';
import 'package:neon_dashboard/l10n/localizations.dart';
import 'package:neon_dashboard/src/widgets/widget_button.dart';
import 'package:neon_dashboard/src/widgets/widget_item.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;

/// Displays a single dashboard widget and its items.
class DashboardWidget extends StatelessWidget {
  /// Creates a new dashboard widget items.
  const DashboardWidget({
    required this.widget,
    required this.items,
    super.key,
  });

  /// The dashboard widget to be displayed.
  final dashboard.Widget widget;

  /// The items of the widget to be displayed.
  final dashboard.WidgetItems? items;

  @override
  Widget build(final BuildContext context) {
    final halfEmptyContentMessage = _renderMessage(items?.halfEmptyContentMessage);
    final emptyContentMessage = _renderMessage(items?.emptyContentMessage);

    return SizedBox(
      width: 320,
      height: 560,
      child: Card(
        child: InkWell(
          onTap: widget.widgetUrl != null && widget.widgetUrl!.isNotEmpty ? () => context.go(widget.widgetUrl!) : null,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: ListView(
            padding: const EdgeInsets.all(8),
            key: PageStorageKey<String>('dashboard-${widget.id}'),
            children: [
              ListTile(
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: SizedBox.square(
                  dimension: largeIconSize,
                  child: _buildWidgetIcon(context),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (halfEmptyContentMessage != null) halfEmptyContentMessage,
              if (emptyContentMessage != null) emptyContentMessage,
              if (halfEmptyContentMessage == null && emptyContentMessage == null && (items?.items.isEmpty ?? true))
                _renderMessage(DashboardLocalizations.of(context).noEntries)!,
              ...?items?.items.map(
                (final item) => DashboardWidgetItem(
                  item: item,
                  roundIcon: widget.itemIconsRound,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...?widget.buttons?.map(
                (final button) => DashboardWidgetButton(
                  button: button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildWidgetIcon(final BuildContext context) {
    final colorFilter = ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn);

    if (widget.iconUrl.isNotEmpty) {
      return NeonUrlImage(
        url: widget.iconUrl,
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

  Widget? _renderMessage(final String? message) {
    if (message == null || message.isEmpty) {
      return null;
    }

    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.check,
            size: largeIconSize,
          ),
          Text(message),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:neon_dashboard/src/utils/find.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;
import 'package:rxdart/rxdart.dart';

/// Events for [DashboardBloc].
abstract class DashboardBlocEvents {}

/// States for [DashboardBloc].
abstract class DashboardBlocStates {
  /// Dashboard widgets that are displayed.
  BehaviorSubject<Result<Map<dashboard.Widget, dashboard.WidgetItems?>>> get widgets;
}

/// Implements the business logic for fetching dashboard widgets and their items.
class DashboardBloc extends InteractiveBloc implements DashboardBlocEvents, DashboardBlocStates {
  /// Creates a new Dashboard Bloc instance.
  ///
  /// Automatically starts fetching the widgets and their items and refreshes everything every 30 seconds.
  DashboardBloc(this._account) {
    unawaited(refresh());

    _timer = TimerBloc().registerTimer(const Duration(seconds: 30), refresh);
  }

  final Account _account;
  late final NeonTimer _timer;
  static const int _maxItems = 7;

  @override
  BehaviorSubject<Result<Map<dashboard.Widget, dashboard.WidgetItems?>>> widgets = BehaviorSubject();

  @override
  void dispose() {
    _timer.cancel();
    unawaited(widgets.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    widgets.add(widgets.valueOrNull?.asLoading() ?? Result.loading());

    try {
      final widgets = <String, dashboard.WidgetItems?>{};
      final v1WidgetIDs = <String>[];
      final v2WidgetIDs = <String>[];

      final response = await _account.client.dashboard.dashboardApi.getWidgets();

      for (final widget in response.body.ocs.data.values) {
        final itemApiVersions = widget.itemApiVersions;
        if (itemApiVersions != null && itemApiVersions.contains(2)) {
          v2WidgetIDs.add(widget.id);
        } else if (itemApiVersions == null || itemApiVersions.contains(1)) {
          // If the field isn't present the server only supports v1
          v1WidgetIDs.add(widget.id);
        } else {
          debugPrint('Widget supports none of the API versions: ${widget.id}');
        }
      }

      if (v1WidgetIDs.isNotEmpty) {
        debugPrint('Loading v1 widgets: ${v1WidgetIDs.join(', ')}');

        final response = await _account.client.dashboard.dashboardApi.getWidgetItems(
          widgets: v1WidgetIDs,
          // ignore: avoid_redundant_argument_values
          limit: _maxItems,
        );
        for (final entry in response.body.ocs.data.entries) {
          widgets[entry.key] = dashboard.WidgetItems(
            (final b) => b
              ..items = entry.value.sublist(0, min(entry.value.length, _maxItems)).toBuilder()
              ..emptyContentMessage = ''
              ..halfEmptyContentMessage = '',
          );
        }
      }

      if (v2WidgetIDs.isNotEmpty) {
        debugPrint('Loading v2 widgets: ${v2WidgetIDs.join(', ')}');

        final response = await _account.client.dashboard.dashboardApi.getWidgetItemsV2(
          widgets: v2WidgetIDs,
          // ignore: avoid_redundant_argument_values
          limit: _maxItems,
        );
        widgets.addEntries(
          response.body.ocs.data.entries.map(
            (final entry) => MapEntry(
              entry.key,
              entry.value.rebuild((final b) {
                if (b.items.length > _maxItems) {
                  b.items.removeRange(_maxItems, b.items.length);
                }
              }),
            ),
          ),
        );
      }

      this.widgets.add(
            Result.success(
              widgets.map(
                (final id, final items) => MapEntry(
                  response.body.ocs.data.values.find(id),
                  items,
                ),
              ),
            ),
          );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());

      widgets.add(Result.error(e));
      return;
    }
  }
}

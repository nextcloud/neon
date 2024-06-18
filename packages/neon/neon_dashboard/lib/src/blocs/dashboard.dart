import 'dart:async';
import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;
import 'package:rxdart/rxdart.dart';

/// Bloc for fetching dashboard widgets and their items.
sealed class DashboardBloc implements InteractiveBloc {
  /// Creates a new Dashboard Bloc instance.
  factory DashboardBloc({
    required Account account,
  }) = _DashboardBloc;

  /// Dashboard widgets that are displayed.
  BehaviorSubject<Result<BuiltList<dashboard.Widget>>> get widgets;

  /// Dashboard items that are displayed.
  BehaviorSubject<Result<BuiltMap<String, dashboard.WidgetItems>>> get items;
}

/// Implementation of [DashboardBloc].
///
/// Automatically starts fetching the widgets and their items and refreshes everything every 30 seconds.
class _DashboardBloc extends InteractiveBloc implements DashboardBloc {
  _DashboardBloc({
    required this.account,
  }) {
    itemsV1.listen((_) => _updateItems());
    itemsV2.listen((_) => _updateItems());

    unawaited(refresh());

    timer = TimerBloc().registerTimer(const Duration(seconds: 30), refresh);
  }

  @override
  final log = Logger('DashboardBloc');

  final Account account;
  late final NeonTimer timer;
  final itemsV1 = BehaviorSubject<Result<BuiltMap<String, BuiltList<dashboard.WidgetItem>>>>();
  final itemsV2 = BehaviorSubject<Result<BuiltMap<String, dashboard.WidgetItems>>>();
  static const int maxItems = 7;

  @override
  final widgets = BehaviorSubject();

  @override
  final items = BehaviorSubject();

  @override
  void dispose() {
    timer.cancel();
    unawaited(itemsV1.close());
    unawaited(itemsV2.close());
    unawaited(widgets.close());
    unawaited(items.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    if (!widgets.hasValue || !widgets.value.hasSuccessfulData) {
      await RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'dashboard-widgets',
        subject: widgets,
        getRequest: account.client.dashboard.dashboardApi.$getWidgets_Request,
        serializer: account.client.dashboard.dashboardApi.$getWidgets_Serializer(),
        // Filter all widgets that don't support v1 nor v2
        unwrap: (response) => BuiltList(
          response.body.ocs.data.values.where((widget) => widget.itemApiVersions.isNotEmpty),
        ),
      );
    }

    if (!widgets.value.hasData) {
      return;
    }

    final v1WidgetIDs = ListBuilder<String>();
    final v2WidgetIDs = ListBuilder<String>();

    for (final widget in widgets.value.requireData) {
      final itemApiVersions = widget.itemApiVersions;
      if (itemApiVersions.contains(2)) {
        v2WidgetIDs.add(widget.id);
      } else {
        v1WidgetIDs.add(widget.id);
      }
    }

    await Future.wait([
      if (v1WidgetIDs.isNotEmpty)
        RequestManager.instance.wrapNextcloud(
          account: account,
          cacheKey: 'dashboard-widgets-v1',
          subject: itemsV1,
          getRequest: () => account.client.dashboard.dashboardApi.$getWidgetItems_Request(
            widgets: v1WidgetIDs.build(),
            limit: maxItems,
          ),
          serializer: account.client.dashboard.dashboardApi.$getWidgetItems_Serializer(),
          unwrap: (response) => response.body.ocs.data,
        ),
      if (v2WidgetIDs.isNotEmpty)
        RequestManager.instance.wrapNextcloud(
          account: account,
          cacheKey: 'dashboard-widgets-v2',
          subject: itemsV2,
          getRequest: () => account.client.dashboard.dashboardApi.$getWidgetItemsV2_Request(
            widgets: v2WidgetIDs.build(),
            limit: maxItems,
          ),
          serializer: account.client.dashboard.dashboardApi.$getWidgetItemsV2_Serializer(),
          unwrap: (response) => response.body.ocs.data,
        ),
    ]);
  }

  void _updateItems() {
    final data = MapBuilder<String, dashboard.WidgetItems>();

    final resultV1 = itemsV1.valueOrNull;
    if (resultV1 != null && resultV1.hasData) {
      for (final entry in resultV1.requireData.entries) {
        data[entry.key] = dashboard.WidgetItems(
          (b) => b
            ..items.replace(entry.value.sublist(0, min(entry.value.length, maxItems)))
            ..emptyContentMessage = ''
            ..halfEmptyContentMessage = '',
        );
      }
    }

    final resultV2 = itemsV2.valueOrNull;
    if (resultV2 != null && resultV2.hasData) {
      for (final entry in resultV2.requireData.entries) {
        data[entry.key] = entry.value.rebuild((b) {
          if (b.items.length > maxItems) {
            b.items.removeRange(maxItems, b.items.length);
          }
        });
      }
    }

    items.add(
      Result(
        data.build(),
        resultV1?.error ?? resultV2?.error,
        isLoading: (resultV1?.isLoading ?? true) || (resultV2?.isLoading ?? true),
        isCached: (resultV1?.isCached ?? true) || (resultV2?.isCached ?? true),
      ),
    );
  }
}

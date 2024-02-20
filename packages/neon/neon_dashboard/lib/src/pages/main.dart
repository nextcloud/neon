import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_dashboard/l10n/localizations.dart';
import 'package:neon_dashboard/src/blocs/dashboard.dart';
import 'package:neon_dashboard/src/widgets/dry_intrinsic_height.dart';
import 'package:neon_dashboard/src/widgets/set_weather_location_dialog.dart';
import 'package:neon_dashboard/src/widgets/widget.dart';
import 'package:neon_dashboard/src/widgets/widget_button.dart';
import 'package:neon_dashboard/src/widgets/widget_item.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;
import 'package:nextcloud/user_status.dart' as user_status;

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
    final weatherStatusBloc = accountsBloc.activeWeatherStatusBloc;

    return NeonCustomBackground(
      child: ResultBuilder.behaviorSubject(
        subject: bloc.widgets,
        builder: (context, widgetsResult) => ResultBuilder.behaviorSubject(
          subject: bloc.items,
          builder: (context, itemsResult) {
            final children = <Widget>[
              _buildStatuses(
                account: accountsBloc.activeAccount.value!,
                userStatusBloc: userStatusBloc,
                weatherStatusBloc: weatherStatusBloc,
              ),
            ];

            var minHeight = 504.0;
            if (widgetsResult.hasData) {
              final widgets = <Widget>[];
              for (final widget in widgetsResult.requireData) {
                final items = buildWidgetItems(
                  context: context,
                  widget: widget,
                  items: itemsResult.data?[widget.id],
                ).toList();

                final height = items.map((i) => i.height!).reduce((a, b) => a + b);
                minHeight = max(minHeight, height);

                widgets.add(
                  DashboardWidget(
                    widget: widget,
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
            } else {
              children.add(
                SizedBox(
                  height: minHeight,
                ),
              );
            }

            return Center(
              child: NeonListView.custom(
                scrollKey: 'dashboard',
                isLoading: widgetsResult.isLoading || itemsResult.isLoading,
                error: widgetsResult.error ?? itemsResult.error,
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
      ),
    );
  }

  Widget _buildStatuses({
    required Account account,
    required UserStatusBloc userStatusBloc,
    required WeatherStatusBloc weatherStatusBloc,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ResultBuilder.behaviorSubject(
            subject: userStatusBloc.status,
            builder: (context, statusResult) {
              final status = statusResult.data;

              final label = StringBuffer();
              if (status?.icon == null && status?.message == null) {
                label.write(DashboardLocalizations.of(context).setUserStatus);
              } else {
                if (status?.icon != null) {
                  label.write(status!.icon);
                }
                if (status?.icon != null && status?.message != null) {
                  label.write(' ');
                }
                if (status?.message != null) {
                  label.write(status!.message);
                }
              }

              var statusIcon = status?.status ?? user_status.$Type.online;
              if (statusIcon == user_status.$Type.offline) {
                statusIcon = user_status.$Type.invisible;
              }

              return _buildStatus(
                context: context,
                icon: NeonServerIcon(
                  icon: 'user-status-$statusIcon',
                ),
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
            },
          ),
          StreamBuilder(
            stream: weatherStatusBloc.isSupported,
            builder: (context, weatherStatusSupportedSnapshot) => ResultBuilder.behaviorSubject(
              subject: weatherStatusBloc.forecasts,
              builder: (context, forecastsResult) {
                if (weatherStatusSupportedSnapshot.hasData && !weatherStatusSupportedSnapshot.requireData) {
                  return const SizedBox.shrink();
                }

                Future<void> onWeatherStatusPressed() async {
                  final location = await showDialog<String>(
                    context: context,
                    builder: (context) => DashboardSetWeatherLocationDialog(
                      currentAddress: weatherStatusBloc.location.valueOrNull?.data?.address,
                    ),
                  );
                  if (location != null) {
                    weatherStatusBloc.setLocation(location);
                  }
                }

                if (forecastsResult.hasData) {
                  final weatherCode = forecastsResult.requireData.first.data.next1Hours.summary.symbolCode;
                  final temperature = forecastsResult.requireData.first.data.instant.details.airTemperature;
                  final description = DashboardLocalizations.of(context).weather(
                    weatherCode.replaceAll(RegExp(r'_(day|night)$'), ''),
                  );

                  final icon = switch (weatherCode) {
                    'clearsky_day' => 'sun',
                    'clearsky_night' => 'moon',
                    'cloudy' => 'cloud-cloud',
                    'fair_day' => 'sun-small-cloud',
                    'fair_night' => 'moon-small-cloud',
                    'partlycloudy_day' => 'sun-cloud',
                    'partlycloudy_night' => 'moon-cloud',
                    'fog' => 'fog',
                    'rain' => 'rain',
                    'lightrain' => 'light-rain',
                    'heavyrain' => 'heavy-rain',
                    'rainshowers_day' => 'sun-cloud-rain',
                    'rainshowers_night' => 'moon-cloud-rain',
                    'lightrainshowers_day' => 'sun-cloud-light-rain',
                    'lightrainshowers_night' => 'moon-cloud-light-rain',
                    'heavyrainshowers_day' => 'sun-cloud-heavy-rain',
                    'heavyrainshowers_night' => 'moon-cloud-heavy-rain',
                    _ => throw UnimplementedError('Unknown icon: $weatherCode'),
                  };

                  return _buildStatus(
                    context: context,
                    icon: NeonServerIcon(
                      icon: icon,
                    ),
                    label: Text('$temperature °C $description'),
                    onPressed: onWeatherStatusPressed,
                  );
                } else {
                  return _buildStatus(
                    context: context,
                    icon: const NeonServerIcon(
                      icon: 'sun-small-cloud',
                    ),
                    label: Text(DashboardLocalizations.of(context).locationSet),
                    onPressed: onWeatherStatusPressed,
                  );
                }
              },
            ),
          ),
        ],
      );

  Widget _buildStatus({
    required BuildContext context,
    required Widget icon,
    required Widget label,
    required VoidCallback onPressed,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ActionChip(
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
        ),
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
      return NeonUriImage(
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
      AdaptiveIcons.question_mark,
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
            Icon(
              AdaptiveIcons.check,
              size: largeIconSize,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}

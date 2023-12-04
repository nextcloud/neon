import 'package:flutter/material.dart';
import 'package:neon_dashboard/src/blocs/dashboard.dart';
import 'package:neon_dashboard/src/widgets/widget.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';

/// Displays the whole dashboard page layout.
class DashboardMainPage extends StatelessWidget {
  /// Creates a new dashboard main page.
  const DashboardMainPage({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final bloc = NeonProvider.of<DashboardBloc>(context);

    return ResultBuilder.behaviorSubject(
      subject: bloc.widgets,
      builder: (final context, final snapshot) {
        Widget? child;
        if (snapshot.hasData) {
          child = Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: snapshot.requireData.entries
                .map(
                  (final widget) => DashboardWidget(
                    widget: widget.key,
                    items: widget.value,
                  ),
                )
                .toList(),
          );
        }

        return Center(
          child: NeonListView.custom(
            scrollKey: 'dashboard',
            isLoading: snapshot.isLoading,
            error: snapshot.error,
            onRefresh: bloc.refresh,
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

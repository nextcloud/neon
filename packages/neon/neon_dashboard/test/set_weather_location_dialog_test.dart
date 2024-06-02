import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_dashboard/l10n/localizations.dart';
import 'package:neon_dashboard/src/widgets/set_weather_location_dialog.dart';
import 'package:neon_framework/testing.dart';

void main() {
  testWidgets('Set weather location dialog', (tester) async {
    await tester.pumpWidgetWithAccessibility(
      const TestApp(
        localizationsDelegates: DashboardLocalizations.localizationsDelegates,
        supportedLocales: DashboardLocalizations.supportedLocales,
        child: SizedBox.shrink(),
      ),
    );

    final BuildContext context = tester.element(find.byType(SizedBox));

    var future = showDialog<String>(
      context: context,
      builder: (context) => const DashboardSetWeatherLocationDialog(
        currentAddress: 'Berlin',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Berlin'), findsOne);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(await future, 'Berlin');

    future = showDialog<String>(
      context: context,
      builder: (context) => const DashboardSetWeatherLocationDialog(
        currentAddress: null,
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Berlin');

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(await future, 'Berlin');
  });
}

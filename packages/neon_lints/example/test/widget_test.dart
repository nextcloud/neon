import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test', (tester) async {
    // expect_lint: prefer_pump_widget_with_accessibility
    await tester.pumpWidget(Container());
  });
}

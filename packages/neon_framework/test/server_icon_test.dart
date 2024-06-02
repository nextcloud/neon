import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/widgets/server_icon.dart';
import 'package:neon_framework/testing.dart';
import 'package:vector_graphics/vector_graphics.dart';

void main() {
  testWidgets('NeonServerIcon', (tester) async {
    var widget = const NeonServerIcon(icon: 'icon-logo-dark');

    await tester.pumpWidgetWithAccessibility(TestApp(wrapMaterial: false, child: widget));
    expect(find.byType(VectorGraphic), findsOneWidget);

    widget = const NeonServerIcon(
      icon: 'icon-logo-dark',
      colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
    );
    await tester.pumpWidgetWithAccessibility(TestApp(wrapMaterial: false, child: widget));

    await expectLater(find.byType(VectorGraphic), matchesGoldenFile('goldens/neon_server_icon_nextcloud_logo.png'));
  });
}

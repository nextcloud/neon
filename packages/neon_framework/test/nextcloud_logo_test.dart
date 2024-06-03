import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/widgets/nextcloud_logo.dart';
import 'package:neon_framework/testing.dart';
import 'package:vector_graphics/vector_graphics.dart';

void main() {
  testWidgets('NextcloudLogo', (tester) async {
    const widget = NextcloudLogo();

    await tester.pumpWidgetWithAccessibility(const TestApp(wrapMaterial: false, child: widget));
    expect(find.byType(VectorGraphic), findsOneWidget);
    expect(find.bySemanticsLabel(NeonLocalizationsEn().nextcloudLogo), findsOneWidget);

    await expectLater(find.byType(VectorGraphic), matchesGoldenFile('goldens/nextcloud_logo.png'));
  });
}

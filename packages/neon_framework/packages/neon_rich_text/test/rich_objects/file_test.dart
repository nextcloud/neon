import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/testing.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_rich_text/neon_rich_text.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:provider/provider.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

const validBlurHash = 'LEHLk~WB2yk8pyo0adR*.7kCMdnj';

void main() {
  late MockUrlLauncher urlLauncher;
  late Account account;

  setUpAll(() {
    FakeNeonStorage.setup();

    registerFallbackValue(const LaunchOptions());

    urlLauncher = MockUrlLauncher();
    // ignore: discarded_futures
    when(() => urlLauncher.launchUrl(any(), any())).thenAnswer((_) async => true);

    UrlLauncherPlatform.instance = urlLauncher;
  });

  setUp(() {
    account = MockAccount();
  });

  group('File', () {
    const pixelRatio = 3;
    const maxWidth = 800;
    const maxHeight = 600 ~/ 2;

    testWidgets('Opens link', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'no'
                ..path = ''
                ..link = '/link',
            ),
            textStyle: null,
          ),
        ),
      );

      await tester.tap(find.byType(NeonRichObjectFile));
      verify(() => urlLauncher.launchUrl('https://cloud.example.com:8443/link', any())).called(1);
    });

    testWidgets('With blurhash', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'no'
                ..path = ''
                ..blurhash = validBlurHash,
            ),
            textStyle: null,
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) => widget is NeonApiImage && widget.blurHash == validBlurHash,
        ),
        findsOne,
      );
    });

    testWidgets('Without preview', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'no'
                ..path = 'path',
            ),
            textStyle: null,
          ),
        ),
      );

      expect(find.byTooltip('name'), findsNothing);
      expect(find.text('name'), findsOne);
    });

    testWidgets('Without dimensions', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path',
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints(
        minHeight: 100,
        maxHeight: maxHeight.toDouble(),
        minWidth: 100,
        maxWidth: maxWidth.toDouble(),
      );
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('With dimensions', (tester) async {
      const width = 900;
      const height = 300;

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path'
                ..width = width.toString()
                ..height = height.toString(),
            ),
            textStyle: null,
          ),
        ),
      );

      final expectedConstraints = BoxConstraints.tight(const Size(width / pixelRatio, height / pixelRatio));
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('With dimensions too big', (tester) async {
      const widthFactor = 2; // Make it too big
      const heightFactor = 4; // Make this even bigger

      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path'
                ..width = ((maxWidth * widthFactor) * pixelRatio).toString()
                ..height = ((maxHeight * heightFactor) * pixelRatio).toString(),
            ),
            textStyle: null,
          ),
        ),
      );

      final size = Size(
        widthFactor * maxWidth / heightFactor,
        maxHeight.toDouble(),
      );
      final expectedConstraints = BoxConstraints.tight(size);
      expect(
        find.byWidgetPredicate((widget) => widget is ConstrainedBox && widget.constraints == expectedConstraints),
        findsOne,
      );
      expect(find.byTooltip('name'), findsOne);
    });

    testWidgets('Full image for animated GIF', (tester) async {
      await tester.pumpWidgetWithAccessibility(
        TestApp(
          providers: [
            Provider<Account>.value(value: account),
          ],
          child: NeonRichObjectFile(
            parameter: core.RichObjectParameter(
              (b) => b
                ..type = core.RichObjectParameter_Type.file
                ..id = '0'
                ..name = 'name'
                ..previewAvailable = 'yes'
                ..path = 'path'
                ..mimetype = 'image/gif'
                ..blurhash = validBlurHash,
            ),
            textStyle: null,
          ),
        ),
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is NeonUriImage &&
              widget.uri.toString() == 'https://cloud.example.com:8443/nextcloud/remote.php/dav/files/username/path' &&
              widget.blurHash == validBlurHash,
        ),
        findsOne,
      );
    });
  });
}

import 'package:mocktail/mocktail.dart';
import 'package:neon_dashboard/src/utils/find.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;
import 'package:test/test.dart';

// ignore: missing_override_of_must_be_overridden, avoid_implementing_value_types
class DashboardWidgetMock extends Mock implements dashboard.Widget {}

void main() {
  group('group name', () {
    test('AccountFind', () {
      final widget1 = DashboardWidgetMock();
      final widget2 = DashboardWidgetMock();

      final widgets = {
        widget1,
        widget2,
      };

      when(() => widget1.id).thenReturn('widget1');
      when(() => widget2.id).thenReturn('widget2');

      expect(widgets.tryFind('invalidID'), isNull);
      expect(widgets.tryFind(widget2.id), equals(widget2));

      expect(() => widgets.find('invalidID'), throwsA(isA<StateError>()));
      expect(widgets.find(widget2.id), equals(widget2));
    });
  });
}

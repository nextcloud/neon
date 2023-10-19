import 'package:collection/collection.dart';
import 'package:nextcloud/dashboard.dart' as dashboard;

/// Extension to find [dashboard.Widget]s.
extension WidgetFind on Iterable<dashboard.Widget> {
  /// Finds the first widget that has the id set to [id].
  ///
  /// Returns `null` if no matching widget was found.
  dashboard.Widget? tryFind(final String id) => firstWhereOrNull((final widget) => widget.id == id);

  /// Finds the first widget that has the id set to [id].
  ///
  /// Throws an exception if no matching widget was found.
  dashboard.Widget find(final String id) => firstWhere((final widget) => widget.id == id);
}

import 'package:cookbook_app/l10n/cookbook_localizations.dart';
import 'package:flutter/widgets.dart';

export 'package:cookbook_app/l10n/cookbook_localizations.dart';

/// Extension for easier l10 usage.
extension AppLocalizationsX on BuildContext {
  /// Returns the localization currently active for this context.
  ///
  /// This is the same as manually getting it through
  /// `CookbookLocalizations.of(this)`.
  CookbookLocalizations get l10n => CookbookLocalizations.of(this);
}

import 'package:flutter/widgets.dart';
import 'package:neon_cookbook/l10n/cookbook_localizations.dart';

export 'package:neon_cookbook/l10n/cookbook_localizations.dart';

/// Extension for easier l10 usage.
extension AppLocalizationsX on BuildContext {
  /// Returns the localization currently active for this context.
  ///
  /// This is the same as manually getting it through
  /// `CookbookLocalizations.of(this)`.
  CookbookLocalizations get l10n => CookbookLocalizations.of(this);
}

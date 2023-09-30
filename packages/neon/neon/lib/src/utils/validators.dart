import 'package:flutter/widgets.dart';
import 'package:neon/l10n/localizations.dart';

/// Validates whether the given [input] is a valid http url.
///
/// Set [httpsOnly] if you want to only allow http urls.
/// Returns null when the url is valid and a localized error message if not.
String? validateHttpUrl(
  final BuildContext context,
  final String? input, {
  final bool httpsOnly = false,
}) {
  if (input == null || input.isEmpty) {
    return NeonLocalizations.of(context).errorInvalidURL;
  }
  final uri = Uri.tryParse(input);

  if (uri != null) {
    if (uri.isScheme('https')) {
      return null;
    }
    if (uri.isScheme('http') && !httpsOnly) {
      // TODO: Maybe make a better error message for http URLs if only https is allowed
      return null;
    }
  }

  return NeonLocalizations.of(context).errorInvalidURL;
}

/// Validates that the given [input] is neither null nor empty.
///
/// Returns null when not empty and a localized error message if empty.
String? validateNotEmpty(final BuildContext context, final String? input) {
  if (input == null || input.isEmpty) {
    return NeonLocalizations.of(context).errorEmptyField;
  }

  return null;
}

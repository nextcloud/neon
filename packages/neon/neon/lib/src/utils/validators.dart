import 'package:flutter/widgets.dart';
import 'package:neon/l10n/localizations.dart';

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

String? validateNotEmpty(final BuildContext context, final String? input) {
  if (input == null || input.isEmpty) {
    return NeonLocalizations.of(context).errorEmptyField;
  }

  return null;
}

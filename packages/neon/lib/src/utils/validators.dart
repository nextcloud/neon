part of '../neon.dart';

String? validateHttpUrl(
  final BuildContext context,
  final String? input, {
  final bool httpsOnly = false,
  final bool allowEmptyScheme = false,
}) {
  if (input == null || input == '') {
    return AppLocalizations.of(context).errorInvalidURL;
  }
  try {
    final uri = Uri.parse(input);
    if (uri.isScheme('https')) {
      return null;
    }
    if (uri.isScheme('http') && !httpsOnly) {
      return null;
    }
    if (uri.isScheme('') && allowEmptyScheme) {
      return null;
    }
  } catch (_) {}
  return AppLocalizations.of(context).errorInvalidURL;
}

String? validateNotEmpty(final BuildContext context, final String? input) {
  if (input == null || input == '') {
    return AppLocalizations.of(context).errorEmptyField;
  }

  return null;
}

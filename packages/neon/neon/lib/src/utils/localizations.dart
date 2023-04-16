part of '../../neon.dart';

Future<AppLocalizations> appLocalizationsFromSystem() async {
  final parts =
      (await findSystemLocale()).split('_').map((final a) => a.split('.')).reduce((final a, final b) => [...a, ...b]);
  return AppLocalizations.delegate.load(Locale(parts[0], parts.length > 1 ? parts[1] : null));
}

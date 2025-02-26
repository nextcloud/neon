// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class DashboardLocalizationsEn extends DashboardLocalizations {
  DashboardLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get noEntries => 'No entries';

  @override
  String get setUserStatus => 'Set status';

  @override
  String weather(String code) {
    String _temp0 = intl.Intl.selectLogic(
      code,
      {
        'clearsky': 'clear sky',
        'cloudy': 'cloudy',
        'snowandthunder': 'snow and thunder',
        'snowshowersandthunder': 'snow showers and thunder',
        'snowshowersandthunder_polartwilight': 'snow showers, thunder and polar twilight',
        'snowshowers': 'snow showers',
        'snowshowers_polartwilight': 'snow showers and polar twilight',
        'snow': 'snow',
        'fair': 'fair weather',
        'partlycloudy': 'partly cloudy',
        'fog': 'foggy',
        'rain': 'rainfall',
        'lightrain': 'light rainfall',
        'heavyrain': 'heavy rainfall',
        'rainshowers': 'rainfall showers',
        'lightrainshowers': 'light rainfall showers',
        'heavyrainshowers': 'heavy rainfall showers',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get locationSet => 'Set location for weather';

  @override
  String get address => 'Address';

  @override
  String get openWidget => 'Open widget';
}

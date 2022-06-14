import 'package:core/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class L10n {
  static const en = Locale('en', '');
  static const th = Locale('th', '');

  static Locale get initLocale {
    final currentLocaleStr = Platform.localeName.split('_')[0];
    final selectLocale = all
        .firstOrNullWhere((locale) => locale.languageCode == currentLocaleStr);
    if (selectLocale != null) {
      return selectLocale;
    } else {
      return en;
    }
  }

  static final all = [en, th];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    CountryLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    Log.i('change language');
    return locale;
  }
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

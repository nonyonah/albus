import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'en_us/en_us_translations.dart';

extension LocalizationExtension on String {
  String get tr => AppLocalization.of().getString(this);
}

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;
  static final Map<String, Map<String,String>> _localizedValues = {'en': enUS};

  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
      NavigatorState.navigatorKey.currentConxtex!, AppLocalization)!;
  }
  
  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String text) => 
  _localizedValues[locale.languageCode] ![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) => 
  AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
  }
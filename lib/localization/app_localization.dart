import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:albus/core/utils/navigator_service.dart';
import 'en_us/en_us_translations.dart';

extension LocalizationExtension on String {
  String get tr {
    final context = NavigatorService.navigatorKey.currentContext;
    if (context == null) {
      return this;
    }
    return AppLocalization.of(context).getString(this);
  }
}

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;
  static final Map<String, Map<String, String>> _localizedValues = {'en': enUS};

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();

  String getString(String text) {
    return _localizedValues[locale.languageCode]?[text] ?? text;
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

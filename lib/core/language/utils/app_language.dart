import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localizations.dart';

class AppLanguage {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return;
    }
    _appLocale = Locale(prefs.getString('language_code') as String);
    return;
  }

  void changeLanguage(Locale type) {
    if (_appLocale == type) {
      return;
    }
    if (AppLocalizations(appLocale).isSupported(type)) {
      _appLocale = type;
      SharedPreferences.getInstance().then((var prefs) {
        prefs.setString('language_code', type.languageCode);
        prefs.setString('countryCode', type.countryCode ?? '');
      });
    } else {
      _appLocale = const Locale('en');
      SharedPreferences.getInstance().then((var prefs) {
        prefs.setString('language_code', 'en');
        prefs.setString('countryCode', '');
      });
    }
    // notifyListeners();
  }

  @override
  String toString() {
    return '''AppLanguage{
      _appLocale: $appLocale,
    }''';
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  late final Locale locale;

  AppLocalizations(this.locale);
  static List<Locale> get supportedLanguages => const _AppLocalizationsDelegate().supportedLanguages;
  bool isSupported(Locale type) => const _AppLocalizationsDelegate().isSupported(type);

  // Helper method to keep the code in the widgets concise Localizations are
  // accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};
  Map<String, String> _localizedStringsDefault = {};

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    String jsonStringEn = await rootBundle.loadString('assets/i18n/en.json');
    Map<String, dynamic> jsonMapEn = json.decode(jsonStringEn);
    _localizedStringsDefault = jsonMapEn.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key] != null
        ? _localizedStrings[key].toString()
        : _localizedStringsDefault[key] != null
        ? _localizedStringsDefault[key].toString()
        : key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  List<Locale> get supportedLanguages => [
    const Locale('en'),
    const Locale('ja'),
  ];

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return supportedLanguages.contains(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
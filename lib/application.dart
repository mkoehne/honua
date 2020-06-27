import 'dart:ui';
import 'package:flutter/material.dart';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();
  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  final List<String> supportedLanguages = [
    "English",
    "Deutsch",
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "de",
  ];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;
}

Application application = Application();

typedef void LocaleChangeCallback(Locale locale);

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';
import 'services/authentication.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

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

  static String userId;
  static String pushToken;
  static User user;
  static BaseAuth auth = Auth();
  static AuthStatus authStatus = AuthStatus.NOT_LOGGED_IN;

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;

  static void savePushToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('push_token', token);
  }
}

Application application = Application();

typedef void LocaleChangeCallback(Locale locale);

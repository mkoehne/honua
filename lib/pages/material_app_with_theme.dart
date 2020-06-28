import 'package:flutter/material.dart';
import 'package:honua/helpers/app_translations_delegate.dart';
import 'package:honua/helpers/theme.dart';
import 'package:honua/helpers/theme_changer.dart';
import 'package:honua/pages/onboarding_page.dart';
import 'package:honua/pages/root_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';
import 'home_page.dart';

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  AppTranslationsDelegate _newLocaleDelegate;
  final _navigatorKey = GlobalKey<NavigatorState>();
  bool isFirstStart = true;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    Application().onLocaleChanged = onLocaleChange;
    _loadLocale();
    _loadFirstStart();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("de", ""),
        const Locale("en", ""),
      ],
      theme: buildThemeData(theme.getAppTheme()),
      home: isFirstStart ? OnBoardingPage() : RootPage(),
    );
  }

  _loadFirstStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstStart = prefs.getBool('isFirstStart') ?? true;
    });
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var locale = (prefs.getString('locale') ?? "de");
    Application().onLocaleChanged(Locale(locale));
  }
}
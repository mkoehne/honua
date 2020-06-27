import 'package:flutter/material.dart';

import 'hex_color.dart';

class MyTheme {
  Brightness brightness;
  Color backgroundColor;
  Color scaffoldBackgroundColor;
  Color primaryColor;
  Color cardColor;
  Color splashColor;
  Brightness primaryColorBrightness;
  Color accentColor;
  Color mainTextColor;
  Color mainBackgroundColor;
  Color highlightColor;

  MyTheme(
      {this.brightness,
      this.backgroundColor,
      this.scaffoldBackgroundColor,
      this.primaryColor,
      this.primaryColorBrightness,
      this.cardColor,
      this.splashColor,
      this.mainTextColor,
      this.mainBackgroundColor,
      this.highlightColor,
      this.accentColor});
}

class AppTheme {
  String name;
  MyTheme theme;

  AppTheme(this.name, this.theme);
}

buildThemeData(AppTheme appTheme) {
  return ThemeData(
    brightness: appTheme.theme.brightness,
    backgroundColor: appTheme.theme.backgroundColor,
    scaffoldBackgroundColor: appTheme.theme.scaffoldBackgroundColor,
    primaryColor: appTheme.theme.primaryColor,
    primaryColorBrightness: appTheme.theme.primaryColorBrightness,
    accentColor: appTheme.theme.accentColor,
  );
}

List<AppTheme> myThemes = [
  AppTheme(
      'Light',
      MyTheme(
        brightness: Brightness.light,
        backgroundColor: Colors.deepOrangeAccent[50],
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.deepOrangeAccent,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent[300],
        mainBackgroundColor: Colors.white,
        mainTextColor: Colors.black,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      )),
  AppTheme(
    'Dark',
    MyTheme(
      brightness: Brightness.dark,
      accentColor: Colors.orange[300],
      mainBackgroundColor: HexColor("303030"),
      mainTextColor: Colors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
  ),
  AppTheme(
    'Orange',
    MyTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.orange[50],
      scaffoldBackgroundColor: Colors.orange[50],
      primaryColor: Colors.orange[600],
      primaryColorBrightness: Brightness.dark,
      accentColor: Colors.orange[300],
    ),
  ),
];

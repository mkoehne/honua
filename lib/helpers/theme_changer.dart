import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeChanger with ChangeNotifier {
  AppTheme _appTheme;
  bool _radioOn = false;

  ThemeChanger(this._appTheme);

  getTheme() => buildThemeData(_appTheme);

  setTheme(AppTheme theme) {
    _appTheme = theme;

    notifyListeners();
  }

  getRadio() => _radioOn;

  setRadio(bool isOn) {
    _radioOn = isOn;

    notifyListeners();
  }

  AppTheme getAppTheme() {
    return _appTheme;
  }
}

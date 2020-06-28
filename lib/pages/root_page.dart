import 'package:flutter/material.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/helpers/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  RootPageState createState() {
    return new RootPageState();
  }
}

class RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();

    _saveFirstStart();
  }

  _saveFirstStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstStart', false);
  }

  @override
  Widget build(BuildContext context) {
    var _themeChanger = Provider.of<ThemeChanger>(context);
    var _translator = AppTranslations.of(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: _themeChanger.getAppTheme().theme.mainTextColor),
        brightness: _themeChanger.getAppTheme().theme.brightness,
        backgroundColor: _themeChanger.getAppTheme().theme.mainBackgroundColor,
        centerTitle: true,
        title: Text(
          _translator.text("Root"),
          style: TextStyle(
              fontSize: 20.0,
              color: _themeChanger.getAppTheme().theme.mainTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}

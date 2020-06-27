import 'package:flutter/material.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/helpers/theme_changer.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  RegisterPageState createState() {
    return new RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
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
          _translator.text("Register"),
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

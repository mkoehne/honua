import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' as service;

import 'application.dart';
import 'helpers/theme.dart';
import 'helpers/theme_changer.dart';
import 'pages/material_app_with_theme.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var index = (prefs.getInt('theme') ?? 0);
  Application.isFirstStart = prefs.getBool('isFirstStart') ?? true;
  if (Application.isFirstStart == false) {
    Application.loadUser();
  }

  service.SystemChrome.setSystemUIOverlayStyle(service.SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white10, // navigation bar color
    statusBarColor: Colors.white10, // status bar color
  ));

  /*if (index == 0) {
    service.SystemChrome.setSystemUIOverlayStyle(service.SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white10, // navigation bar color
      statusBarColor: Colors.white10, // status bar color
    ));
  } else {
    service.SystemChrome.setSystemUIOverlayStyle(service.SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black87, // navigation bar color
      statusBarColor: Colors.black87, // status bar color
    ));
  }*/

  runApp(
    MyApp(selectedTheme: myThemes[index]),
  );
}

class MyApp extends StatefulWidget {
  MyApp({this.selectedTheme});
  // This widget is the root of your application.
  final AppTheme selectedTheme;

  @override
  _MyAppState createState() => _MyAppState(thisTheme: selectedTheme);
}

class _MyAppState extends State<MyApp> {
  _MyAppState({this.thisTheme});

  final AppTheme thisTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (context) => ThemeChanger(thisTheme),
        ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

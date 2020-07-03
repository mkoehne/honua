import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/helpers/hex_color.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';
import 'intro_video_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => IntroVideoPage(), fullscreenDialog: true),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(
        'assets/onboarding/$assetName.png',
        width: 300.0,
        height: 300,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final ThemeData theme = Theme.of(context);

    var translator = AppTranslations.of(context);
    var bodyStyle = TextStyle(
      fontSize: 19.0,
      color: theme.brightness == Brightness.dark ? Colors.black : Colors.black,
    );
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        color:
            theme.brightness == Brightness.dark ? Colors.black : Colors.black,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16.0,
        color:
            theme.brightness == Brightness.dark ? Colors.black : Colors.black,
      ),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor:
          theme.brightness == Brightness.dark ? Colors.white : Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor:
          theme.brightness == Brightness.dark ? Colors.black : Colors.white,
      pages: [
        PageViewModel(
          title: translator.text("onboard_p1_title"),
          body: translator.text("onboard_p1_body1") +
              translator.text("onboard_p1_body2"),
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: _buildImage('img2'),
          title: translator.text("onboard_p2_title"),
          body: translator.text("onboard_p2_body1") +
              translator.text("onboard_p2_body2"),
          footer: RaisedButton(
            onPressed: () async {
              var result = await Application.flutterLocalNotificationsPlugin
                  .resolvePlatformSpecificImplementation<
                      IOSFlutterLocalNotificationsPlugin>()
                  ?.requestPermissions(
                    alert: true,
                    badge: true,
                    sound: true,
                  );
            },
            child: Text(
              translator.text("onboard_p2_button"),
              style: TextStyle(
                fontSize: 16.0,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.white,
              ),
            ),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: translator.text("onboard_p3_title"),
          body: translator.text("onboard_p3_body1") +
              translator.text("onboard_p3_body2"),
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(
        translator.text("onboard_skip_button"),
        style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.black
                : Colors.black),
      ),
      next: const Icon(Icons.keyboard_arrow_right),
      done: Text(translator.text("onboard_done_button"),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: theme.brightness == Brightness.dark
                  ? Colors.black
                  : Colors.black)),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: theme.brightness == Brightness.dark ? Colors.grey : Colors.grey,
        activeColor: Colors.blue,
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

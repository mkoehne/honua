import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/helpers/hex_color.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro_video_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    _saveFirstStart();
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => IntroVideoPage(), fullscreenDialog: true),
    );
  }

  _saveFirstStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstStart', false);
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
    var translator = AppTranslations.of(context);
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 16.0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
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
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: Text(
              translator.text("onboard_p2_button"),
              style: TextStyle(color: Colors.white),
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
        style: TextStyle(color: Colors.black54),
      ),
      next: const Icon(Icons.keyboard_arrow_right),
      done: Text(translator.text("onboard_done_button"),
          style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.black12,
        activeColor: Colors.grey,
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/pages/login_singup_page.dart';
import 'package:honua/pages/root_page.dart';

class IntroVideoPage extends StatefulWidget {
  @override
  _IntroVideoPageState createState() => _IntroVideoPageState();
}

class _IntroVideoPageState extends State<IntroVideoPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  var tapLogin = 0;
  var tapSignup = 0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tapLogin = 0;
                tapSignup = 0;
              });
            }
          });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  Future<Null> _Playanimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    var translator = AppTranslations.of(context);

    MediaQueryData mediaQuery = MediaQuery.of(context);
    mediaQuery.devicePixelRatio;
    mediaQuery.size.height;
    mediaQuery.size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/onboarding/onboarding.gif"),
                    fit: BoxFit.cover)),
          ),
          Container(
            child: Container(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.1),
                              child: Center(
                                child: Text(
                                  "Honua",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 70.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 10,
                                right: MediaQuery.of(context).size.width / 10,
                                bottom:
                                    MediaQuery.of(context).size.height / 2.2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 15,
                                right: MediaQuery.of(context).size.width / 15,
                                bottom: MediaQuery.of(context).size.height,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  translator.text("onboardvideo_text"),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 1.7,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(top: 0.0, bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) =>
                              LoginSignUpPage(mode: FormMode.SIGNUP),
                          fullscreenDialog: false),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height / 17,
                    child: ButtonCustom(
                      txt: translator.text("onboardvideo_register"),
                      gradient1: Colors.blue,
                      gradient2: Colors.lightBlueAccent,
                      border: Colors.transparent,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => LoginSignUpPage(mode: FormMode.LOGIN),
                          fullscreenDialog: false),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height / 17,
                    child: ButtonCustom(
                      txt: translator.text("onboardvideo_signup"),
                      gradient1: Colors.transparent,
                      gradient2: Colors.transparent,
                      border: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 10,
              right: MediaQuery.of(context).size.width / 10,
              bottom: MediaQuery.of(context).size.height / 400,
            ),
          )
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  @override
  String txt;
  GestureTapCallback ontap;
  Color gradient1;
  Color gradient2;
  Color border;

  ButtonCustom({this.txt, this.gradient1, this.gradient2, this.border});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        child: LayoutBuilder(builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 55.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: border,
                ),
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(colors: [
                  gradient1,
                  gradient2,
                ]),
              ),
              child: Center(
                  child: Text(
                txt,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              )),
            ),
          );
        }),
      ),
    );
  }
}

class AnimationSplashLogin extends StatefulWidget {
  AnimationSplashLogin({Key key, this.animationController})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashLoginState createState() => _AnimationSplashLoginState();
}

class _AnimationSplashLoginState extends State<AnimationSplashLogin> {
  @override
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (_) => RootPage(), fullscreenDialog: false),
        );
        //hello
      }
    });
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}

class AnimationSplashSignup extends StatefulWidget {
  AnimationSplashSignup({Key key, this.animationController})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashSignupState createState() => _AnimationSplashSignupState();
}

class _AnimationSplashSignupState extends State<AnimationSplashSignup> {
  @override
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                new LoginSignUpPage(mode: FormMode.SIGNUP)));
      }
    });
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}

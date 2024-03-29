import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:honua/helpers/hex_color.dart';
import 'package:honua/models/challange.dart';
import 'package:honua/pages/detail_page.dart';
import 'package:honua/services/repository.dart';
import 'package:honua/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../application.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Challenge> challenges = new List<Challenge>();

  @override
  void initState() {
    super.initState();
    initPush();

    _saveFirstStart();
    getChallenges();
  }

  void initPush() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        AndroidInitializationSettings('launcher_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    await Application.flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailPage(
                    challenge: challenges[0],
                  ),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => DetailPage(
          challenge: challenges[0],
        ),
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  getChallenges() async {
    var list = await Repository.internal().getChallenges();

    setState(() {
      challenges = list;
    });

    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 20));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await Application.flutterLocalNotificationsPlugin.schedule(
        0,
        challenges[0].title,
        challenges[0].description,
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  _saveFirstStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstStart', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Max Size
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: 0.87902,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.34,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.ternaryBackground,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                    ),
                    userView(),
                    pointView(),
                    circlePointsView(),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) =>
                    buildChallenge(context, challenges[index]),
                itemCount: challenges.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userView() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "${Application.user.firstname} ${Application.user.lastname}",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: CachedNetworkImage(
              imageUrl: Application.user.image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.account_circle, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget pointView() {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Elements",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: 30,
                child: SliderTheme(
                  child: Slider(
                    min: 0,
                    max: 300,
                    value: (Application.user.earth +
                            Application.user.water +
                            Application.user.fire)
                        .toDouble(),
                    onChanged: (value) {},
                    inactiveColor: Colors.white38,
                    activeColor: Color.fromARGB(255, 250, 138, 138),
                  ),
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 8,
                      thumbColor: Colors.transparent,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Points",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  (Application.user.earth +
                          Application.user.water +
                          Application.user.fire)
                      .toString(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget circlePointsView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SleekCircularSlider(
                      innerWidget: (double value) {
                        return Center(
                            child: Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ));
                      },
                      min: 0,
                      max: 100,
                      initialValue: Application.user.water.toDouble(),
                      appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                            trackColor: HexColor('#90E3D0'),
                            progressBarColors: [Colors.blue, Colors.blue],
                            shadowColor: Colors.blue,
                            shadowMaxOpacity: 1),
                        customWidths: CustomSliderWidths(
                            trackWidth: 4, progressBarWidth: 8, shadowWidth: 0),
                        size: 70,
                        startAngle: 270,
                        angleRange: 360,
                      ),
                      onChange: (double value) {
                        print(value);
                      }),
                ),
                Positioned(
                  top: 0,
                  left: 26,
                  child: Image.asset(
                    "assets/images/water.png",
                    height: 30,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Water",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SleekCircularSlider(
                      innerWidget: (double value) {
                        return Center(
                            child: Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ));
                      },
                      min: 0,
                      max: 100,
                      initialValue: Application.user.fire.toDouble(),
                      appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                            trackColor: HexColor('#90E3D0'),
                            progressBarColors: [Colors.red, Colors.red],
                            shadowColor: Colors.red,
                            shadowMaxOpacity: 1),
                        customWidths: CustomSliderWidths(
                            trackWidth: 4, progressBarWidth: 8, shadowWidth: 0),
                        size: 70,
                        startAngle: 270,
                        angleRange: 360,
                      ),
                      onChange: (double value) {
                        print(value);
                      }),
                ),
                Positioned(
                  top: 0,
                  left: 20,
                  child: Image.asset(
                    "assets/images/fire.png",
                    height: 30,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Fire",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SleekCircularSlider(
                      innerWidget: (double value) {
                        return Center(
                            child: Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ));
                      },
                      min: 0,
                      max: 100,
                      initialValue: Application.user.earth.toDouble(),
                      appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                            trackColor: HexColor('#90E3D0'),
                            progressBarColors: [Colors.brown, Colors.brown],
                            shadowColor: Colors.brown,
                            shadowMaxOpacity: 1),
                        customWidths: CustomSliderWidths(
                            trackWidth: 4, progressBarWidth: 8, shadowWidth: 0),
                        size: 70,
                        startAngle: 270,
                        angleRange: 360,
                      ),
                      onChange: (double value) {
                        print(value);
                      }),
                ),
                Positioned(
                  top: 0,
                  left: 22,
                  child: Image.asset(
                    "assets/images/plant.png",
                    height: 30,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "Earth",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildChallenge(BuildContext context, Challenge challenge) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10.0, 0.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => DetailPage(
                challenge: challenge,
              ),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.secondaryBackground,
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: Text(
                        challenge.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Open Sans",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        challenge.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "Open Sans",
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Image.asset(
                  "assets/images/switch.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

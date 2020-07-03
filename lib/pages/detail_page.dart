import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:honua/helpers/hex_color.dart';
import 'package:honua/models/challange.dart';
import 'package:honua/values/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../application.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.challenge}) : super(key: key);

  final Challenge challenge;

  @override
  DetailPageState createState() {
    return new DetailPageState(challenge: challenge);
  }
}

class DetailPageState extends State<DetailPage> {
  DetailPageState({Key key, @required this.challenge});
  Challenge challenge;

  @override
  void initState() {
    super.initState();
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
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackground,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        child: Image.asset(
                          "assets/images/switch.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                        ],
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: FullScreenWidget(
                            child: Hero(
                              tag: "customTag",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: challenge.image,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          Spacer(),
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
        onTap: () {},
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

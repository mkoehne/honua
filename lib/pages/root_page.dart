import 'package:flutter/material.dart';
import 'package:honua/helpers/app_translations.dart';
import 'package:honua/helpers/theme_changer.dart';
import 'package:honua/models/challange.dart';
import 'package:honua/services/repository.dart';
import 'package:honua/values/borders.dart';
import 'package:honua/values/colors.dart';
import 'package:honua/values/gradients.dart';
import 'package:honua/values/radii.dart';
import 'package:honua/widgets/main_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../application.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  RootPageState createState() {
    return new RootPageState();
  }
}

class RootPageState extends State<RootPage> {
  List<Challenge> challenages = new List<Challenge>();

  @override
  void initState() {
    super.initState();

    _saveFirstStart();
    getChallenges();
  }

  getChallenges() async {
    var list = await Repository.internal().getChallenges();

    setState(() {
      challenages = list;
    });
  }

  _saveFirstStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstStart', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
          children: <Widget>[
            // Max Size
            Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 0.87902,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.ternaryBackground,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 117,
                            height: 31,
                            margin: EdgeInsets.only(right: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 3, right: 15),
                                    child: Text(
                                      "John Bull",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontFamily: "Open Sans",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 31,
                                    height: 31,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(128, 0, 0, 0),
                                          offset: Offset(0, 2),
                                          blurRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      "assets/images/oval-3.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 54,
                          margin: EdgeInsets.only(top: 11),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "Elements",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "Open Sans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 34,
                                    margin:
                                        EdgeInsets.only(left: 27, right: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 6),
                                            child: Text(
                                              "Total",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontFamily: "Open Sans",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Opacity(
                                            opacity: 0.55109,
                                            child: Container(
                                              width: 159,
                                              height: 10,
                                              margin: EdgeInsets.only(top: 10),
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryElement,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              child: Container(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Points\n1600 ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 15,
                            height: 18,
                            margin: EdgeInsets.only(top: 15, right: 39),
                            child: Image.asset(
                              "assets/images/green-copy.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          margin: EdgeInsets.only(left: 4, top: 1, right: 19),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.fromBorderSide(
                                        Borders.secondaryBorder),
                                    borderRadius: Radii.k29pxRadius,
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    border: Border.fromBorderSide(
                                        Borders.secondaryBorder),
                                    borderRadius: Radii.k29pxRadius,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 29,
                                        height: 17,
                                        margin: EdgeInsets.only(right: 4),
                                        child: Image.asset(
                                          "assets/images/oval-4.png",
                                          fit: BoxFit.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 22,
                          margin: EdgeInsets.only(left: 7, top: 9, right: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Water",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Earth",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (context, index) =>
                      buildChallenge(context, challenages[index]),
                  itemCount: challenages.length,
                ),
              ),
            ),
          ],
        ), /*Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              top: -43,
              right: 0,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 290,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Opacity(
                            opacity: 0.87902,
                            child: Container(
                              height: 290,
                              decoration: BoxDecoration(
                                color: AppColors.ternaryBackground,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Container(),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 33,
                          top: 90,
                          right: 18,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 117,
                                  height: 31,
                                  margin: EdgeInsets.only(right: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 3, right: 15),
                                          child: Text(
                                            Application.user.firstname +
                                                " " +
                                                Application.user.lastname,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                              fontFamily: "Open Sans",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          width: 31,
                                          height: 31,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    128, 0, 0, 0),
                                                offset: Offset(0, 2),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            "assets/images/oval-2.png",
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 54,
                                margin: EdgeInsets.only(top: 11),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text(
                                          "Elements",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: 34,
                                          margin: EdgeInsets.only(
                                              left: 27, right: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 6),
                                                  child: Text(
                                                    "Total",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.primaryText,
                                                      fontFamily: "Open Sans",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Opacity(
                                                  opacity: 0.55109,
                                                  child: Container(
                                                    width: 159,
                                                    height: 10,
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryElement,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    child: Container(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Points\n1600 ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "Open Sans",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: 15,
                                  height: 18,
                                  margin: EdgeInsets.only(top: 15, right: 39),
                                  child: Image.asset(
                                    "assets/images/green-copy.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                margin:
                                    EdgeInsets.only(left: 4, top: 1, right: 19),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.fromBorderSide(
                                              Borders.secondaryBorder),
                                          borderRadius: Radii.k29pxRadius,
                                        ),
                                        child: Container(),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.fromBorderSide(
                                              Borders.secondaryBorder),
                                          borderRadius: Radii.k29pxRadius,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 29,
                                              height: 17,
                                              margin: EdgeInsets.only(right: 4),
                                              child: Image.asset(
                                                "assets/images/oval-3.png",
                                                fit: BoxFit.none,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 22,
                                margin:
                                    EdgeInsets.only(left: 7, top: 9, right: 24),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Water",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "Open Sans",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Earth",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontFamily: "Open Sans",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 45,
                          top: 236,
                          child: Text(
                            "1.000",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 144,
                          top: 156,
                          child: Container(
                            width: 48,
                            height: 10,
                            decoration: BoxDecoration(
                              gradient: Gradients.primaryGradient,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          top: 240,
                          right: 50,
                          child: Text(
                            "200",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 215,
                          child: Image.asset(
                            "assets/images/oval.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Positioned(
                          left: 56,
                          top: 195,
                          child: Image.asset(
                            "assets/images/water-2-2.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin:
                    EdgeInsets.only(left: 10, top: 42, right: 10, bottom: 40),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 15,
                      right: 0,
                      child: Container(
                        height: 360,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBackground,
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) =>
                              buildChallenge(context, challenages[index]),
                          itemCount: challenages.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),*/
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
                          color: AppColors.accentText,
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
                          color: AppColors.secondaryText,
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
                  "assets/images/group-18.png",
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

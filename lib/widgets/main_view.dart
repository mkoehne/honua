/*
*  iphone_xscopy7_widget.dart
*  Honua
*
*  Created by .
*  Copyright © 2018 . All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:honua/values/values.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Stack(
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
                          top: 59,
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
                                    "assets/images/plant.png",
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
                          top: 206,
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
                          top: 124,
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
                          top: 207,
                          right: 54,
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
                          left: 41,
                          top: 185,
                          child: Image.asset(
                            "assets/images/oval.png",
                            fit: BoxFit.none,
                          ),
                        ),
                        Positioned(
                          left: 56,
                          top: 167,
                          child: Image.asset(
                            "assets/images/water-2-2.png",
                            fit: BoxFit.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 42, right: 10, bottom: 40),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 1,
                            top: 0,
                            right: 1,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 80,
                                    height: 26,
                                    margin: EdgeInsets.only(left: 33),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            width: 19,
                                            height: 26,
                                            child: Image.asset(
                                              "assets/images/water.png",
                                              fit: BoxFit.none,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 11),
                                            child: Text(
                                              "5 Points",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 74, 144, 226),
                                                fontFamily: "Open Sans",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 70,
                                    height: 113,
                                    margin: EdgeInsets.only(left: 130, top: 71),
                                    child: Image.asset(
                                      "assets/images/group-18.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 94,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryBackground,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 28, top: 15),
                                        child: Text(
                                          "Wash your hands",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: AppColors.accentText,
                                            fontFamily: "Open Sans",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: 295,
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "You should wash your hands thoroughly for 30 seconds.   https://washyourlyrics.com",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.secondaryText,
                                              fontFamily: "Open Sans",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                            ),
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
                            top: 253,
                            right: 35,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: -1,
                                  top: -1,
                                  right: -1,
                                  bottom: -1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        height: 11,
                                        margin: EdgeInsets.only(right: 6),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 9,
                                                height: 9,
                                                margin: EdgeInsets.only(top: 2),
                                                child: Image.asset(
                                                  "assets/images/particle-05.png",
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                width: 7,
                                                height: 7,
                                                child: Image.asset(
                                                  "assets/images/particle-01.png",
                                                  fit: BoxFit.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(left: 2, top: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  width: 11,
                                                  height: 11,
                                                  margin: EdgeInsets.only(
                                                      bottom: 6),
                                                  child: Image.asset(
                                                    "assets/images/particle-04.png",
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                  width: 8,
                                                  height: 8,
                                                  margin:
                                                      EdgeInsets.only(left: 2),
                                                  child: Image.asset(
                                                    "assets/images/particle-03.png",
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  child: Image.asset(
                                                    "assets/images/particle-02.png",
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 8,
                                  right: 4,
                                  child: Image.asset(
                                    "assets/images/group.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 81,
                    margin: EdgeInsets.only(left: 157, right: 140),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 81,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 24,
                                    bottom: 73,
                                    child: Image.asset(
                                      "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-2.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          right: 12,
                                          bottom: 70,
                                          child: Image.asset(
                                            "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                left: 0,
                                                right: 0,
                                                bottom: 63,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Container(
                                                        width: 9,
                                                        height: 7,
                                                        margin: EdgeInsets.only(
                                                            bottom: 1),
                                                        child: Image.asset(
                                                          "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                                          fit: BoxFit.none,
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Container(
                                                        width: 9,
                                                        height: 7,
                                                        child: Image.asset(
                                                          "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                                          fit: BoxFit.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                right: 3,
                                                bottom: 7,
                                                child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    Positioned(
                                                      top: 7,
                                                      right: 1,
                                                      child: Image.asset(
                                                        "assets/images/path.png",
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      right: 2,
                                                      child: Image.asset(
                                                        "assets/images/group-3.png",
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 1,
                                                      child: Image.asset(
                                                        "assets/images/group-2.png",
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 0,
                                                      right: 0,
                                                      child: Image.asset(
                                                        "assets/images/shape.png",
                                                        fit: BoxFit.none,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                right: 2,
                                                bottom: 0,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Container(
                                                        width: 9,
                                                        height: 7,
                                                        margin: EdgeInsets.only(
                                                            bottom: 1),
                                                        child: Image.asset(
                                                          "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                                          fit: BoxFit.none,
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Container(
                                                        width: 9,
                                                        height: 7,
                                                        child: Image.asset(
                                                          "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                                          fit: BoxFit.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 14,
                                    bottom: 72,
                                    child: Image.asset(
                                      "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 13,
                            height: 49,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 9,
                                    height: 7,
                                    margin:
                                        EdgeInsets.only(right: 4, bottom: 7),
                                    child: Image.asset(
                                      "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 9,
                                    height: 7,
                                    margin: EdgeInsets.only(bottom: 7),
                                    child: Image.asset(
                                      "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 9,
                                    height: 7,
                                    margin: EdgeInsets.only(bottom: 7),
                                    child: Image.asset(
                                      "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 9,
                                    height: 7,
                                    margin: EdgeInsets.only(right: 4),
                                    child: Image.asset(
                                      "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 11,
                      height: 41,
                      margin: EdgeInsets.only(left: 145, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 9,
                              height: 7,
                              margin: EdgeInsets.only(left: 2, bottom: 11),
                              child: Image.asset(
                                "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 9,
                              height: 7,
                              margin: EdgeInsets.only(bottom: 9),
                              child: Image.asset(
                                "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 9,
                              height: 7,
                              margin: EdgeInsets.only(left: 2),
                              child: Image.asset(
                                "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 9,
                      height: 7,
                      margin: EdgeInsets.only(left: 175),
                      child: Image.asset(
                        "assets/images/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3d65b91767530171531268819878-copy-3.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 145,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(Borders.secondaryBorder),
                        borderRadius: Radii.k29pxRadius,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 37,
                            height: 55,
                            child: Image.asset(
                              "assets/images/oval-4.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 9),
                      child: Text(
                        "Fire",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Open Sans",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 164,
              child: Text(
                "400",
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
              top: 128,
              child: Image.asset(
                "assets/images/fire.png",
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

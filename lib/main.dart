import 'package:flutter/material.dart';
import 'package:realestateapp/screens/detailpage.dart';
import 'package:realestateapp/screens/landingscreen.dart';
import 'dart:ui';
import 'package:realestateapp/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  double screenWidth = window.physicalSize.width;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        accentColor: COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
        fontFamily: "Montserrat",
      ),
      home: LandingScreen(),
    );
  }
}

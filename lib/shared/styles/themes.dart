
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lighttheme=ThemeData(
primarySwatch: defaultcolor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,

    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
        color: Colors.black

    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultcolor,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,

    ),
  ),
 fontFamily: 'Jannah',
);

ThemeData darktheme=ThemeData(
  brightness: Brightness.dark,
  primarySwatch: defaultcolor,

  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),

    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),

  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultcolor,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,

    ),
  ),
  fontFamily: 'Jannah',

);
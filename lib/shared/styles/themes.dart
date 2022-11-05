
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mersal/shared/components/constants.dart';

ThemeData darkTheme=ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    fillColor: HexColor('22303C'),
    filled: true,
  ),
  primarySwatch: colorApp,
  scaffoldBackgroundColor: HexColor('0D1117') ,
  appBarTheme:  AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('0D1117'),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:  HexColor('0D1117'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      fontFamily: 'Jannah',
    ),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color:  Colors.black,
    ),
  ),
  textTheme:  const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Jannah',
      color: Colors.white,
    ),
    subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w600,
      height: 1.3,
      fontSize: 14.0,
      color: Colors.white,
      fontFamily: 'Jannah',
    ),

  ),
  bottomNavigationBarTheme:   BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: colorApp,
    elevation: 20.0,
    backgroundColor: HexColor('0D1117'),
    unselectedItemColor: Colors.grey,
  ),
);
ThemeData lightTheme=ThemeData(
  primarySwatch: colorApp,
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:   AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      fontFamily: 'Jannah',
    ),
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  textTheme:   const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Jannah',
      color: Colors.black,
    ),
    subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w600,
      height: 1.3,
      fontSize: 14.0,
      color: Colors.black,
      fontFamily: 'Jannah',
    ),
  ),
  bottomNavigationBarTheme:     BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: colorApp,
    elevation: 20.0,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,

  ),
);
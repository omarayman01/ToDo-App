import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color(0xff5D9CEC);
  static Color bckGroundLight = const Color(0xffDFECDB);
  static Color bckGroundDark = const Color(0xff060E1E);
  static Color green = const Color(0xff61E757);
  static Color red = const Color(0xffEC4B4B);
  static Color black = const Color(0xff242424);
  static Color white = const Color(0xffFFFFFF);
  static Color dark = const Color(0xff141922);
  static Color grey = const Color(0xffC8C9CB);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
          color: primary,
          titleTextStyle: TextStyle(
              color: white, fontSize: 22, fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: bckGroundLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primary,
        unselectedItemColor: grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: white,
          shape: CircleBorder(side: BorderSide(color: white, width: 3.5))),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primary),
          bodySmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: black),
          bodyLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: black)));
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          color: primary,
          titleTextStyle: TextStyle(
              color: white, fontSize: 22, fontWeight: FontWeight.bold)),
      scaffoldBackgroundColor: bckGroundDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: dark,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: primary,
        unselectedItemColor: grey,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: dark,
          shape: CircleBorder(side: BorderSide(color: dark, width: 3.5))),
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: primary),
          bodySmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: black),
          bodyLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: black)));
}

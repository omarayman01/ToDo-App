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

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(color: primary),
      scaffoldBackgroundColor: bckGroundLight);
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(color: primary),
      scaffoldBackgroundColor: bckGroundDark);
}

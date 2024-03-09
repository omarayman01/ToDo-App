import 'package:flutter/material.dart';
import 'package:todo_app/view/app_theme.dart';

class SettingsProvider with ChangeNotifier {
  String languageCode = 'en';
  ThemeMode themeMode = ThemeMode.light;
  Color get themeColor =>
      themeMode == ThemeMode.light ? AppTheme.white : AppTheme.dark;
  Color get textThemeColor =>
      themeMode == ThemeMode.light ? AppTheme.black : AppTheme.white;
  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    notifyListeners();
  }
}

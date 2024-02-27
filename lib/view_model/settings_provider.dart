import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  String languageCode = 'en';
  ThemeMode themeMode = ThemeMode.light;
  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguageCode) {
    languageCode = selectedLanguageCode;
    notifyListeners();
  }
}

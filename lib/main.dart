import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view/constants.dart';
import 'package:todo_app/view/features/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/view_model/settings_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      locale: Locale(settingsProvider.languageCode),
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      routes: {Routes.homeScreenRoute: (context) => const HomeScreen()},
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreenRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

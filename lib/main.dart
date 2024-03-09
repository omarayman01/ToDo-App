import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view/constants.dart';
import 'package:todo_app/view/features/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/view_model/settings_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/view_model/tasks_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.disableNetwork;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => TasksProvider()..getTasks(),
      ),
    ],
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

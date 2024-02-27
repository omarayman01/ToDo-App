import 'package:flutter/material.dart';
import 'package:todo_app/view/constants.dart';
import 'package:todo_app/view/features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: Provider.of<SettingsProvider>(context).themeMode,
      routes: {Routes.homeScreenRoute: (context) => const HomeScreen()},
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreenRoute,
      // title: 'Localizations Sample App',
      // locale: Locale(Provider.of<SettingsProvider>(context).language),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // const [
      //   // AppLocalizations.delegate, // Add this line
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: AppLocalizations.supportedLocales,
      //  const [
//         Locale('en'),
//         Locale('ar'), // Arabic
// // English
//       ],
    );
  }
}

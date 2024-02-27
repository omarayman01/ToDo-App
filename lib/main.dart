import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      // themeMode: Provider.of<SettingsProvider>(context).themeMode,
      // routes: {
      //   Routes.homeView: (context) => const HomeView(),
      //   Routes.hadethView: (context) => const HadethView(),
      //   Routes.quranView: (context) => const QuranView(),
      //   Routes.radioView: (context) => const RadioView(),
      //   Routes.sebhaView: (context) => const SebhaView(),
      //   Routes.settingsView: (context) => const SettingsView(),
      //   Routes.suraDetails: (context) => const SuraDetailsView(),
      //   Routes.hadethDetails: (context) => const HadethDetailsView(),
      // },
      debugShowCheckedModeBanner: false,
      // initialRoute: Routes.homeView,
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

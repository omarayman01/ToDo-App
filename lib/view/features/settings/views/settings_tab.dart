import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/model/language_model.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view_model/settings_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.darkMode,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Switch(
                    activeTrackColor: AppTheme.primary,
                    inactiveTrackColor: AppTheme.primary,
                    value: settings.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      if (value) {
                        settings.changeTheme(ThemeMode.dark);
                      } else {
                        settings.changeTheme(ThemeMode.light);
                      }
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Language>(
                      borderRadius: BorderRadius.circular(12),
                      value: languages.firstWhere(
                          (lang) => lang.code == settings.languageCode),
                      items: languages
                          .map((language) => DropdownMenuItem(
                                value: language,
                                child: Text(
                                  language.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          settings.changeLanguage(value.code);
                          setState(() {});
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

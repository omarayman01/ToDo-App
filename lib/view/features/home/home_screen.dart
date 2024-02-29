import 'package:flutter/material.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view/features/settings/views/settings_tab.dart';
import 'package:todo_app/view/features/tasks/views/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/view/features/tasks/widgets/add_task_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = const [TasksTab(), SettingsTab()];
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      AppLocalizations.of(context)!.toDoList,
      AppLocalizations.of(context)!.settings
    ];

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsetsDirectional.only(start: 32),
            child: Text(titles[ind]),
          ),
        ),
        body: tabs[ind],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => const AddTaskBottomSheet(),
            );
          },
          child: const Icon(
            Icons.add,
            size: 36,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          surfaceTintColor: AppTheme.white,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          notchMargin: 8,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
            currentIndex: ind,
            onTap: (value) {
              ind = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_list.png'),
                  ),
                  label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_settings.png'),
                  ),
                  label: 'Settings'),
            ],
          ),
        ));
  }
}

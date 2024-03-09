import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view_model/settings_provider.dart';

class CustomTask extends StatefulWidget {
  const CustomTask({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<CustomTask> createState() => _CustomTaskState();
}

class _CustomTaskState extends State<CustomTask> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    return widget.task.isDone == false
        ? Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: settings.themeColor),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 4,
                  color: AppTheme.primary,
                  margin: const EdgeInsetsDirectional.only(end: 12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.task.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: settings.textThemeColor),
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    widget.task.isDone = true;
                    setState(() {});
                  },
                  child: Container(
                    height: 32,
                    width: 69,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.primary),
                    child: Image.asset('assets/images/icon_check.png'),
                  ),
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: settings.themeColor),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 4,
                  color: AppTheme.green,
                  margin: const EdgeInsetsDirectional.only(end: 12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppTheme.green),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.task.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    widget.task.isDone = false;
                    setState(() {});
                  },
                  child: Container(
                    height: 32,
                    width: 69,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.white),
                    child: Text(
                      'Done!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppTheme.green),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}

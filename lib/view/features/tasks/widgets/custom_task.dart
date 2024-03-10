import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view_model/firebase_utils.dart';
import 'package:todo_app/view_model/settings_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/view_model/tasks_provider.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      FireBaseUtils.deleteTaskFromFireStore(
                        widget.task,
                      ).timeout(
                        const Duration(milliseconds: 5),
                        onTimeout: () {
                          Provider.of<TasksProvider>(context, listen: false)
                              .getTasks();
                          Fluttertoast.showToast(
                            msg: 'Task Deleted Successfuly.',
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        },
                      ).catchError((error) {
                        Fluttertoast.showToast(
                          msg: 'Something went Wrong!!',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      });
                      setState(() {});
                    },
                    backgroundColor: AppTheme.red,
                    foregroundColor: AppTheme.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: settings.themeColor),
                child: Row(
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
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            child: Slidable(
              key: const ValueKey(0),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      FireBaseUtils.deleteTaskFromFireStore(
                        widget.task,
                      ).timeout(
                        const Duration(milliseconds: 5),
                        onTimeout: () {
                          Provider.of<TasksProvider>(context, listen: false)
                              .getTasks();
                          Fluttertoast.showToast(
                            msg: 'Task Deleted Successfuly.',
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        },
                      ).catchError((error) {
                        Fluttertoast.showToast(
                          msg: 'Something went Wrong!!',
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      });
                      setState(() {});
                    },
                    backgroundColor: AppTheme.red,
                    foregroundColor: AppTheme.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(28),
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
              ),
            ),
          );
  }
}

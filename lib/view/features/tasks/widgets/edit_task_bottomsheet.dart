import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view/features/tasks/widgets/custom_button.dart';
import 'package:todo_app/view/features/tasks/widgets/custom_textformfield.dart';
import 'package:todo_app/view_model/firebase_utils.dart';
import 'package:todo_app/view_model/settings_provider.dart';
import 'package:todo_app/view_model/tasks_provider.dart';

class EditTaskBottomSheet extends StatefulWidget {
  final TaskModel task;
  const EditTaskBottomSheet({super.key, required this.task});
  @override
  State<EditTaskBottomSheet> createState() => _EditTaskBottomSheetState();
}

class _EditTaskBottomSheetState extends State<EditTaskBottomSheet> {
  dynamic selectedDate = DateTime.now();
  var dateFormate = DateFormat('dd/MM/yyyy');
  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SettingsProvider settings = Provider.of<SettingsProvider>(context);
    return Container(
      color: settings.themeColor,
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Edit Task',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: settings.textThemeColor),
          ),
          CustomTextFormField(
            hinttext: widget.task.title,
            mxlines: 1,
            controller: titleController,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            hinttext: widget.task.description,
            mxlines: 4,
            controller: descriptionController,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Selected Date',
              style:
                  textTheme.bodySmall!.copyWith(color: settings.textThemeColor),
            ),
          ),
          InkWell(
            onTap: () async {
              selectedDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  initialDate: selectedDate,
                  initialEntryMode: DatePickerEntryMode.calendarOnly);
              setState(() {});
            },
            child: Text(
              dateFormate.format(selectedDate),
              style:
                  textTheme.bodySmall!.copyWith(color: settings.textThemeColor),
            ),
          ),
          const Spacer(),
          CustomButton(
            color: AppTheme.primary,
            text: 'Edit Task',
            onpressed: () {
              FireBaseUtils.updateTaskToFireStore(
                TaskModel(
                    isDone: widget.task.isDone,
                    id: widget.task.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    dateTime: selectedDate),
              ).timeout(
                const Duration(milliseconds: 5),
                onTimeout: () {
                  Provider.of<TasksProvider>(context, listen: false).getTasks();
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: 'Updated Successfuly.',
                    toastLength: Toast.LENGTH_SHORT,
                  );
                },
              ).catchError((error) {
                Fluttertoast.showToast(
                  msg: 'Something went wrong!!',
                  toastLength: Toast.LENGTH_SHORT,
                );
              });
            },
            size: Size(MediaQuery.of(context).size.width, 50),
          ),
        ],
      ),
    );
  }

  // void editTask() {
  //   FireBaseUtils.updateTaskToFireStore(
  //     TaskModel(
  //         title: titleController.text,
  //         description: descriptionController.text,
  //         dateTime: selectedDate),
  //   ).timeout(
  //     const Duration(milliseconds: 5),
  //     onTimeout: () {
  //       Provider.of<TasksProvider>(context, listen: false).getTasks();
  //       Navigator.pop(context);
  //       Fluttertoast.showToast(
  //         msg: 'Updated Successfuly.',
  //         toastLength: Toast.LENGTH_SHORT,
  //       );
  //     },
  //   ).catchError((error) {
  //     Fluttertoast.showToast(
  //       msg: 'Something went wrong!!',
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   });
  // }
}

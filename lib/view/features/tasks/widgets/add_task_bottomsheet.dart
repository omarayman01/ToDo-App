import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view/features/tasks/widgets/custom_button.dart';
import 'package:todo_app/view/features/tasks/widgets/custom_textformfield.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Add New Task',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppTheme.black),
          ),
          const CustomTextFormField(
            hinttext: 'Task Title',
            mxlines: 1,
          ),
          const SizedBox(height: 12),
          const CustomTextFormField(
            hinttext: 'Description',
            mxlines: 4,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Selected Date',
              style: textTheme.bodySmall,
            ),
          ),
          Text(
            '17/2/2024',
            style: textTheme.bodySmall,
          ),
          const Spacer(),
          CustomButton(
            text: 'Add Task',
            onpressed: addTask,
          )
        ],
      ),
    );
  }

  void addTask() {}
}

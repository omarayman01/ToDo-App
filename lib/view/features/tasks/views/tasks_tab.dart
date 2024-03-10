import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/datetime.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view/app_theme.dart';
import 'package:todo_app/view/features/tasks/widgets/custom_task.dart';
import 'package:todo_app/view/features/tasks/widgets/edit_task_bottomsheet.dart';
import 'package:todo_app/view_model/tasks_provider.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);

    return Column(
      children: [
        TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            bottomSheetBackColor: Colors.black,
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
              compactMode: true,
              weekDaySelectedColor: AppTheme.primary,
              weekDayUnselectedColor: AppTheme.black,
              selectedBackgroundColor: AppTheme.primary,
              disableDaysBeforeNow: false),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: AppTheme.primary,
              headerTextColor: Colors.black),
          dateTime: CalendarDateTime(
              year: tasksProvider.selectedDate.year,
              month: tasksProvider.selectedDate.month,
              day: tasksProvider.selectedDate.day),
          onChangeDateTime: (calenderDateTime) {
            tasksProvider.changeSelctedDate(calenderDateTime.toDateTime());
          },
        ),
        const SizedBox(height: 5),
        Expanded(
            child: ListView.builder(
          itemCount: tasksProvider.tasks.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) =>
                      EditTaskBottomSheet(task: tasksProvider.tasks[index]),
                );
              },
              child: CustomTask(task: tasksProvider.tasks[index])),
        ))
      ],
    );
  }
}

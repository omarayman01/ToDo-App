import 'package:flutter/foundation.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/view_model/firebase_utils.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];

  DateTime selectedDate = DateTime.now();

  Future<void> getTasks() async {
    final allTasks = await FireBaseUtils.getAllTasksFromFireStore();
    tasks = allTasks
        .where((task) =>
            task.dateTime.day == selectedDate.day &&
            task.dateTime.month == selectedDate.month &&
            task.dateTime.year == selectedDate.year)
        .toList();
    tasks.sort((firstTask, secondTask) =>
        firstTask.dateTime.compareTo(secondTask.dateTime));
    notifyListeners();
  }

  void changeSelctedDate(DateTime date) {
    selectedDate = date;
    getTasks();
    notifyListeners();
  }
}

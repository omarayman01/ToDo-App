import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/model/task_model.dart';

class FireBaseUtils {
  static CollectionReference<TaskModel> getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
            fromFirestore: (snapshot, options) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (taskModel, options) => taskModel.toJson(),
          );

  static Future<void> addTaskToFireStore(TaskModel task) {
    final tasksCollection = getTasksCollection();
    final doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<void> updateTaskToFireStore(TaskModel task) {
    debugPrint('firestore');
    debugPrint(task.toString());
    debugPrint(task.id);
    final tasksCollection = getTasksCollection();
    debugPrint(task.toJson().toString());
    return tasksCollection.doc(task.id).update(task.toJson());
  }

  static Future<List<TaskModel>> getAllTasksFromFireStore() async {
    final tasksCollection = getTasksCollection();
    final snapshot = await tasksCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> deleteTaskFromFireStore(TaskModel task) {
    final tasksCollection = getTasksCollection();
    return tasksCollection.doc(task.id).delete();
  }
}

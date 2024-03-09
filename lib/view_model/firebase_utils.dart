import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Future<List<TaskModel>> getAllTasksFromFireStore() async {
    final tasksCollection = getTasksCollection();
    final snapshot = await tasksCollection.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  static deleteTaskFromFireStore(String taskID) {}
}

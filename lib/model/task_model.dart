import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id, title, description;
  DateTime dateTime;
  bool isDone;
  TaskModel(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            dateTime: (json['dateTime'] as Timestamp).toDate(),
            isDone: json['isDone']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'title': title,
        'dateTime': Timestamp.fromDate(dateTime),
        'isDone': isDone,
      };
}

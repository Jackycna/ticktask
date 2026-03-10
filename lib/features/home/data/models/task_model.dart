import 'package:tick_task/features/home/domain/entities/task_entities.dart';

class TaskModel extends TaskEntities {
  TaskModel({
    required super.description,
    required super.title,
    required super.id,
    required super.isCompleted,
  });
  factory TaskModel.fromMap(String id, Map<String, dynamic> map) => TaskModel(
    description: map["description"],
    title: map["title"],
    id: id,
    isCompleted: map["isCompleted"],
  );
  Map<String, dynamic> toMap() => {
    "description": description,
    "title": title,
    "isCompleted": false,
    "created_at": DateTime.now().millisecondsSinceEpoch,
  };
}

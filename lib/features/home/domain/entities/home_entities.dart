import 'package:tick_task/features/home/data/models/task_model.dart';

abstract class HomeEntities {
  final List<TaskModel> tasks;
  final String name;
  HomeEntities({required this.name, required this.tasks});
}

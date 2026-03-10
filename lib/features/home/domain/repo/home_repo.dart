import 'package:tick_task/features/home/data/models/task_model.dart';

abstract class HomeRepo {
  Future addtask(TaskModel task);
  Stream<List<TaskModel>> fetchTask();
  Future updateTask(String id,Map<String,dynamic> value);
  Future deleteTask(String id);
}
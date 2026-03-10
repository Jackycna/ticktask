import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/data/services/task_serviece.dart';
import 'package:tick_task/features/home/domain/repo/home_repo.dart';

class HomeRepoImpe extends HomeRepo {
  final TaskServiece taskServiece;
  HomeRepoImpe({required this.taskServiece});
  @override
  Future addtask(TaskModel task) async => await taskServiece.addTask(task);

  @override
  Stream<List<TaskModel>> fetchTask() => taskServiece.getTasks();

  @override
  Future deleteTask(String id) async => await taskServiece.deleteTask(id);

  @override
  Future updateTask(String id, Map<String,dynamic> value) async =>
      await taskServiece.updateTask(id, value);
}

import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/domain/repo/home_repo.dart';

class GetTasksUsecase {
  final HomeRepo repo;
  GetTasksUsecase({required this.repo});
  Stream<List<TaskModel>> call() => repo.fetchTask();
}

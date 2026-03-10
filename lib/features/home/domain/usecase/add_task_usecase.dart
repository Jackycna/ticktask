import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/domain/repo/home_repo.dart';

class AddTaskUsecase {
  final HomeRepo repo;
  AddTaskUsecase({required this.repo});
  Future call(TaskModel task) async => await repo.addtask(task);
}

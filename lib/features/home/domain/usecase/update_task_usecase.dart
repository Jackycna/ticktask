import 'package:tick_task/features/home/domain/repo/home_repo.dart';

class UpdateTaskUsecase {
  final HomeRepo repo;
  UpdateTaskUsecase({required this.repo});
  Future call(String id,Map<String,dynamic> data)async=>repo.updateTask(id,data );
}
import 'package:tick_task/features/home/domain/repo/home_repo.dart';

class DeleteTaskUsecase {
  final HomeRepo repo;
  DeleteTaskUsecase({required this.repo});
  Future call(String id) async => await repo.deleteTask(id);
}

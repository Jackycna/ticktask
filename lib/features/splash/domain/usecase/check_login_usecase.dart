import 'package:tick_task/features/splash/domain/repo/splash_repo.dart';

class CheckLoginUsecase {
  final SplashRepo repo;
  CheckLoginUsecase(this.repo);
  Future<void> call() async => await repo.checkLogin();
}

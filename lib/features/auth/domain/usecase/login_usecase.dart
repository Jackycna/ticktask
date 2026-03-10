import 'package:tick_task/features/auth/data/models/auth_model.dart';
import 'package:tick_task/features/auth/domain/repo/auth_repo.dart';

class LoginUsecase {
  final AuthRepo repo;
  LoginUsecase({required this.repo});
  Future call({required AuthModel credentials}) async =>
      await repo.login(credentials: credentials);
}

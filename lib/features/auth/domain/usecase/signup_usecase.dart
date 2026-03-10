import 'package:tick_task/features/auth/data/models/auth_model.dart';
import 'package:tick_task/features/auth/domain/repo/auth_repo.dart';

class SignupUsecase {
  final AuthRepo repo;
  SignupUsecase({required this.repo});
  Future call({required AuthModel credentials, required String name}) async =>
      await repo.signup(credentials: credentials, name: name);
}

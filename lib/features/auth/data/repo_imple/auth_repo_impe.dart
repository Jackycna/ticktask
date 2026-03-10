import 'package:tick_task/features/auth/data/models/auth_model.dart';
import 'package:tick_task/features/auth/data/services/auth_service.dart';
import 'package:tick_task/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpe extends AuthRepo {
  final AuthService authService;
  AuthRepoImpe(this.authService);

  @override
  Future<dynamic> login({required AuthModel credentials}) async =>
      await authService.login(credentials: credentials);

  @override
  Future<dynamic> signup({
    required AuthModel credentials,
    required String name,
  }) async => await authService.signup(credentials: credentials, name: name);
}

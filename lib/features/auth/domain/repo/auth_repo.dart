import 'package:tick_task/features/auth/data/models/auth_model.dart';

abstract class AuthRepo {
  Future signup({required AuthModel credentials, required String name});
  Future login({required AuthModel credentials});
}

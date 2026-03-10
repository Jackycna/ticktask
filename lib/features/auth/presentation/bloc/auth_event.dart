import 'package:tick_task/features/auth/data/models/auth_model.dart';

abstract class AuthEvent {}

final class ChangeAuthForm extends AuthEvent {}

final class LoginEvent extends AuthEvent {
  final AuthModel credentials;
  LoginEvent({required this.credentials});
}

final class SignupEvent extends AuthEvent {
  final AuthModel credentials;
  final String name;
  SignupEvent({required this.credentials, required this.name});
}

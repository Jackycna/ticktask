import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_task/features/auth/domain/usecase/login_usecase.dart';
import 'package:tick_task/features/auth/domain/usecase/signup_usecase.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;
  AuthBloc(this.loginUsecase, this.signupUsecase) : super(AuthState()) {
    on<ChangeAuthForm>(
      (event, emit) => emit(state.copyWith(isLogin: !state.isLogin)),
    );

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: ""));
      try {
        await loginUsecase(credentials: event.credentials);
        emit(state.copyWith(isAuthendicated: true, error: ""));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      } finally {
        emit(state.copyWith(isLoading: false, error: ""));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: ""));
      try {
        await signupUsecase(credentials: event.credentials, name: event.name);
        emit(state.copyWith(isAuthendicated: true, error: ""));
      } catch (e) {
        emit(state.copyWith(error: e.toString()));
      } finally {
        emit(state.copyWith(isLoading: false, error: ""));
      }
    });
  }
}

import 'package:get_it/get_it.dart';
import 'package:tick_task/features/auth/data/repo_imple/auth_repo_impe.dart';
import 'package:tick_task/features/auth/data/services/auth_service.dart';
import 'package:tick_task/features/auth/domain/usecase/login_usecase.dart';
import 'package:tick_task/features/auth/domain/usecase/signup_usecase.dart';

import '../presentation/bloc/auth_bloc.dart';

Future authinjection(GetIt sl) async {
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => AuthRepoImpe(sl<AuthService>()));
  sl.registerLazySingleton(() => LoginUsecase(repo: sl<AuthRepoImpe>()));
  sl.registerLazySingleton(() => SignupUsecase(repo: sl<AuthRepoImpe>()));
  sl.registerFactory(() => AuthBloc(sl<LoginUsecase>(), sl<SignupUsecase>()));
}

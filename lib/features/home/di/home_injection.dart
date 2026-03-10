import 'package:get_it/get_it.dart';
import 'package:tick_task/features/home/data/repo_imple/home_repo_impe.dart';
import 'package:tick_task/features/home/data/services/task_serviece.dart';
import 'package:tick_task/features/home/domain/usecase/add_task_usecase.dart';
import 'package:tick_task/features/home/domain/usecase/delete_task_usecase.dart';
import 'package:tick_task/features/home/domain/usecase/get_tasks_usecase.dart';
import 'package:tick_task/features/home/domain/usecase/update_task_usecase.dart';
import 'package:tick_task/features/home/presentation/bloc/home_bloc.dart';

Future homeInjection(GetIt sl) async {
  sl.registerLazySingleton(() => TaskServiece());
  sl.registerLazySingleton(
    () => HomeRepoImpe(taskServiece: sl<TaskServiece>()),
  );
  sl.registerLazySingleton(() => AddTaskUsecase(repo: sl<HomeRepoImpe>()));
  sl.registerLazySingleton(() => GetTasksUsecase(repo: sl<HomeRepoImpe>()));
  sl.registerLazySingleton(() => DeleteTaskUsecase(repo: sl<HomeRepoImpe>()));
  sl.registerLazySingleton(() => UpdateTaskUsecase(repo: sl<HomeRepoImpe>()));

  sl.registerFactory(
    () => HomeBloc(
      sl<AddTaskUsecase>(),
      sl<GetTasksUsecase>(),
      sl<UpdateTaskUsecase>(),
      sl<DeleteTaskUsecase>(),
    ),
  );
}

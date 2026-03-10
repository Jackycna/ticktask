import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/domain/usecase/add_task_usecase.dart';
import 'package:tick_task/features/home/domain/usecase/delete_task_usecase.dart';
import 'package:tick_task/features/home/domain/usecase/get_tasks_usecase.dart';
import 'package:tick_task/features/home/domain/usecase/update_task_usecase.dart';
import 'package:tick_task/features/home/presentation/bloc/home_event.dart';
import 'package:tick_task/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AddTaskUsecase addTaskUsecase;
  final GetTasksUsecase getTasksUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  HomeBloc(
    this.addTaskUsecase,
    this.getTasksUsecase,
    this.updateTaskUsecase,
    this.deleteTaskUsecase,
  ) : super(HomeState()) {
    on<AddTaskEvent>((event, emit) async {
      try {
        await addTaskUsecase(event.task);
      } catch (e) {
        print(e.toString());
      } finally {}
    });

    on<FetchTasksEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      
      await emit.forEach<List<TaskModel>>(
        getTasksUsecase(),
        onData: (data) => state.copyWith(tasks: data, filteredtask: data,isLoading: false),
      );
    });

    on<SearchByTitleEvent>((event, emit) {
      if (event.title.isEmpty) {
        emit(state.copyWith(tasks: state.filteredtask));
      } else {
        final filtered = state.tasks.where((task) {
          return task.title.toLowerCase().contains(event.title);
        }).toList();
        emit(state.copyWith(tasks: filtered));
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      try {
        await deleteTaskUsecase(event.id);
      } catch (e) {}
    });

    on<UpdateTaskEvent>((event, emit) async {
      try {
        await updateTaskUsecase(event.id, event.data);
      } catch (e) {}
    });
  }
}

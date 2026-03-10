import 'package:tick_task/features/home/data/models/task_model.dart';

class HomeState {
  final bool isLoading;
  final List<TaskModel> tasks;
  final List<TaskModel> filteredtask;
  HomeState({
    this.isLoading = false,
    this.tasks = const [],
    this.filteredtask = const [],
  });
  HomeState copyWith({
    bool? isLoading,
    List<TaskModel>? tasks,
    List<TaskModel>? filteredtask,
  }) => HomeState(
    isLoading: isLoading ?? this.isLoading,
    tasks: tasks ?? this.tasks,
    filteredtask: filteredtask ?? this.filteredtask,
  );
}

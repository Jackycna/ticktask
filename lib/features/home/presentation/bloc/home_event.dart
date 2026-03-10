import 'package:tick_task/features/home/data/models/task_model.dart';

abstract class HomeEvent {}

final class AddTaskEvent extends HomeEvent {
  final TaskModel task;
  AddTaskEvent({required this.task});
}

final class FetchTasksEvent extends HomeEvent {}

final class SearchByTitleEvent extends HomeEvent {
  final String title;
  SearchByTitleEvent({required this.title});
}

final class UpdateTaskEvent extends HomeEvent {
  final Map<String,dynamic> data;
  final String id;
  UpdateTaskEvent({required this.data, required this.id});
}

final class DeleteTaskEvent extends HomeEvent {
  final String id;
  DeleteTaskEvent({required this.id});
}

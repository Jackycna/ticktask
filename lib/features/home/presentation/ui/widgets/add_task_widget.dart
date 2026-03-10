import 'package:flutter/material.dart';
import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:tick_task/features/home/presentation/ui/widgets/add_task_form.dart';

class AddTaskWidget {
  void showTaskSheet({
    required BuildContext context,
    required HomeBloc bloc,
    TaskModel? task,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddTaskForm(bloc: bloc, task: task),
    );
  }
}

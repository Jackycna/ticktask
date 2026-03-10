import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_task/features/home/presentation/ui/widgets/add_task_widget.dart';
import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:tick_task/features/home/presentation/bloc/home_event.dart';
import 'package:tick_task/features/home/presentation/bloc/home_state.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return BlocSelector<HomeBloc, HomeState, List<TaskModel>>(
      selector: (state) => state.tasks,
      builder: (context, state) => state.isEmpty
          ? Center(child: Text("Empty"))
          : ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  tileColor: Colors.grey,
                  leading: Checkbox(
                    value: state[index].isCompleted,
                    onChanged: (value) => context.read<HomeBloc>().add(
                      UpdateTaskEvent(
                        data: {"isCompleted": value},
                        id: state[index].id,
                      ),
                    ),
                  ),
                  title: Text(state[index].title),
                  subtitle: Text(state[index].description),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => context.read<HomeBloc>().add(
                          DeleteTaskEvent(id: state[index].id),
                        ),
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          AddTaskWidget().showTaskSheet(
                            context: context,
                            bloc: bloc,
                            task: state[index],
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_task/core/common/widgets/textarea/text_form_field_widget.dart';
import 'package:tick_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:tick_task/features/home/presentation/bloc/home_event.dart';
import 'package:tick_task/features/home/presentation/bloc/home_state.dart';
import 'package:tick_task/features/home/presentation/ui/widgets/add_task_widget.dart';
import 'package:tick_task/features/home/presentation/ui/widgets/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  void showsheet() {
    AddTaskWidget().showTaskSheet(
      context: context,
      bloc: context.read<HomeBloc>(),
    );
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(FetchTasksEvent());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: state
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: .start,
                      children: [
                        SizedBox(
                          child: TextFormFieldWidget(
                            controller: searchController,
                            hint: "search",
                            onchanged: (value) {
                              context.read<HomeBloc>().add(
                                SearchByTitleEvent(title: value),
                              );
                            },
                          ),
                        ),
                        Expanded(child: TasksList()),
                      ],
                    ),
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: showsheet,
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

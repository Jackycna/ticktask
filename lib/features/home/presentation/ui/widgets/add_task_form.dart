import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_task/core/common/widgets/buttons/primary_button.dart';
import 'package:tick_task/core/common/widgets/textarea/text_form_field_widget.dart';
import 'package:tick_task/features/home/data/models/task_model.dart';
import 'package:tick_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:tick_task/features/home/presentation/bloc/home_event.dart';

class AddTaskForm extends StatefulWidget {
  final HomeBloc bloc;
  final TaskModel? task;
  const AddTaskForm({super.key, required this.bloc, this.task});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  void savetask() {
    if (widget.task != null) {
      widget.bloc.add(
        UpdateTaskEvent(
          data: {
            "title": titleController.text,
            "description": detailsController.text,
          },
          id: widget.task!.id,
        ),
      );
    } else {
      widget.bloc.add(
        AddTaskEvent(
          task: TaskModel(
            description: detailsController.text,
            title: titleController.text,
            isCompleted: false,
            id: "",
          ),
        ),
      );
    }
    context.pop();
  }

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? "";
      detailsController.text = widget.task?.description ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text(
                widget.task != null ? "Edit Task" : "Add Task",
                style: TextStyle(fontWeight: .bold, color: Colors.blueAccent),
              ),
              TextFormFieldWidget(
                controller: titleController,
                hint: "Enter title",
              ),
              TextFormFieldWidget(
                controller: detailsController,
                hint: "Enter describtion",
                maxlines: 5,
              ),
              Center(
                child: PrimaryButton(text: "Save", onpressed: savetask),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

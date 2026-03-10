import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tick_task/features/home/data/models/task_model.dart';

class TaskServiece {
  final auth = FirebaseAuth.instance;
  final db = FirebaseDatabase.instance.ref();
  Future addTask(TaskModel task) async {
    try {
      String uid = auth.currentUser!.uid;
      await db.child("users/$uid/tasks").push().set(task.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<TaskModel>> getTasks() {
    return db.child("users/${auth.currentUser!.uid}/tasks").onValue.map((
      event,
    ) {
      final data = event.snapshot.value as Map?;
      if (data == null) return [];
      return data.entries
          .map(
            (e) => TaskModel.fromMap(e.key, Map<String, dynamic>.from(e.value)),
          )
          .toList();
    });
  }

  Future deleteTask(String id) async {
    try {
      await db.child("users/${auth.currentUser!.uid}/tasks/$id").remove();
    } catch (e) {
      rethrow;
    }
  }

  Future updateTask(String id, Map<String,dynamic> data) async {
    try {
      await db.child("users/${auth.currentUser!.uid}/tasks/$id").update(
        data
      );
    } catch (e) {
      rethrow;
    }
  }
}

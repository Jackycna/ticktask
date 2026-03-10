import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tick_task/features/auth/data/models/auth_model.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final db = FirebaseDatabase.instance.ref();

  Future signup({required AuthModel credentials, required String name}) async {
    /*
Get the user details like name,email,password and then add the user in auth and then add the user details in realtime db.
 */
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );
      String id = userCredential.user!.uid;
      await db.child("users").child(id).set({
        "name": name,
        "email": credentials.email,
        "uid": id,
        "created_at": DateTime.now().toString(),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future login({required AuthModel credentials}) async {
    /*
    checks the users already exists if not return error.
     */
    try {
      await auth.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );
    } catch (e) {
      rethrow;
    }
  }
}

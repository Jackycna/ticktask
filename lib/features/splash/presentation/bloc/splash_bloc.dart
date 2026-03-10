import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashBloc extends Cubit<bool> {
  
  SplashBloc() : super(true);
  Future<void> checkLogin() async {
    await Future.delayed(Duration(seconds: 3));
    if (FirebaseAuth.instance.currentUser != null) {
      emit(true);
    } else {
      emit(false);
    }
  }
}

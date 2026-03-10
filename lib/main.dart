import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tick_task/core/depInjection/dep_injection.dart';
import 'package:tick_task/core/router/routes.dart';
import 'package:tick_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DepInjection.depInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
      title: 'Tick Task',
    );
  }
}

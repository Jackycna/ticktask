import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_task/core/common/appImages/app_images.dart';
import 'package:tick_task/features/splash/presentation/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().checkLogin();
    return Scaffold(
      body: BlocConsumer<SplashBloc, bool>(
        listener: (context, state) {
          if(state){
            context.go("/home");
          }
          else{
          context.go("/auth");
          }
        },
        builder: (context, state) {
          return Center(
            child: Image.asset(AppImages.appLogo, height: 100, width: 100),
          );
        },
      ),
    );
  }
}

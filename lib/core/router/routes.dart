import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_task/core/depInjection/dep_injection.dart';
import 'package:tick_task/features/Home/presentation/ui/screen/Home_screen.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tick_task/features/auth/presentation/ui/screen/auth_screen.dart';
import 'package:tick_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:tick_task/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tick_task/features/splash/presentation/ui/screen/splash_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
    static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider<SplashBloc>(
          create: (context) => DepInjection.sl<SplashBloc>()..checkLogin(),
          child: SplashScreen(),
        ),
        name: "splash",
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => DepInjection.sl<AuthBloc>(),
          child: AuthScreen(),
        ),
        name: "auth",
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider<HomeBloc>(
          create: (context) => DepInjection.sl<HomeBloc>(),
          child: HomeScreen(),
        ),
        name: "home",
      ),
    ],
  );
}

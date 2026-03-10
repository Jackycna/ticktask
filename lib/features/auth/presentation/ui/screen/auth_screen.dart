import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tick_task/core/common/widgets/snackbar/snackbar_widget.dart';
import 'package:tick_task/core/depInjection/dep_injection.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_state.dart';
import 'package:tick_task/features/auth/presentation/ui/widgets/login_form.dart';
import 'package:tick_task/features/auth/presentation/ui/widgets/signup_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => DepInjection.sl<AuthBloc>(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isAuthendicated) {
              context.go("/home");
            }
            if (state.error.isNotEmpty) {
              SnackbarWidget.showsnakbar(content: state.error);
            }
          },
          builder: (context, state) => state.isLoading
              ? Center(child: CircularProgressIndicator())
              : state.isLogin
              ? Center(child: LoginForm())
              : Center(child: SignupForm()),
        ),
      ),
    );
  }
}

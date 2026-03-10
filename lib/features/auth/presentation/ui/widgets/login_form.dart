import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_task/core/common/extensions/email_extension.dart';
import 'package:tick_task/core/common/widgets/buttons/primary_button.dart';
import 'package:tick_task/core/common/widgets/textarea/text_form_field_widget.dart';
import 'package:tick_task/features/auth/data/models/auth_model.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tick_task/features/auth/presentation/bloc/auth_event.dart';
import 'package:tick_task/features/auth/presentation/ui/widgets/app_logo.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  void login() {
    if (formkey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        LoginEvent(
          credentials: AuthModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              AppLogo(),
              Text('Welcome Back'),
              TextFormFieldWidget(
                controller: emailController,
                hint: "Enter Email",
                validator: (value) {
                  if (value != null && value.isValidEmail) {
                    return null;
                  }
                  return "Enter Valid Email";
                },
              ),
              TextFormFieldWidget(
                controller: passwordController,
                hint: "Enter password",
                validator: (value) {
                  if (value != null && value.length >= 6) {
                    return null;
                  }
                  return "Password must be 6 or more characters";
                },
              ),
              PrimaryButton(text: 'Login', onpressed: login),

              TextButton(
                child: Text("Don't have an account signup"),
                onPressed: () {
                  bloc.add(ChangeAuthForm());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

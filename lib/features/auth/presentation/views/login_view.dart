import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_app_bar.dart';
import 'package:medico/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar('Sign In'), body: LoginViewBody());
  }
}

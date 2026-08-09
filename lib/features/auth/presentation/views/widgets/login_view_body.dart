import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/build_page_title.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/core/widgets/password_field.dart';
import 'package:medico/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:medico/features/auth/presentation/views/widgets/prompt_texr.dart';
import 'package:medico/core/widgets/or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 93),
              CustomPageTitle(title: 'Sign In'),
              SizedBox(height: 80),
              CustomText(text: 'Email Address'),
              SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Enter email address',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 12),
              CustomText(text: 'Password'),
              SizedBox(height: 12),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'Sign In',
              ),
              SizedBox(height: 32),
              PromptText(
                text1: "Don't have an account?",
                text2: ' Create Account',
                onTap: () {
                  GoRouter.of(context).push(AppRoute.kSignUpView);
                },
              ),
              SizedBox(height: 32),
              OrDivider(),
              SizedBox(height: 32),
              Row(
                spacing: 24,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(
                    image: Assets.imagesGoogle,
                    onTap: () {
                      context.read<LoginCubit>().signInWithGoogle();
                    },
                  ),
                  if (Platform.isIOS)
                    SocialLoginButton(image: Assets.imagesApple),
                  SocialLoginButton(image: Assets.imagesFacebook),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

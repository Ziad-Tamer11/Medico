import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/widgets/build_app_bar.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/core/widgets/or_divider.dart';
import 'package:medico/core/widgets/password_field.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:medico/features/auth/presentation/views/widgets/prompt_texr.dart';
import 'package:medico/features/auth/presentation/views/widgets/social_login_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String fullName, email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 93),
              const CustomAppBar(title: 'Sign Up'),
              const SizedBox(height: 56),
              const CustomText(text: 'Full Name'),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Enter full name',
                onSaved: (value) {
                  fullName = value!;
                },
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              const CustomText(text: 'Email Address'),
              const SizedBox(height: 12),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'Enter email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomText(text: 'Password'),
              const SizedBox(height: 12),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 32),
              PromptText(
                text1: 'Already have an account?',
                text2: ' Sign In',
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              const SizedBox(height: 32),
              const OrDivider(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  const SocialLoginButton(image: Assets.imagesGoogle),
                  if (Platform.isIOS)
                    const SocialLoginButton(image: Assets.imagesApple),
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

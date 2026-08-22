import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/build_page_title.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const CustomPageTitle(title: 'Forgot Password'),
              const SizedBox(height: 16),
              Text(
                textAlign: TextAlign.center,
                "Enter your registered email and we'll send you a verification code to reset your password.",
                style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
              ),
              const SizedBox(height: 32),
              const CustomText(text: 'Email Address'),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Enter email address',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Send Code',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<ForgetPasswordCubit>().sendOtp(email: email);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

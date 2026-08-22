import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/build_page_title.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/password_field.dart';
import 'package:medico/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.resetToken});
  final String resetToken;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String newPassword, confirmPassword;

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
              const CustomPageTitle(title: 'Reset Password'),
              const SizedBox(height: 16),
              Text(
                'Enter your new password below.',
                style: TextStyles.font14Regular.copyWith(color: AppColor.grey),
              ),
              const SizedBox(height: 32),
              const CustomText(text: 'New Password'),
              const SizedBox(height: 12),
              PasswordField(
                hintText: 'Enter new password',
                onSaved: (value) => newPassword = value!,
              ),
              const SizedBox(height: 16),
              const CustomText(text: 'Confirm Password'),
              const SizedBox(height: 12),
              PasswordField(
                hintText: 'Confirm new password',
                onSaved: (value) => confirmPassword = value!,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Reset Password',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (newPassword != confirmPassword) {
                      showMessageBar(
                        context,
                        'Passwords do not match',
                        AppColor.red,
                      );
                      return;
                    }
                    context.read<ResetPasswordCubit>().resetPassword(
                      resetToken: widget.resetToken,
                      newPassword: newPassword,
                    );
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/build_page_title.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/features/auth/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';

class VerifyOtpViewBody extends StatefulWidget {
  const VerifyOtpViewBody({super.key, required this.email});
  final String email;

  @override
  State<VerifyOtpViewBody> createState() => _VerifyOtpViewBodyState();
}

class _VerifyOtpViewBodyState extends State<VerifyOtpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String otp;

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
              const CustomPageTitle(title: 'Verify Code'),
              const SizedBox(height: 16),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: TextStyles.font16Regular.copyWith(
                    color: AppColor.grey,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Enter the verification code sent to ',
                    ),
                    TextSpan(
                      text: widget.email,
                      style: TextStyles.font16Regular.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const CustomText(text: 'Verification Code'),
              const SizedBox(height: 12),
              CustomTextFormField(
                hintText: 'Enter code',
                keyboardType: TextInputType.number,
                onSaved: (value) => otp = value!,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.read<VerifyOtpCubit>().resendOtp(
                    email: widget.email,
                  ),
                  child: Text('Resend code', style: TextStyles.font16Medium),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Verify',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<VerifyOtpCubit>().verifyOtp(
                      email: widget.email,
                      otp: otp,
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

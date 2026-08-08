import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/widgets/build_app_bar.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:medico/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:medico/core/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 93),
            CustomAppBar(title: 'Sign In'),
            SizedBox(height: 80),
            CustomText(text: 'Email Address'),
            SizedBox(height: 12),
            CustomTextFormField(hintText: 'Enter email address'),
            SizedBox(height: 12),
            CustomText(text: 'Password'),
            SizedBox(height: 12),
            CustomTextFormField(
              hintText: 'Enter password',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesVisible),
              ),
            ),
            SizedBox(height: 32),
            CustomButton(onPressed: () {}, text: 'Sign In'),
            SizedBox(height: 32),
            DontHaveAccount(),
            SizedBox(height: 32),
            OrDivider(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

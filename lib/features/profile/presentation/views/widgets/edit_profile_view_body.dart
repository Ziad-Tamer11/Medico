import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/features/profile/presentation/views/widgets/name_and_text_filed.dart';

import 'package:medico/core/helpers/get_user.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  bool isVisible = false;

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    final user = getUser();
    nameController = TextEditingController(text: user?.firstName ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    phoneController = TextEditingController(text: user?.phone ?? '');
    passwordController =
        TextEditingController(); // فاضي عن قصد، شوف الملاحظة تحت
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NameAndTextField(
            title: 'Name',
            controller: nameController,
            keyboardType: TextInputType.name,
          ),
          NameAndTextField(
            title: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          NameAndTextField(
            title: 'Phone',
            controller: phoneController,
            keyboardType: TextInputType.number,
          ),
          NameAndTextField(
            title: 'Password',
            controller: passwordController,
            keyboardType: TextInputType.text,
            hintText: 'Leave empty to keep current password',
            obscureText: !isVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: isVisible
                  ? SvgPicture.asset(Assets.imagesVisible)
                  : SvgPicture.asset(Assets.imagesInVisible),
              color: Color(0xffC9CECF),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              text: 'Save Changes',
              onPressed: () {
                // final updatedName = nameController.text;
                // final updatedEmail = emailController.text;
                // final updatedPhone = phoneController.text;
                // final updatedPassword =
                //     passwordController.text; // فاضي لو المستخدم مغيرش الباسورد
                // هنا هتنادي usecase/cubit تبعت الداتا دي للـ backend
                // context.read<EditProfileCubit>().updateProfile(
                //   firstName: updatedName,
                //   email: updatedEmail,
                //   phone: updatedPhone,
                //   password: updatedPassword.isEmpty ? null : updatedPassword,
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}

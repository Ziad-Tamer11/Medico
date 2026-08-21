import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/helpers/get_user.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/features/profile/presentation/views/widgets/name_and_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    required this.isLoading,
    required this.onSave,
    required this.onChangePasswordTap,
  });

  final bool isLoading;
  final void Function(String firstName, String lastName, String phone) onSave;
  final VoidCallback onChangePasswordTap;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    final user = getUser();
    firstNameController = TextEditingController(text: user?.firstName ?? '');
    lastNameController = TextEditingController(text: user?.lastName ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    phoneController = TextEditingController(text: user?.phone ?? '');
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: widget.isLoading,
      child: SingleChildScrollView(
        child: Column(
          children: [
            NameAndTextField(
              title: 'First Name',
              controller: firstNameController,
              keyboardType: TextInputType.name,
            ),
            NameAndTextField(
              title: 'Last Name',
              controller: lastNameController,
              keyboardType: TextInputType.name,
            ),
            NameAndTextField(
              title: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              enabled: false,
            ),
            NameAndTextField(
              title: 'Phone',
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: widget.onChangePasswordTap,
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: CustomButton(
                text: 'Save Changes',
                onPressed: widget.isLoading
                    ? null
                    : () {
                        widget.onSave(
                          firstNameController.text.trim(),
                          lastNameController.text.trim(),
                          phoneController.text.trim(),
                        );
                      },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

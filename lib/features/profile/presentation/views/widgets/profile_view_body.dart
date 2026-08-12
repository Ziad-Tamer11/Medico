import 'package:flutter/material.dart';
import 'package:medico/features/profile/presentation/views/widgets/account_information.dart';
import 'package:medico/features/profile/presentation/views/widgets/user_image_and_name.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        UserImageAndName(),
        AccountInformation(),
      ],
    );
  }
}

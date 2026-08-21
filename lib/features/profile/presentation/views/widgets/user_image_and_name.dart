import 'package:flutter/material.dart';
import 'package:medico/core/helpers/get_user.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class UserImageAndName extends StatelessWidget {
  const UserImageAndName({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return Column(
      children: [
        Image.asset(
          Assets.imagesUser,
          height: MediaQuery.of(context).size.height * 0.135,
        ),
        SizedBox(height: 8),
        Text(
          user.firstName,
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        SizedBox(height: 42),
      ],
    );
  }
}

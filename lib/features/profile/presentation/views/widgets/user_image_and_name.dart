import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/auth/domain/entities/user_entity.dart';

class UserImageAndNameBody extends StatelessWidget {
  const UserImageAndNameBody({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.imagesUser,
          height: MediaQuery.of(context).size.height * 0.135,
        ),
        const SizedBox(height: 8),
        Text(
          user.fullName,
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        const SizedBox(height: 42),
      ],
    );
  }
}

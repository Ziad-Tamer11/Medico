import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.only(right: 24),
        actions: [SvgPicture.asset(Assets.imagesEditProfile, height: 28)],
      ),
      body: ProfileViewBody(),
    );
  }
}

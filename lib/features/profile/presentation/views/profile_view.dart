import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
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
        actions: [
          GestureDetector(
            onTap: () {
              CustomDialog.showConfirmationDialog(
                context: context,
                title: 'Edit Profile',
                message:
                    'You Dont Have to Update The Password To Update the Account Information Just Update The Rest',
                onConfirm: () {
                  context.push(AppRoute.kEditProfileView);
                },
              );
            },
            child: SvgPicture.asset(Assets.imagesEditProfile, height: 28),
          ),
        ],
      ),
      body: ProfileViewBody(),
    );
  }
}

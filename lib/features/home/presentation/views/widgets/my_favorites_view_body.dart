import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';

class MyFavoritesViewBody extends StatelessWidget {
  const MyFavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: kHorizontalPadding,
            right: kHorizontalPadding,
            top: 24,
            bottom: 16,
          ),
          child: Row(
            children: [
              Text(
                'Favorite Doctors',
                style: TextStyles.font18Bold.copyWith(color: AppColor.black),
              ),
              Spacer(),
              SvgPicture.asset(Assets.imagesNotSelectedCheckBox),
            ],
          ),
        ),
        NoResult(text: 'No favorit doctors found'),
      ],
    );
  }
}

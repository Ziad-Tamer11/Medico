import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

AppBar doctorInfoAppBar(BuildContext context) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        "Doctor's Info",
        style: TextStyles.font18Bold.copyWith(color: Colors.white),
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          InkWell(
            onTap: context.pop,
            child: SvgPicture.asset(
              Assets.imagesBackArrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SvgPicture.asset(Assets.imagesFavorite, color: AppColor.red),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title1, this.onTap});
  final String title1;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        children: [
          Text(
            title1,
            style: TextStyles.font18Bold.copyWith(color: AppColor.black),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'See all',
              style: TextStyles.font16Medium.copyWith(color: AppColor.primary),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class AllCategoriesCard extends StatelessWidget {
  const AllCategoriesCard({super.key});

  //category card see all
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.veryLightGrey,
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              Assets.imagesHeart,
              width: 36,
              height: 36,
              fit: BoxFit.contain,
            ),
          ),
          Spacer(flex: 2),
          Text(
            'Heart',
            style: TextStyles.font16Medium.copyWith(color: AppColor.black),
          ),
          Spacer(flex: 6),
          SvgPicture.asset(Assets.imagesForwardArrow, color: AppColor.grey),
        ],
      ),
    );
  }
}

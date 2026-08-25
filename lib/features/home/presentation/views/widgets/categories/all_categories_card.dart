import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/category_image.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';

class AllCategoriesCard extends StatelessWidget {
  const AllCategoriesCard({super.key, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  //category card see all
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoute.kDoctorsByCategoryView, extra: categoryEntity);
      },
      child: Container(
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
              child: CategoryImage(
                imageUrl: categoryEntity.image,
                width: 36,
                height: 36,
              ),
            ),
            Spacer(flex: 2),
            Text(
              categoryEntity.name,
              style: TextStyles.font16Medium.copyWith(color: AppColor.black),
            ),
            Spacer(flex: 6),
            SvgPicture.asset(Assets.imagesForwardArrow, color: AppColor.grey),
          ],
        ),
      ),
    );
  }
}

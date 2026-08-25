import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/category_image.dart';
import 'package:medico/features/home/domain/entities/category_entity.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.onTap, required this.categoryEntity});
  final CategoryEntity categoryEntity;
  final void Function()? onTap;
  //category card home
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF0F4FB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryImage(imageUrl: categoryEntity.image, width: 36, height: 36),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                categoryEntity.name,
                textAlign: TextAlign.center,
                style: TextStyles.font12SemiBold.copyWith(
                  color: const Color(0xFF7D8994),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

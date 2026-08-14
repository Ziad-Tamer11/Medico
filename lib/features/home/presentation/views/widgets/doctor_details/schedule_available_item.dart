import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class ScheduleAvailableItem extends StatelessWidget {
  const ScheduleAvailableItem({
    super.key,
    this.onTap,
    required this.isSelected,
  });
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 12,
        ),
        decoration: ShapeDecoration(
          color: isSelected ? AppColor.babyBlue : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? AppColor.primary : AppColor.veryLightGrey,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          '10:30am - 11:30am',
          style: TextStyles.font12SemiBold.copyWith(
            color: isSelected ? AppColor.primary : AppColor.black,
          ),
        ),
      ),
    );
  }
}

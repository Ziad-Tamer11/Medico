import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class ScheduleAvailableItem extends StatelessWidget {
  const ScheduleAvailableItem({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.time,
    this.isDisabled = false,
  });
  final bool isSelected;
  final VoidCallback? onTap;
  final String time;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          color: isSelected ? AppColor.babyBlue : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isDisabled
                  ? AppColor.veryLightGrey
                  : isSelected
                  ? AppColor.primary
                  : AppColor.veryLightGrey,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          time,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.font12SemiBold.copyWith(
            color: isDisabled
                ? AppColor.grey
                : isSelected
                ? AppColor.primary
                : AppColor.black,
            decoration: isDisabled ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}

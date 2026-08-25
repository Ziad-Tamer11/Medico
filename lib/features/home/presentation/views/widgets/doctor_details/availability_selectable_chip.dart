import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

// Shared chip used by both the Month and Day selectors so unavailable
// entries look visibly disabled (grayed, untappable) instead of being
// silently omitted from the list.
class AvailabilitySelectableChip extends StatelessWidget {
  const AvailabilitySelectableChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.isEnabled,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = isSelected && isEnabled;
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: isActive ? AppColor.babyBlue : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: !isEnabled
                  ? AppColor.veryLightGrey
                  : isActive
                  ? AppColor.primary
                  : AppColor.veryLightGrey,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          label,
          style: TextStyles.font12SemiBold.copyWith(
            color: !isEnabled
                ? AppColor.blueGrey
                : isActive
                ? AppColor.primary
                : AppColor.black,
          ),
        ),
      ),
    );
  }
}

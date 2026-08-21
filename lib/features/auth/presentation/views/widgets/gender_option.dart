import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class GenderOption extends StatelessWidget {
  const GenderOption({
    required this.label,
    required this.isSelected,
    required this.hasError,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool hasError;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = hasError
        ? AppColor.red
        : isSelected
        ? AppColor.primary
        : const Color(0xFFF4F4F6);

    final textColor = hasError
        ? AppColor.red
        : isSelected
        ? AppColor.primary
        : AppColor.grey;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.veryLightGrey : const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: (isSelected || hasError) ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyles.font16Regular.copyWith(
            color: textColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

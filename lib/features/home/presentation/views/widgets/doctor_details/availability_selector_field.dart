import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

// A tappable filled "field" box that opens a dialog list of options when
// enabled. Shared by the Month and Day selectors so both sit side by side
// under one shared heading, looking and behaving the same.
class AvailabilitySelectorField extends StatelessWidget {
  const AvailabilitySelectorField({
    super.key,
    required this.placeholder,
    required this.valueText,
    required this.enabled,
    required this.onTap,
    this.hasError = false,
  });

  final String placeholder;
  final String? valueText;
  final bool enabled;
  final VoidCallback onTap;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: ShapeDecoration(
          color: Color(0xffFAFAFC),
          shape: RoundedRectangleBorder(
            side: hasError
                ? const BorderSide(color: AppColor.red, width: 1.4)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                valueText ?? placeholder,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font14SemiBold.copyWith(
                  color: valueText != null
                      ? AppColor.doctorCardSubtitle
                      : AppColor.grey,
                ),
              ),
            ),
            SvgPicture.asset(
              Assets.imagesForwardArrow,
              color: Color(0xffB2BCC9),
            ),
          ],
        ),
      ),
    );
  }
}

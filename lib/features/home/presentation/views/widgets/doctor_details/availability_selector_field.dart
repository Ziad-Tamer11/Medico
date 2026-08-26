import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

// A tappable "field" container that opens a dialog list of options when
// enabled. Shared by the Month and Day selectors so both steps look and
// behave the same, stacked one under the other.
class AvailabilitySelectorField extends StatelessWidget {
  const AvailabilitySelectorField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.valueText,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final String placeholder;
  final String? valueText;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font18Bold),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: ShapeDecoration(
              color: enabled ? Colors.transparent : AppColor.veryLightGrey,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColor.veryLightGrey),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    valueText ?? placeholder,
                    style: TextStyles.font14SemiBold.copyWith(
                      color: valueText != null
                          ? AppColor.black
                          : AppColor.blueGrey,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: enabled ? AppColor.primary : AppColor.blueGrey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

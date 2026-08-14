import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class ScheduleNotAvailableItem extends StatelessWidget {
  const ScheduleNotAvailableItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColor.veryLightGrey),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Text('10:30am - 11:30am', style: TextStyles.font12SemiBold),
    );
  }
}

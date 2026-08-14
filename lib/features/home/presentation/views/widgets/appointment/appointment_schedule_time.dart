import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class AppointmentScheduleTime extends StatelessWidget {
  const AppointmentScheduleTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.grey.withValues(alpha: .2)),
            ),
            child: Column(
              children: [
                Text(
                  '25 December Monday',
                  textAlign: TextAlign.center,
                  style: TextStyles.font16Bold,
                ),
                const SizedBox(height: 8),
                Text('Date ', style: TextStyles.font16Regular),
              ],
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.grey.withValues(alpha: .2)),
            ),
            child: Column(
              children: [
                Text(
                  '12:00 pm - 12:30 pm',
                  textAlign: TextAlign.center,
                  style: TextStyles.font16Bold,
                ),
                const SizedBox(height: 8),
                Text('Time', style: TextStyles.font16Regular),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

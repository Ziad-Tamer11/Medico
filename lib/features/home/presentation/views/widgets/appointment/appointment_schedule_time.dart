import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class AppointmentScheduleTime extends StatelessWidget {
  const AppointmentScheduleTime({
    super.key,
    required this.date,
    required this.time,
  });
  final DateTime date;
  final String time;
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM EEEE').format(date);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedDate,
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
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.grey.withValues(alpha: .2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                    style: TextStyles.font16Bold,
                  ),
                  const SizedBox(height: 8),
                  Text('Time', style: TextStyles.font16Regular),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

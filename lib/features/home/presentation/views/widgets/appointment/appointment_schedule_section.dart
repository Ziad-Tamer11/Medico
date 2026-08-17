import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/appointment_schedule_time.dart';

class AppointmentScheduleSection extends StatelessWidget {
  const AppointmentScheduleSection({
    super.key,
    required this.date,
    required this.time,
  });
  final DateTime date;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Schedule', style: TextStyles.font18Bold),
        const SizedBox(height: 24),
        AppointmentScheduleTime(date: date, time: time),
      ],
    );
  }
}

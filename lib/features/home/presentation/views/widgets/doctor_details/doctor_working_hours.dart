import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/helpers/format_time_12h.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_working_hours_entity.dart';

// Shows today's working hours for this doctor, from the backend's real
// per-weekday schedule (GET /doctors/{id}/working-hours) - not derived
// from availability slots anymore. Renders a "closed today" message if
// the doctor has no entry for today's day of week, rather than hiding
// the row silently.
class DoctorWorkingHours extends StatelessWidget {
  const DoctorWorkingHours({super.key, required this.workingHours});

  final List<DoctorWorkingHoursEntity> workingHours;

  @override
  Widget build(BuildContext context) {
    // Backend uses 0 = Monday .. 6 = Sunday; DateTime.weekday is 1 = Monday
    // .. 7 = Sunday.
    final todayDayOfWeek = DateTime.now().weekday - 1;
    DoctorWorkingHoursEntity? today;
    for (final hours in workingHours) {
      if (hours.dayOfWeek == todayDayOfWeek) {
        today = hours;
        break;
      }
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.imagesTime, color: const Color(0xff7D8A95)),
          const SizedBox(width: 8),
          Text(
            today == null
                ? 'Closed today'
                : '${formatTime12h(today.startTime)} - ${formatTime12h(today.endTime)}',
            style: TextStyles.font14Medium.copyWith(color: AppColor.black),
          ),
        ],
      ),
    );
  }
}

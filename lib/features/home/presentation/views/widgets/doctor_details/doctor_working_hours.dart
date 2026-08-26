import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/helpers/format_time_12h.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';

// The backend has no "working hours" field on the doctor itself - only
// individual availability slots. This derives a simple working-hours
// summary (earliest start, latest end) from the doctor's own already-
// fetched availability list, rather than inventing a backend contract
// that doesn't exist. Renders nothing if there's no availability yet.
class DoctorWorkingHours extends StatelessWidget {
  const DoctorWorkingHours({super.key, required this.availability});

  final List<DoctorAvailabilityEntity> availability;

  @override
  Widget build(BuildContext context) {
    if (availability.isEmpty) return const SizedBox.shrink();

    final startTimes = availability.map((slot) => slot.startTime).toList()
      ..sort();
    final endTimes = availability.map((slot) => slot.endTime).toList()..sort();

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.imagesTime, color: const Color(0xff7D8A95)),
          const SizedBox(width: 8),
          Text(
            '${formatTime12h(startTimes.first)} - ${formatTime12h(endTimes.last)}',
            style: TextStyles.font14Medium.copyWith(color: AppColor.black),
          ),
        ],
      ),
    );
  }
}

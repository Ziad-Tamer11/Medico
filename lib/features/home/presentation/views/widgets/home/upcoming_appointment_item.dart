import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/doctor_image.dart';
import 'package:medico/core/widgets/doctor_name.dart';
import 'package:medico/core/widgets/doctor_specialist.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_rating.dart';

class UpcomingAppointmentItem extends StatelessWidget {
  const UpcomingAppointmentItem({
    super.key,
    required this.appointment,
    required this.doctor,
  });

  final AppointmentEntity appointment;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColor.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorImage(imageUrl: doctor.image),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorName(
                      doctorEntity: doctor,
                      textStyle: TextStyles.font14SemiBold.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    DoctorSpecialist(
                      doctorEntity: doctor,
                      showWorkPlace: false,
                      textStyle: TextStyles.font14Medium.copyWith(
                        color: AppColor.babyBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    DoctorRating(
                      doctorEntity: doctor,
                      textStyle: TextStyles.font14Medium.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 50),
                child: InkWell(
                  onTap: () {
                    // _cancelAppointment(context);
                  },
                  child: const Icon(
                    Icons.more_vert,
                    color: AppColor.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesCalender, color: AppColor.white),
              SizedBox(width: 8),
              Text(
                '${_getMonthAbbreviation(appointment.date.month)} ${appointment.date.day}',
                style: TextStyles.font14Regular.copyWith(color: AppColor.white),
              ),
              SizedBox(width: 24),
              SvgPicture.asset(Assets.imagesTime, color: AppColor.white),
              SizedBox(width: 8),
              Text(
                appointment.startTime,
                style: TextStyles.font14Regular.copyWith(color: AppColor.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getMonthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return months[month - 1];
  }
}

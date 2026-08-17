import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/doctor_name.dart';
import 'package:medico/core/widgets/doctor_specialist.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/appointment_schedule_section.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/custom_button_bloc_consumer.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_rating.dart';

class AppointmentDetailsViewBody extends StatelessWidget {
  const AppointmentDetailsViewBody({
    super.key,
    required this.appointmentSelectionEntity,
  });
  final AppointmentSelectionEntity appointmentSelectionEntity;
  @override
  Widget build(BuildContext context) {
    final doctor = appointmentSelectionEntity.doctor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.grey.withValues(alpha: .2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesDoctorProfile),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DoctorName(doctorEntity: doctor),
                          Spacer(),
                          DoctorRating(doctorEntity: doctor),
                        ],
                      ),
                      DoctorSpecialist(doctorEntity: doctor),
                      Text(
                        'Appointment Rate: \$${doctor.hourlyRate.toStringAsFixed(2)}',
                        style: TextStyles.font14SemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          AppointmentScheduleSection(
            date: appointmentSelectionEntity.date,
            time: appointmentSelectionEntity.time,
          ),
          const SizedBox(height: 100),
          CustomButtonBlocConsumer(
            appointmentSelectionEntity: appointmentSelectionEntity,
          ),
        ],
      ),
    );
  }
}

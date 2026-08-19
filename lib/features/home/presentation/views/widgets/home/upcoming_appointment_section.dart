import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/home/upcoming_appointment_list_view.dart';

class UpcomingAppointmentSection extends StatelessWidget {
  const UpcomingAppointmentSection({
    super.key,
    required this.appointments,
    required this.doctors,
  });
  final List<AppointmentEntity> appointments;
  final List<DoctorEntity> doctors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Appointments',
            style: TextStyles.font18Bold.copyWith(color: AppColor.black),
          ),
          const SizedBox(height: 24),
          UpcomingAppointmentListView(
            appointments: appointments,
            doctors: doctors,
          ),
        ],
      ),
    );
  }
}

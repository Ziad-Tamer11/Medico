import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/doctors/domain/entities/appointment_entity.dart';
import 'package:medico/features/doctors/domain/entities/doctor_entity.dart';
import 'package:medico/features/doctors/presentation/manager/cancel_appointment_cubit/cancel_appointment_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_card.dart';

class BookingAppointmentItem extends StatelessWidget {
  const BookingAppointmentItem({
    super.key,
    required this.appointment,
    required this.doctor,
  });

  final AppointmentEntity appointment;
  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            _formatDateTime(appointment.date, appointment.startTime),
            style: TextStyles.font16Bold,
          ),
        ),
        const SizedBox(height: 8),
        DoctorCard(
          doctorEntity: doctor,
          buttonText: 'Cancel Appointment',
          onButtonTap: () => CustomDialog.showCancelAppointmentDialog(
            context: context,
            doctorName: doctor.name,
            onConfirm: () => context.read<CancelAppointmentCubit>().cancelAppointment(
              appointment.id,
              doctorName: doctor.name,
            ),
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime date, String startTime) {
    final timeParts = startTime.split(':');
    final combined = DateTime(
      date.year,
      date.month,
      date.day,
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
    );
    return DateFormat('EEEE, MMMM d, yyyy h:mm a').format(combined);
  }
}

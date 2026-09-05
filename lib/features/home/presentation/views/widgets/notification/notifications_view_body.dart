import 'package:flutter/material.dart';
import 'package:medico/features/doctors/domain/entities/appointment_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/no_result.dart';
import 'package:medico/features/home/presentation/views/widgets/notification/notification_item.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key, required this.appointments});

  final List<AppointmentEntity> appointments;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return const Center(child: NoResult(text: 'No notifications found'));
    }
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        return NotificationItem(appointment: appointments[index]);
      },
    );
  }
}

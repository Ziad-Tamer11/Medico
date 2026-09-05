import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/doctors/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/appointment_details_view_body.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key, required this.appointmentSelection});
  final AppointmentSelectionEntity appointmentSelection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Appointment Details'),
      body: AppointmentDetailsViewBody(
        appointmentSelectionEntity: appointmentSelection,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/available_date_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_overview_list.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_section.dart';

// Pure UI: renders the loaded availability for one doctor, plus the booking
// CTA. Date/slot selection stays owned by the parent (DoctorInfoBottomSheet)
// since it needs setState across the whole bottom sheet, not just this part.
class AvailabilityContent extends StatelessWidget {
  const AvailabilityContent({
    super.key,
    required this.doctorEntity,
    required this.availability,
    required this.selectedDate,
    required this.selectedSlot,
    required this.onDateSelected,
    required this.onSlotSelected,
  });

  final DoctorEntity doctorEntity;
  final List<DoctorAvailabilityEntity> availability;
  final DateTime? selectedDate;
  final DoctorAvailabilityEntity? selectedSlot;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<DoctorAvailabilityEntity> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    final availableDates = _uniqueSortedDates(availability);
    final slotsForSelectedDate = selectedDate == null
        ? const <DoctorAvailabilityEntity>[]
        : availability
              .where((slot) => _isSameDay(slot.date, selectedDate!))
              .toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          DoctorOverviewSection(doctorEntity: doctorEntity),
          const SizedBox(height: 24),
          if (availableDates.isEmpty)
            const Text('This doctor has no available slots right now.')
          else ...[
            AvailableDateSection(
              dates: availableDates,
              selectedDate: selectedDate,
              onDateSelected: onDateSelected,
            ),
            const SizedBox(height: 24),
            if (selectedDate != null)
              ScheduleSection(
                slots: slotsForSelectedDate,
                selectedSlot: selectedSlot,
                onSlotSelected: onSlotSelected,
              ),
          ],
          const SizedBox(height: 40),
          CustomButton(
            text: 'Book Appointment',
            onPressed: () => _onBookAppointment(context),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _onBookAppointment(BuildContext context) {
    if (selectedDate == null) {
      showMessageBar(context, 'Please select a date', AppColor.red);
      return;
    }
    if (selectedSlot == null) {
      showMessageBar(context, 'Please select a time', AppColor.red);
      return;
    }
    final appointmentSelection = AppointmentSelectionEntity(
      doctor: doctorEntity,
      date: selectedDate!,
      startTime: selectedSlot!.startTime,
      endTime: selectedSlot!.endTime,
    );
    context.push(AppRoute.kAppointmentDetailsView, extra: appointmentSelection);
  }

  List<DateTime> _uniqueSortedDates(
    List<DoctorAvailabilityEntity> availability,
  ) {
    final dates = <DateTime>[];
    for (final slot in availability) {
      if (!dates.any((date) => _isSameDay(date, slot.date))) {
        dates.add(slot.date);
      }
    }
    dates.sort();
    return dates;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

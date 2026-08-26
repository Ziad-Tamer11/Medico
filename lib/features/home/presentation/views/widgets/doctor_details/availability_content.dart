import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/domain/entities/doctor_availability_entity.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar_card.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_overview_list.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/schedule_section.dart';

// Renders the loaded availability for one doctor as a Month/Day calendar
// card plus the booking CTA. Selection state stays owned by the parent
// (DoctorInfoBottomSheet) since it needs setState across the whole bottom
// sheet, not just this part; this widget only keeps its own local
// "show a validation error" flag for the red-border feedback on a failed
// booking attempt. The first available month is auto-selected once
// availability loads, so the Days grid always has a valid month behind it.
class AvailabilityContent extends StatefulWidget {
  const AvailabilityContent({
    super.key,
    required this.doctorEntity,
    required this.availability,
    required this.selectedMonth,
    required this.selectedDate,
    required this.selectedSlot,
    required this.onMonthSelected,
    required this.onDateSelected,
    required this.onSlotSelected,
  });

  final DoctorEntity doctorEntity;
  final List<DoctorAvailabilityEntity> availability;
  final DateTime? selectedMonth;
  final DateTime? selectedDate;
  final DoctorAvailabilityEntity? selectedSlot;
  final ValueChanged<DateTime> onMonthSelected;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<DoctorAvailabilityEntity> onSlotSelected;

  @override
  State<AvailabilityContent> createState() => _AvailabilityContentState();
}

class _AvailabilityContentState extends State<AvailabilityContent> {
  bool _dateError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || widget.selectedMonth != null) return;
      final months = buildAvailableMonths(
        _uniqueSortedDates(widget.availability),
      );
      if (months.any((month) => month.hasAvailability)) {
        final firstAvailable = months.firstWhere(
          (month) => month.hasAvailability,
        );
        widget.onMonthSelected(
          DateTime(firstAvailable.year, firstAvailable.month),
        );
      }
    });
  }

  void _handleMonthSelected(DateTime month) {
    setState(() => _dateError = false);
    widget.onMonthSelected(month);
  }

  void _handleDateSelected(DateTime date) {
    setState(() => _dateError = false);
    widget.onDateSelected(date);
  }

  @override
  Widget build(BuildContext context) {
    final availableDates = _uniqueSortedDates(widget.availability);
    final months = buildAvailableMonths(availableDates);
    final daysForSelectedMonth = widget.selectedMonth == null
        ? const <AvailabilityDay>[]
        : buildDaysForMonth(
            year: widget.selectedMonth!.year,
            month: widget.selectedMonth!.month,
            availableDates: availableDates,
          );
    final slotsForSelectedDate = widget.selectedDate == null
        ? const <DoctorAvailabilityEntity>[]
        : widget.availability
              .where((slot) => _isSameDay(slot.date, widget.selectedDate!))
              .toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          DoctorOverviewSection(doctorEntity: widget.doctorEntity),
          const SizedBox(height: 24),
          if (months.isEmpty)
            const Text('This doctor has no available slots right now.')
          else ...[
            AvailabilityCalendarCard(
              months: months,
              selectedMonth: widget.selectedMonth,
              onMonthSelected: _handleMonthSelected,
              days: daysForSelectedMonth,
              selectedDate: widget.selectedDate,
              onDateSelected: _handleDateSelected,
              hasError: _dateError,
            ),
            const SizedBox(height: 24),
            if (widget.selectedDate != null)
              ScheduleSection(
                slots: slotsForSelectedDate,
                selectedSlot: widget.selectedSlot,
                onSlotSelected: widget.onSlotSelected,
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
    if (widget.selectedMonth == null || widget.selectedDate == null) {
      setState(() => _dateError = true);
      showMessageBar(context, 'Please select a date', AppColor.red);
      return;
    }
    if (widget.selectedSlot == null) {
      showMessageBar(context, 'Please select a time', AppColor.red);
      return;
    }
    final appointmentSelection = AppointmentSelectionEntity(
      doctor: widget.doctorEntity,
      date: widget.selectedDate!,
      startTime: widget.selectedSlot!.startTime,
      endTime: widget.selectedSlot!.endTime,
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

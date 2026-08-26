import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_selector_field.dart';

class AvailableDateSection extends StatelessWidget {
  const AvailableDateSection({
    super.key,
    required this.days,
    required this.enabled,
    required this.selectedDate,
    required this.onDateSelected,
    this.hasError = false,
  });

  final List<AvailabilityDay> days;
  final bool enabled;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return AvailabilitySelectorField(
      placeholder: 'Day',
      valueText: selectedDate == null
          ? null
          : DateFormat('EEE, d').format(selectedDate!),
      enabled: enabled,
      hasError: hasError,
      onTap: () async {
        final picked = await CustomDialog.showListPickerDialog<AvailabilityDay>(
          context: context,
          title: 'Select Day',
          items: days,
          labelBuilder: (day) => '${day.date.day}',
          isEnabled: (day) => day.hasAvailability,
          isSelected: (day) =>
              selectedDate != null && _isSameDay(selectedDate!, day.date),
        );
        if (picked != null) {
          onDateSelected(picked.date);
        }
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

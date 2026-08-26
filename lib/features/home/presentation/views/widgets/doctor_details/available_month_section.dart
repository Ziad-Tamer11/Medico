import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_selector_field.dart';

class AvailableMonthSection extends StatelessWidget {
  const AvailableMonthSection({
    super.key,
    required this.months,
    required this.selectedMonth,
    required this.onMonthSelected,
  });

  final List<AvailabilityMonth> months;
  final DateTime? selectedMonth;
  final ValueChanged<DateTime> onMonthSelected;

  @override
  Widget build(BuildContext context) {
    return AvailabilitySelectorField(
      label: 'Select Month',
      placeholder: 'Choose a month',
      valueText: selectedMonth == null
          ? null
          : DateFormat('MMMM yyyy').format(selectedMonth!),
      enabled: months.isNotEmpty,
      onTap: () async {
        final picked = await CustomDialog.showListPickerDialog<AvailabilityMonth>(
          context: context,
          title: 'Select Month',
          items: months,
          labelBuilder: (month) =>
              DateFormat('MMMM yyyy').format(DateTime(month.year, month.month)),
          isEnabled: (month) => month.hasAvailability,
          isSelected: (month) =>
              selectedMonth != null &&
              selectedMonth!.year == month.year &&
              selectedMonth!.month == month.month,
        );
        if (picked != null) {
          onMonthSelected(DateTime(picked.year, picked.month));
        }
      },
    );
  }
}

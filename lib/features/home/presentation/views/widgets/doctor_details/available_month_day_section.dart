import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/available_date_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/available_month_section.dart';

// Single "Select Date" heading over two fields side by side: Day on the
// left, Month on the right. The Day field stays disabled (not hidden)
// until a month is picked, so it stays impossible to pick out of order.
class AvailableMonthDaySection extends StatelessWidget {
  const AvailableMonthDaySection({
    super.key,
    required this.months,
    required this.selectedMonth,
    required this.onMonthSelected,
    required this.days,
    required this.selectedDate,
    required this.onDateSelected,
    this.hasError = false,
  });

  final List<AvailabilityMonth> months;
  final DateTime? selectedMonth;
  final ValueChanged<DateTime> onMonthSelected;
  final List<AvailabilityDay> days;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: TextStyles.font18Bold),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AvailableDateSection(
                days: days,
                enabled: selectedMonth != null,
                selectedDate: selectedDate,
                onDateSelected: onDateSelected,
                hasError: hasError,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AvailableMonthSection(
                months: months,
                selectedMonth: selectedMonth,
                onMonthSelected: onMonthSelected,
                hasError: hasError,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

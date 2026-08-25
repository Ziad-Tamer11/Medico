import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_calendar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/availability_selectable_chip.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Month', style: TextStyles.font18Bold),
        const SizedBox(height: 16),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: months.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final month = months[index];
              final isSelected =
                  selectedMonth != null &&
                  selectedMonth!.year == month.year &&
                  selectedMonth!.month == month.month;
              return AvailabilitySelectableChip(
                label: DateFormat(
                  'MMMM yyyy',
                ).format(DateTime(month.year, month.month)),
                isSelected: isSelected,
                isEnabled: month.hasAvailability,
                onTap: () => onMonthSelected(DateTime(month.year, month.month)),
              );
            },
          ),
        ),
      ],
    );
  }
}

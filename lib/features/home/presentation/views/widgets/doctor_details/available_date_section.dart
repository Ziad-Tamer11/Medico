import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class AvailableDateSection extends StatelessWidget {
  const AvailableDateSection({
    super.key,
    required this.dates,
    required this.selectedDate,
    required this.onDateSelected,
  });

  final List<DateTime> dates;
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: TextStyles.font18Bold),
        const SizedBox(height: 16),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected =
                  selectedDate != null &&
                  selectedDate!.year == date.year &&
                  selectedDate!.month == date.month &&
                  selectedDate!.day == date.day;
              return GestureDetector(
                onTap: () => onDateSelected(date),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: isSelected ? AppColor.babyBlue : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: isSelected
                            ? AppColor.primary
                            : AppColor.veryLightGrey,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    DateFormat('d MMM').format(date),
                    style: TextStyles.font12SemiBold.copyWith(
                      color: isSelected ? AppColor.primary : AppColor.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

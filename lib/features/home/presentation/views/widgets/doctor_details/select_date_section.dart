import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/date_and_month_card.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/day_picker_dialog.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/month_picker_dialog.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key, required this.onDateSelected});
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  DateTime? selectedDay;
  DateTime? selectedMonth;
  void _updateSelectedDate() {
    if (selectedDay == null && selectedMonth == null) {
      return;
    }
    if (selectedDay != null && selectedMonth != null) {
      final date = DateTime(
        selectedMonth!.year,
        selectedMonth!.month,
        selectedDay!.day,
      );
      widget.onDateSelected(date);
    } else if (selectedDay != null) {
      widget.onDateSelected(selectedDay!);
    } else {
      widget.onDateSelected(selectedMonth!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Date', style: TextStyles.font18Bold),
        const SizedBox(height: 24),
        Row(
          children: [
            DateAndMonthCard(
              title: selectedDay == null ? 'Day' : '${selectedDay!.day}',
              onTap: () async {
                final selectedDate = await showDialog<DateTime>(
                  context: context,
                  builder: (context) {
                    return DayPickerDialog(
                      onDateSelected: (date) {
                        Navigator.of(context).pop(date);
                      },
                    );
                  },
                );

                if (selectedDate != null) {
                  setState(() {
                    selectedDay = selectedDate;
                  });
                  _updateSelectedDate();
                }
              },
            ),
            Spacer(),
            DateAndMonthCard(
              title: selectedMonth == null
                  ? 'Month'
                  : DateFormat('MMMM').format(selectedMonth!),
              onTap: () async {
                final selectedDate = await showDialog<DateTime>(
                  context: context,
                  builder: (context) {
                    return MonthPickerDialog(
                      onDateSelected: (date) {
                        Navigator.of(context).pop(date);
                      },
                    );
                  },
                );
                if (selectedDate != null) {
                  setState(() {
                    selectedMonth = selectedDate;
                  });
                  _updateSelectedDate();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

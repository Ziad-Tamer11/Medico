import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/presentation/views/widgets/date_and_month_card.dart';

class SelectDateSection extends StatefulWidget {
  const SelectDateSection({super.key});

  @override
  State<SelectDateSection> createState() => _SelectDateSectionState();
}

class _SelectDateSectionState extends State<SelectDateSection> {
  DateTime? selectedDay;
  DateTime? selectedMonth;
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
              onTap: () {},
            ),
            Spacer(),
            DateAndMonthCard(
              title: selectedMonth == null
                  ? 'Month'
                  : '${selectedMonth!.month}',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

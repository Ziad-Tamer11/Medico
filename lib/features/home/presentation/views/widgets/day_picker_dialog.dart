import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

class DayPickerDialog extends StatelessWidget {
  const DayPickerDialog({super.key, required this.onDateSelected});

  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: DaysPicker(
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: onDateSelected,
        ),
      ),
    );
  }
}

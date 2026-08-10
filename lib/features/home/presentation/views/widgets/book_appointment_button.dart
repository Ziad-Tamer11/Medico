import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFFE8F0FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Book Appointment',
              textAlign: TextAlign.center,
              style: TextStyles.font14SemiBold.copyWith(
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

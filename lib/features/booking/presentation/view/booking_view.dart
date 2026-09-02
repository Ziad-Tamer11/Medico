import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/booking/presentation/view/widgets/booking_view_body.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments ',
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        centerTitle: true,
      ),
      body: BookingViewBody(),
    );
  }
}

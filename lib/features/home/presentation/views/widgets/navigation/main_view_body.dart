import 'package:flutter/material.dart';
import 'package:medico/features/booking/presentation/view/booking_view.dart';
import 'package:medico/features/home/presentation/views/home_view.dart';
import 'package:medico/features/payment/presentation/view/payment_view.dart';
import 'package:medico/features/profile/presentation/views/profile_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [HomeView(), BookingView(), PaymentView(), ProfileView()],
    );
  }
}

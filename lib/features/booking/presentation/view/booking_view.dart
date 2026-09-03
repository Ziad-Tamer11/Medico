import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/booking/presentation/view/widgets/booking_view_body.dart';
import 'package:medico/features/home/presentation/manager/doctor_cubit/doctor_cubit.dart';
import 'package:medico/features/home/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<DoctorCubit>().getDoctor();
    getIt<GetUpcomingAppointmentCubit>().getUpcomingAppointments(
      forceRefresh: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments ',
          style: TextStyles.font18Bold.copyWith(color: AppColor.black),
        ),
        centerTitle: true,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<DoctorCubit>.value(value: getIt<DoctorCubit>()),
        ],
        child: BookingViewBody(),
      ),
    );
  }
}

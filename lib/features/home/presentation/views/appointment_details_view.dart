import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/appointment_details_view_body.dart';
import 'package:medico/features/payment/data/entities/usecase/payment_usecase.dart';
import 'package:medico/features/payment/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Appointment Details'),
      body: BlocProvider(
        create: (context) =>
            StripePaymentCubit(paymentUsecase: getIt<PaymentUsecase>()),
        child: AppointmentDetailsViewBody(doctorEntity: doctorEntity),
      ),
    );
  }
}

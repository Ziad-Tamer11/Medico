import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/domain/usecases/appointment_usecase.dart';
import 'package:medico/features/home/presentation/manager/create_appointment_cubit/create_appointment_cubit.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/appointment_details_view_body.dart';
import 'package:medico/features/payment/data/entities/usecase/payment_usecase.dart';
import 'package:medico/features/payment/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key, required this.appointmentSelection});
  final AppointmentSelectionEntity appointmentSelection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Appointment Details'),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                StripePaymentCubit(paymentUsecase: getIt<PaymentUsecase>()),
          ),
          BlocProvider(
            create: (context) => CreateAppointmentCubit(
              appointmentUseCase: getIt<AppointmentUseCase>(),
            ),
          ),
        ],
        child: AppointmentDetailsViewBody(
          appointmentSelectionEntity: appointmentSelection,
        ),
      ),
    );
  }
}

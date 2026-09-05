import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/doctors/domain/entities/appointment_selection.dart';
import 'package:medico/features/doctors/domain/usecases/appointment_usecase.dart';
import 'package:medico/features/doctors/presentation/manager/create_appointment_cubit/create_appointment_cubit.dart';
import 'package:medico/features/payment/data/entities/usecase/payment_usecase.dart';
import 'package:medico/features/payment/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:medico/features/payment/presentation/view/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.appointmentSelection});
  final AppointmentSelectionEntity appointmentSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Payment Methods'),
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
        child: PaymentViewBody(appointmentSelectionEntity: appointmentSelection),
      ),
    );
  }
}

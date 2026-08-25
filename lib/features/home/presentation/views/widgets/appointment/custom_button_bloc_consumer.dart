import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/presentation/manager/create_appointment_cubit/create_appointment_cubit.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:medico/features/payment/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.appointmentSelectionEntity,
  });

  final AppointmentSelectionEntity appointmentSelectionEntity;

  @override
  Widget build(BuildContext context) {
    final doctor = appointmentSelectionEntity.doctor;
    final amount = (doctor.hourlyRate * 100).round();

    return MultiBlocListener(
      listeners: [
        BlocListener<StripePaymentCubit, StripePaymentState>(
          listener: (context, state) {
            if (state is StripePaymentSuccess) {
              context.read<CreateAppointmentCubit>().createAppointment(
                doctorId: doctor.id,
                appointmentDate: appointmentSelectionEntity.date,
                startTime: appointmentSelectionEntity.startTime,
                endTime: appointmentSelectionEntity.endTime,
              );
            }
            if (state is StripePaymentFailure) {
              showMessageBar(context, state.errMessage, AppColor.red);
            }
          },
        ),
        BlocListener<CreateAppointmentCubit, CreateAppointmentState>(
          listener: (context, state) {
            if (state is CreateAppointmentSuccess) {
              CustomDialog.showSuccessDialog(
                context: context,
                title: 'Appointment Confirmed',
                message:
                    'Your appointment with dr ${doctor.name} has been confirmed successfully!',
                onPressed: () {
                  context.push(AppRoute.kHomeView);
                },
              );
            }
            if (state is CreateAppointmentFailure) {
              showMessageBar(context, state.errMessage, AppColor.red);
            }
          },
        ),
      ],
      child: BlocBuilder<StripePaymentCubit, StripePaymentState>(
        builder: (context, stripeState) {
          return BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
            builder: (context, appointmentState) {
              final isLoading =
                  stripeState is StripePaymentLoading ||
                  appointmentState is CreateAppointmentLoading;
              return CustomButton(
                isLoading: isLoading,
                text: 'Next',
                onPressed: isLoading
                    ? null
                    : () {
                        final paymentIntentInputModel = PaymentIntentInputModel(
                          amount: amount.toString(),
                          currency: 'USD',
                          customerId: customerId,
                        );
                        context.read<StripePaymentCubit>().makePayment(
                          paymentIntentInputModel: paymentIntentInputModel,
                        );
                      },
              );
            },
          );
        },
      ),
    );
  }
}

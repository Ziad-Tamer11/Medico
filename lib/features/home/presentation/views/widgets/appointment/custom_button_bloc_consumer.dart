import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/services/get_it_service.dart';
import 'package:medico/core/services/local_notification_service.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/home/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/presentation/manager/create_appointment_cubit/create_appointment_cubit.dart';
import 'package:medico/features/home/presentation/manager/get_upcomming_appointment_cubit/get_upcoming_appointment_cubit.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:medico/features/payment/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';

// The backend now requires a real, already-succeeded payment_intent_id to
// book an appointment (it verifies the intent with Stripe directly), so
// payment has to happen first - there's no way to book before paying
// anymore. If the booking then fails (the slot got taken in the moment
// between paying and booking), the payment has already gone through and
// the backend has no auto-refund for that path yet, so the message here
// says so plainly instead of pretending nothing was charged.
class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.appointmentSelectionEntity,
    this.buttonText = 'Next',
  });

  final AppointmentSelectionEntity appointmentSelectionEntity;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final doctor = appointmentSelectionEntity.doctor;

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
                paymentIntentId: state.paymentIntentId,
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
              getIt<GetUpcomingAppointmentCubit>().getUpcomingAppointments(
                forceRefresh: true,
              );
              getIt<LocalNotificationService>().showNotification(
                title: 'Appointment Confirmed',
                body:
                    'Your appointment with Dr. ${doctor.name} has been '
                    'confirmed successfully!',
              );
              CustomDialog.showSuccessDialog(
                context: context,
                title: 'Appointment Confirmed',
                buttonText: 'Go to Home',
                message:
                    'Your appointment with Dr. ${doctor.name} has been confirmed successfully!',
                onPressed: () {
                  context.push(AppRoute.kHomeView);
                },
              );
            }
            if (state is CreateAppointmentFailure) {
              showMessageBar(
                context,
                'Payment succeeded, but this appointment could not be '
                'booked (${state.errMessage}). Please contact support for '
                'a refund.',
                AppColor.red,
              );
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
                text: buttonText,
                onPressed: isLoading
                    ? null
                    : () {
                        final paymentIntentInputModel = PaymentIntentInputModel(
                          doctorId: doctor.id,
                          appointmentDate: appointmentSelectionEntity.date,
                          startTime: appointmentSelectionEntity.startTime,
                          endTime: appointmentSelectionEntity.endTime,
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

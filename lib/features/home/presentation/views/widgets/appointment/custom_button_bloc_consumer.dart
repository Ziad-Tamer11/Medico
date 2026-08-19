import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/services/firebase_auth_service.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/custom_dialog.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';
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
    final firebaseAuthService = FirebaseAuthService();

    return MultiBlocListener(
      listeners: [
        BlocListener<StripePaymentCubit, StripePaymentState>(
          listener: (context, state) {
            if (state is StripePaymentSuccess) {
              final appointment = AppointmentEntity(
                id: DateTime.now().microsecondsSinceEpoch.toString(),
                patientId: firebaseAuthService.getCurrentUserId(),
                doctorId: doctor.id,
                doctorName: doctor.name,
                date: appointmentSelectionEntity.date,
                time: appointmentSelectionEntity.time,
                amount: doctor.hourlyRate,
                status: 'confirmed',
                paymentStatus: 'paid',
              );
              CustomDialog.showSuccessDialog(
                context: context,
                title: 'Appointment Confirmed',
                message:
                    'Your appointment with dr ${doctor.name} has been confirmed successfully!',
                onPressed: () {
                  context.push(AppRoute.kHomeView);
                },
              );
              context.read<CreateAppointmentCubit>().createAppointment(
                appointment: appointment,
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
              // الخطوة القادمة:
              // Success Custom Dialog
              // ثم Navigate Home
            }
            if (state is CreateAppointmentFailure) {
              showMessageBar(context, state.errMessage, AppColor.red);
            }
          },
        ),
      ],
      child: BlocBuilder<StripePaymentCubit, StripePaymentState>(
        builder: (context, state) {
          return CustomButton(
            isLoading: state is StripePaymentLoading,
            text: 'Next',
            onPressed: () {
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/helpers/show_message_bar.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/core/widgets/custom_button.dart';
import 'package:medico/core/widgets/doctor_name.dart';
import 'package:medico/core/widgets/doctor_specialist.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/appointment_schedule_section.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_rating.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:medico/features/payment/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:medico/features/payment/presentation/view/payment_view.dart';

class AppointmentDetailsViewBody extends StatelessWidget {
  const AppointmentDetailsViewBody({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.grey.withValues(alpha: .2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesDoctorProfile),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          DoctorName(doctorEntity: doctorEntity),
                          Spacer(),
                          DoctorRating(doctorEntity: doctorEntity),
                        ],
                      ),
                      DoctorSpecialist(doctorEntity: doctorEntity),
                      Text(
                        'Appointment Rate: \$${doctorEntity.hourlyRate.toStringAsFixed(2)}',
                        style: TextStyles.font14SemiBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const AppointmentScheduleSection(),
          const SizedBox(height: 100),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return PaymentView();
              },
            ),
          );
          showMessageBar(context, 'Payment Done Successfully', Colors.green);
        }
        if (state is StripePaymentFailure) {
          Navigator.pop(context);
          showMessageBar(context, state.errMessage, AppColor.red);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is StripePaymentLoading ? true : false,
          text: 'Next',
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: '2000',
                  currency: 'USD',
                  customerId: customerId,
                );
            BlocProvider.of<StripePaymentCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/doctors/domain/entities/appointment_selection.dart';
import 'package:medico/features/home/presentation/views/widgets/appointment/custom_button_bloc_consumer.dart';
import 'package:medico/features/payment/domain/entities/payment_method.dart';
import 'package:medico/features/payment/presentation/view/widgets/payment_card.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key, required this.appointmentSelectionEntity});

  final AppointmentSelectionEntity appointmentSelectionEntity;

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  // Visa is the only method actually wired end-to-end today, so it's a
  // sensible default rather than starting on nothing selectable.
  PaymentMethodType selectedMethod = PaymentMethodType.visa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text('Select method', style: TextStyles.font18Bold),
            const SizedBox(height: 24),
            PaymentCard(
              selectedMethod: selectedMethod,
              onMethodSelected: (method) {
                setState(() => selectedMethod = method);
              },
            ),
            const SizedBox(height: 40),
            // Only Visa/Mastercard are ever selectable right now (the rest
            // are disabled), and both route through the same Stripe flow
            // already wired here - so Continue always means "pay with
            // Stripe" until Paymob/cash exist.
            CustomButtonBlocConsumer(
              appointmentSelectionEntity: widget.appointmentSelectionEntity,
              buttonText: 'Continue',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

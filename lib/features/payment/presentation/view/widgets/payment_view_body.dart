import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/payment/domain/entities/payment_method.dart';
import 'package:medico/features/payment/presentation/view/widgets/payment_method_tile.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

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
          ],
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.selectedMethod,
    required this.onMethodSelected,
  });

  final PaymentMethodType selectedMethod;
  final ValueChanged<PaymentMethodType> onMethodSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final method in paymentMethods) ...[
          PaymentMethodTile(
            method: method,
            isSelected: selectedMethod == method.type,
            onTap: () => onMethodSelected(method.type),
          ),
          const SizedBox(height: 24),
        ],
      ],
    );
  }
}

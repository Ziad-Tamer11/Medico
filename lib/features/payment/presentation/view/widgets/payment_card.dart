import 'package:flutter/widgets.dart';
import 'package:medico/features/payment/domain/entities/payment_method.dart';
import 'package:medico/features/payment/presentation/view/widgets/payment_method_tile.dart';

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

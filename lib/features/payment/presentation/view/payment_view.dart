import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/payment/presentation/view/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Payment Methods'),
      body: const PaymentViewBody(),
    );
  }
}

import 'package:medico/core/utils/app_images.dart';

// Static, fixed set of payment methods the app can offer - not fetched
// from anywhere, so plain data here rather than a full repo/usecase.
// `isAvailable` reflects what's actually wired end-to-end today: only
// Stripe (Visa/Mastercard) is built; the wallets need Paymob and Cash
// needs its own backend flag, neither of which exist yet.
enum PaymentMethodType {
  visa,
  mastercard,
  vodafoneCash,
  etisalatCash,
  orangeCash,
  cash,
}

class PaymentMethod {
  final PaymentMethodType type;
  final String label;
  final String iconAsset;
  final bool isAvailable;

  const PaymentMethod({
    required this.type,
    required this.label,
    required this.iconAsset,
    this.isAvailable = true,
  });
}

const List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    type: PaymentMethodType.visa,
    label: 'Visa',
    iconAsset: Assets.imagesVisa,
  ),
  PaymentMethod(
    type: PaymentMethodType.mastercard,
    label: 'Mastercard',
    iconAsset: Assets.imagesMastercard,
  ),
  PaymentMethod(
    type: PaymentMethodType.vodafoneCash,
    label: 'Vodafone Cash',
    iconAsset: Assets.imagesVodafone,
    isAvailable: false,
  ),
  PaymentMethod(
    type: PaymentMethodType.etisalatCash,
    label: 'Etisalat Cash',
    iconAsset: Assets.imagesEtisalat,
    isAvailable: false,
  ),
  PaymentMethod(
    type: PaymentMethodType.orangeCash,
    label: 'Orange Cash',
    iconAsset: Assets.imagesOrange,
    isAvailable: false,
  ),
  PaymentMethod(
    type: PaymentMethodType.cash,
    label: 'Cash Payment',
    iconAsset: Assets.imagesPayWithCash,
    isAvailable: false,
  ),
];

class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephermeralKeySecret;

  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephermeralKeySecret,
  });
}

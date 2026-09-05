// Matches the backend's PaymentIntentResponse exactly - our own backend
// now creates the Stripe PaymentIntent/Customer/EphemeralKey server-side,
// so this is the only shape the app ever needs to parse (no more raw
// Stripe API responses touched client-side).
class PaymentIntentResponseModel {
  final String clientSecret;
  final String ephemeralKey;
  final String customerId;

  const PaymentIntentResponseModel({
    required this.clientSecret,
    required this.ephemeralKey,
    required this.customerId,
  });

  factory PaymentIntentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentResponseModel(
      clientSecret: json['client_secret'],
      ephemeralKey: json['ephemeral_key'],
      customerId: json['customer_id'],
    );
  }

  // Stripe's client_secret is formatted "{payment_intent_id}_secret_...";
  // the backend doesn't return the id separately, so it's extracted here.
  String get paymentIntentId => clientSecret.split('_secret_').first;
}

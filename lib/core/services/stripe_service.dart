import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/services/shared_preferences.dart';
import 'package:medico/core/utils/backend_endpoints.dart';
import 'package:medico/constants.dart';
import 'package:medico/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:medico/features/payment/data/models/payment_intent_response_model.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});

  // The backend computes the price and creates the PaymentIntent/Customer/
  // EphemeralKey itself - the app never talks to Stripe's API directly
  // and never sees a secret key.
  Future<PaymentIntentResponseModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final token = Prefs.getString(kAccessToken) ?? '';
    final response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: BackendEndpoints.paymentIntent,
      token: token,
    );

    return PaymentIntentResponseModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephermeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Ziad',
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // Returns the payment_intent_id once the payment sheet succeeds, so the
  // caller can pass it to POST /appointments - the backend verifies that
  // exact id actually succeeded before it will book anything.
  Future<String> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final paymentIntent = await createPaymentIntent(paymentIntentInputModel);
    final initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntent.clientSecret,
      customerId: paymentIntent.customerId,
      ephermeralKeySecret: paymentIntent.ephemeralKey,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
    return paymentIntent.paymentIntentId;
  }
}

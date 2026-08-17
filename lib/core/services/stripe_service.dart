import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:medico/core/services/api_service.dart';
import 'package:medico/core/utils/api_keys.dart';
import 'package:medico/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:medico/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:medico/features/payment/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
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

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephermeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': '2026-07-29.dahlia',
      },
    );

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}

//    Stripe Payment Flow (without saving customer info)
// 1- create payment intent (paramters: amount,currency) => PaymentIntentModel
// 2- init payment sheet (paramters: paymentIntentClientSecret,merchantDisplayName)
// 3- present payment sheet
// 4- collect all 3 methods in one method to call them one time
//---------------------------------------------------------------------------------
//    Stripe Payment Flow (with saving customer info)
// 1- create payment intent (paramters: amount,currency,customerId) => PaymentIntentModel
// 2- create ephemeral key (parameters: customerId)
// 3- init payment sheet (paramters: paymentIntentClientSecret,merchantDisplayName,ephemeralKeySecret)
// 4- present payment sheet
// 5- collect all 3 methods in one method to call them one time

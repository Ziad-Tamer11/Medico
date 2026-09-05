import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  // returns the payment_intent_id on success, needed by the caller to
  // book the appointment against that exact payment
  Future<Either<Failure, String>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}

import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/core/services/stripe_service.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:medico/features/payment/data/entities/repos/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final StripeService stripeService;

  PaymentRepoImpl({required this.stripeService});
  @override
  Future<Either<Failure, String>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      final paymentIntentId = await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(paymentIntentId);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

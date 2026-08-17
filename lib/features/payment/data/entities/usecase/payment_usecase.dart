import 'package:dartz/dartz.dart';
import 'package:medico/core/errors/failure.dart';
import 'package:medico/features/payment/data/entities/repos/payment_repo.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';

class PaymentUsecase {
  final PaymentRepo paymentRepo;

  PaymentUsecase({required this.paymentRepo});

  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) {
    return paymentRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }
}

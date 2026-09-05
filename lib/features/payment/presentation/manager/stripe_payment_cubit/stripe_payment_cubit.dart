import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:medico/features/payment/data/entities/usecase/payment_usecase.dart';
import 'package:medico/features/payment/data/models/payment_intent_input_model.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit({required this.paymentUsecase})
    : super(StripePaymentInitial());
  final PaymentUsecase paymentUsecase;
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    log(
      'Starting payment for doctorId=${paymentIntentInputModel.doctorId}',
      name: 'StripePaymentCubit',
    );
    emit(StripePaymentLoading());
    var result = await paymentUsecase.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    result.fold(
      (failure) {
        log(
          'Payment Failure: ${failure.errMessage}',
          name: 'StripePaymentCubit',
        );

        emit(StripePaymentFailure(errMessage: failure.errMessage));
      },
      (paymentIntentId) {
        log('Payment Success', name: 'StripePaymentCubit');

        emit(StripePaymentSuccess(paymentIntentId: paymentIntentId));
      },
    );
  }
}

class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}

// A user backing out of a payment sheet (Stripe or any future gateway) isn't
// a real error - keeping it a distinct Failure type lets callers skip the
// error UI for this case while still showing it for genuine failures.
class PaymentCancelledFailure extends Failure {
  PaymentCancelledFailure() : super(errMessage: 'Payment was cancelled');
}

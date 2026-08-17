class PaymentIntentModel {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;

  // AmountDetails? amountDetails;

  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;

  // AutomaticPaymentMethods? automaticPaymentMethods;

  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  dynamic customer;
  dynamic description;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;

  // Metadata? metadata;

  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;

  // PaymentMethodOptions? paymentMethodOptions;

  List<dynamic>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    // this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    // this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.lastPaymentError,
    this.latestCharge,
    this.livemode,
    // this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    // this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      amount: json['amount'] as int?,
      amountCapturable: json['amount_capturable'] as int?,

      // amountDetails: json['amount_details'] == null
      //     ? null
      //     : AmountDetails.fromJson(
      //         json['amount_details'] as Map<String, dynamic>,
      //       ),
      amountReceived: json['amount_received'] as int?,
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],

      // automaticPaymentMethods:
      //     json['automatic_payment_methods'] == null
      //         ? null
      //         : AutomaticPaymentMethods.fromJson(
      //             json['automatic_payment_methods']
      //                 as Map<String, dynamic>,
      //           ),
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method'] as String?,
      clientSecret: json['client_secret'] as String?,
      confirmationMethod: json['confirmation_method'] as String?,
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      customer: json['customer'],
      description: json['description'],
      lastPaymentError: json['last_payment_error'],
      latestCharge: json['latest_charge'],
      livemode: json['livemode'] as bool?,

      // metadata: json['metadata'] == null
      //     ? null
      //     : Metadata.fromJson(
      //         json['metadata'] as Map<String, dynamic>,
      //       ),
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],

      // paymentMethodOptions:
      //     json['payment_method_options'] == null
      //         ? null
      //         : PaymentMethodOptions.fromJson(
      //             json['payment_method_options']
      //                 as Map<String, dynamic>,
      //           ),
      paymentMethodTypes: json['payment_method_types'] as List<dynamic>?,
      processing: json['processing'],
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'] as String?,
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
  }
}

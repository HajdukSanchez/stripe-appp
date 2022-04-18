import 'dart:convert';

class PaymentIntentResponse {
  PaymentIntentResponse({
    this.id,
    this.object,
    this.amount,
    this.amountCapturable,
    this.amountDetails,
    this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    this.captureMethod,
    this.charges,
    this.clientSecret,
    this.confirmationMethod,
    this.created,
    this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.livemode,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
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

  final String? id;
  final String? object;
  final int? amount;
  final int? amountCapturable;
  final AmountDetails? amountDetails;
  final int? amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final dynamic automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String? captureMethod;
  final Charges? charges;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final dynamic customer;
  final dynamic description;
  final dynamic invoice;
  final dynamic lastPaymentError;
  final bool? livemode;
  final Metadata? metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodOptions? paymentMethodOptions;
  final List<String>? paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String? status;
  final dynamic transferData;
  final dynamic transferGroup;

  factory PaymentIntentResponse.fromRawJson(String str) =>
      PaymentIntentResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) => PaymentIntentResponse(
        id: json["id"] ?? null,
        object: json["object"] ?? null,
        amount: json["amount"] ?? null,
        amountCapturable: json["amount_capturable"] ?? null,
        amountDetails:
            json["amount_details"] == null ? null : AmountDetails.fromJson(json["amount_details"]),
        amountReceived: json["amount_received"] ?? null,
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        automaticPaymentMethods: json["automatic_payment_methods"],
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"] ?? null,
        charges: json["charges"] == null ? null : Charges.fromJson(json["charges"]),
        clientSecret: json["client_secret"] ?? null,
        confirmationMethod: json["confirmation_method"] ?? null,
        created: json["created"] ?? null,
        currency: json["currency"] ?? null,
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        livemode: json["livemode"] ?? null,
        metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodOptions: json["payment_method_options"] == null
            ? null
            : PaymentMethodOptions.fromJson(json["payment_method_options"]),
        paymentMethodTypes: json["payment_method_types"] == null
            ? null
            : List<String>.from(json["payment_method_types"].map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"],
        statementDescriptorSuffix: json["statement_descriptor_suffix"],
        status: json["status"] ?? null,
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "object": object ?? null,
        "amount": amount ?? null,
        "amount_capturable": amountCapturable ?? null,
        "amount_details": amountDetails == null ? null : amountDetails!.toJson(),
        "amount_received": amountReceived ?? null,
        "application": application,
        "application_fee_amount": applicationFeeAmount,
        "automatic_payment_methods": automaticPaymentMethods,
        "canceled_at": canceledAt,
        "cancellation_reason": cancellationReason,
        "capture_method": captureMethod ?? null,
        "charges": charges == null ? null : charges!.toJson(),
        "client_secret": clientSecret ?? null,
        "confirmation_method": confirmationMethod ?? null,
        "created": created ?? null,
        "currency": currency ?? null,
        "customer": customer,
        "description": description,
        "invoice": invoice,
        "last_payment_error": lastPaymentError,
        "livemode": livemode ?? null,
        "metadata": metadata == null ? null : metadata!.toJson(),
        "next_action": nextAction,
        "on_behalf_of": onBehalfOf,
        "payment_method": paymentMethod,
        "payment_method_options":
            paymentMethodOptions == null ? null : paymentMethodOptions!.toJson(),
        "payment_method_types": paymentMethodTypes == null
            ? null
            : List<dynamic>.from(paymentMethodTypes!.map((x) => x)),
        "processing": processing,
        "receipt_email": receiptEmail,
        "review": review,
        "setup_future_usage": setupFutureUsage,
        "shipping": shipping,
        "source": source,
        "statement_descriptor": statementDescriptor,
        "statement_descriptor_suffix": statementDescriptorSuffix,
        "status": status ?? null,
        "transfer_data": transferData,
        "transfer_group": transferGroup,
      };
}

class AmountDetails {
  AmountDetails({
    this.tip,
  });

  final Tip? tip;

  factory AmountDetails.fromRawJson(String str) => AmountDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json["tip"] == null ? null : Tip.fromJson(json["tip"]),
      );

  Map<String, dynamic> toJson() => {
        "tip": tip == null ? null : tip!.toJson(),
      };
}

class Tip {
  Tip({
    this.amount,
  });

  final dynamic amount;

  factory Tip.fromRawJson(String str) => Tip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class Charges {
  Charges({
    this.object,
    this.data,
    this.hasMore,
    this.totalCount,
    this.url,
  });

  final String? object;
  final List<dynamic>? data;
  final bool? hasMore;
  final int? totalCount;
  final String? url;

  factory Charges.fromRawJson(String str) => Charges.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        object: json["object"] ?? null,
        data: json["data"] == null ? null : List<dynamic>.from(json["data"].map((x) => x)),
        hasMore: json["has_more"] ?? null,
        totalCount: json["total_count"] ?? null,
        url: json["url"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "object": object ?? null,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x)),
        "has_more": hasMore ?? null,
        "total_count": totalCount ?? null,
        "url": url ?? null,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromRawJson(String str) => Metadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class PaymentMethodOptions {
  PaymentMethodOptions({
    this.card,
  });

  final _Card? card;

  factory PaymentMethodOptions.fromRawJson(String str) =>
      PaymentMethodOptions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
        card: json["card"] == null ? null : _Card.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "card": card == null ? null : card!.toJson(),
      };
}

class _Card {
  _Card({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;
  final String? requestThreeDSecure;

  factory _Card.fromRawJson(String str) => _Card.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory _Card.fromJson(Map<String, dynamic> json) => _Card(
        installments: json["installments"],
        mandateOptions: json["mandate_options"],
        network: json["network"],
        requestThreeDSecure: json["request_three_d_secure"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "installments": installments,
        "mandate_options": mandateOptions,
        "network": network,
        "request_three_d_secure": requestThreeDSecure ?? null,
      };
}

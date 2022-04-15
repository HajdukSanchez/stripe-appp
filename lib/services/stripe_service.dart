import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/models/models.dart';

class StripeService {
  // Singleton
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  String _paymentApiURL = "https://api.stripe.com/v1/payment_intents";
  String secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";

  void init() {}

  Future payWithExistingCreditCard({
    required String amount,
    required String currency,
    required CustomCreditCard creditCard,
  }) async {}

  Future payWithNewCreditCard() async {}

  Future payWithApplePayOrGooglePay() async {}

  Future _createPaymentIntent() async {}

  Future _makePayment() async {}
}

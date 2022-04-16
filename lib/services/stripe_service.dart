import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  // Singleton
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  String _paymentAPIURL = dotenv.env['PAYMENT_API_URL'] ?? "";
  String secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";

  void init() {}

  Future payWithExistingCreditCard({
    required String amount,
    required String currency,
    required Card creditCard,
  }) async {}

  Future payWithNewCreditCard({
    required String amount,
    required String currency,
  }) async {}

  Future payWithApplePayOrGooglePay({
    required String amount,
    required String currency,
  }) async {}

  Future _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {}

  Future _makePayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {}
}

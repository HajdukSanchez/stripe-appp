import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/models/models.dart';

class StripeService {
  // Singleton
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  final String _paymentAPIURL = dotenv.env['PAYMENT_API_URL'] ?? "";
  final String _secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";
  final String _apiKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? "";

  void init() {
    Stripe.publishableKey = _apiKey;
  }

  Future payWithExistingCreditCard({
    required String amount,
    required String currency,
    required Card creditCard,
  }) async {}

  Future<StripeCustomResponse> payWithNewCreditCard({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {
    try {
      // final paymentMethod = await Stripe.instance.createPaymentMethod(paymentMethodParams);
      print(paymentMethod);

      return StripeCustomResponse(isSuccess: true);
    } catch (e) {
      print(e);
      return StripeCustomResponse(isSuccess: false, message: e.toString());
    }
  }

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

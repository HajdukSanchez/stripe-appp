import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';

import 'package:stripe_app/models/models.dart';

class StripeService {
  // Singleton
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  static final String _secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? "";
  final String _paymentAPIURL = dotenv.env['PAYMENT_API_URL'] ?? "";
  final String _apiKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? "";

  final headerOptions = Options(
    contentType: Headers.formUrlEncodedContentType,
    headers: {
      'Authorization': 'Bearer ${StripeService._secretKey}',
    },
  );

  void init() {
    Stripe.publishableKey = _apiKey;
  }

  Future payWithExistingCreditCard({
    required String amount,
    required String currency,
    required CustomCreditCard creditCard,
  }) async {
    try {
      // final monthYear = creditCard.expiracyDate.split('/');
      // Card existCard = Card(
      //   brand: creditCard.brand,
      //   expMonth: int.parse(monthYear[0]),
      //   expYear: int.parse(monthYear[1]),
      //   last4: creditCard.cardNumber.substring(-4, -1),
      // );
    } catch (e) {
      return StripeCustomResponse(isSuccess: false, message: e.toString());
    }
  }

  Future<StripeCustomResponse> payWithNewCreditCard({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {
    try {
      return await _makePayment(amount: amount, currency: currency, paymentMethod: paymentMethod);
    } catch (e) {
      return StripeCustomResponse(isSuccess: false, message: e.toString());
    }
  }

  Future payWithApplePayOrGooglePay({
    required String amount,
    required String currency,
  }) async {
    try {} catch (e) {
      return StripeCustomResponse(isSuccess: false, message: e.toString());
    }
  }

  Future<PaymentIntentResponse> _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final dio = Dio();
      final parameters = {
        'amount': amount,
        'currency': currency,
      };
      final Response response =
          await dio.post(_paymentAPIURL, data: parameters, options: headerOptions);
      return PaymentIntentResponse.fromJson(response.data);
    } catch (e) {
      return PaymentIntentResponse(
        status: "400",
      );
    }
  }

  Future<StripeCustomResponse> _makePayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
  }) async {
    try {
      final PaymentIntentResponse paymentIntentResponse =
          await _createPaymentIntent(amount: amount, currency: currency);
      final paymentResult = await Stripe.instance.confirmPayment(
          '${paymentIntentResponse.clientSecret}',
          PaymentMethodParams.cardFromMethodId(paymentMethodId: paymentMethod.id));

      return (paymentResult.status == PaymentIntentsStatus.Succeeded)
          ? StripeCustomResponse(isSuccess: true)
          : StripeCustomResponse(
              isSuccess: false, message: 'Something went wrong: ${paymentResult.status}');
    } catch (e) {
      return StripeCustomResponse(isSuccess: false, message: e.toString());
    }
  }
}

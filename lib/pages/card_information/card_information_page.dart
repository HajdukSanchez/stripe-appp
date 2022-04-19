import 'package:flutter/material.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/services/services.dart';

class CardInformationPage extends StatelessWidget {
  const CardInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CardField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              height: 40,
              minWidth: 150,
              elevation: 0,
              color: Colors.white,
              shape: const StadiumBorder(),
              onPressed: () => _onPayWithNewCreditCard(context),
              child: const Text(
                "Pay",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ), // Widget from Flutter_Stripe
          ],
        ),
      ),
    );
  }

  _onPayWithNewCreditCard(context) async {
    showLoading(context, "Validating payment information..."); // Open loading dialog

    final stripeService = StripeService();
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);

    final paymentMethod =
        await Stripe.instance.createPaymentMethod(const PaymentMethodParams.card());

    final response = await stripeService.payWithNewCreditCard(
        amount: paymentBloc.state.amountString,
        currency: paymentBloc.state.currency,
        paymentMethod: paymentMethod);

    Navigator.pop(context); // Close loading dialog

    (response.isSuccess)
        ? showAlert(context, 'Payment Successful', 'Payment successful with new credit card')
        : showAlert(context, 'Payment unsuccessful', response.message.substring(0, 20));
  }
}

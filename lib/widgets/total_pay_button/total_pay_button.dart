import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/blocs/payment/payment_bloc.dart';
import 'package:stripe_app/helpers/helpers.dart';

class TotalPayButton extends StatelessWidget {
  final double width;

  const TotalPayButton({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return Container(
      width: width,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '${paymentBloc.state.amount} ${paymentBloc.state.currency}',
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
          const _ButtonPay(),
        ],
      ),
    );
  }
}

class _ButtonPay extends StatelessWidget {
  const _ButtonPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return MaterialButton(
      height: 45,
      minWidth: 150,
      elevation: 0,
      color: Colors.black,
      shape: const StadiumBorder(),
      onPressed: () => {(paymentBloc.state.card != null) ? _onButtonPayTap(context) : Error()},
      child: Row(
        children: [
          Icon(
            paymentBloc.state.cardActive
                ? FontAwesomeIcons.solidCreditCard
                : Platform.isAndroid
                    ? FontAwesomeIcons.google
                    : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          const Text(
            "Pay",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }

  void _onButtonPayTap(BuildContext context) {
    showLoading(context, "Validating payment information..."); // Open loading dialog
    Navigator.pop(context); // Close loading dialog
    showAlert(context, 'Payment unsuccessful', 'Error handle payment with existing credit card');
  }
}

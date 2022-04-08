import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/models/models.dart';
import 'package:stripe_app/widgets/widgets.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final card = CustomCreditCard(
        cardNumberHidden: '4242',
        cardNumber: '4242424242424242',
        brand: 'visa',
        cvv: '213',
        expiracyDate: '01/25',
        cardHolderName: 'Fernando Herrera');

    return Scaffold(
        appBar: AppBar(
            title: const Text('Card'),
            leading: IconButton(
                onPressed: () => _onTapBackButton(context),
                icon: Icon(
                  Platform.isAndroid ? Icons.arrow_back_rounded : Icons.arrow_back_ios_new_rounded,
                ))),
        body: Stack(
          children: [
            Container(),
            Hero(
              tag: card.cardNumber,
              child: CreditCardWidget(
                  cardNumber: card.cardNumber,
                  expiryDate: card.expiracyDate,
                  cardHolderName: card.cardHolderName,
                  cvvCode: card.cvv,
                  showBackView: false,
                  onCreditCardWidgetChange: (CreditCardBrand card) {}),
            ),
            Positioned(
                bottom: 0,
                child: TotalPayButton(
                  width: size.width,
                ))
          ],
        ));
  }

  void _onTapBackButton(BuildContext context) {
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);
    paymentBloc.add(OnDesactiveCardEvent());
    Navigator.pop(context);
  }
}

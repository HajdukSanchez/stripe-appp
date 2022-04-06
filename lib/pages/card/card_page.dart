import 'package:flutter/material.dart';

import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
        appBar: AppBar(title: const Text('Card')),
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
}

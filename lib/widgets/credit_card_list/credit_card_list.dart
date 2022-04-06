import 'package:flutter/material.dart';

import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_app/data/data.dart';

class CreditCardList extends StatelessWidget {
  const CreditCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.9),
      itemCount: creditCards.length,
      itemBuilder: (BuildContext context, int index) {
        final card = creditCards[index];
        return CreditCardWidget(
            cardNumber: card.cardNumber,
            expiryDate: card.expiracyDate,
            cardHolderName: card.cardHolderName,
            cvvCode: card.cvv,
            showBackView: false,
            onCreditCardWidgetChange: (CreditCardBrand card) {});
      },
    );
  }
}

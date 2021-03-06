import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import 'package:stripe_app/blocs/blocs.dart';
import 'package:stripe_app/data/data.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/models/models.dart';
import 'package:stripe_app/pages/pages.dart';

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

        return GestureDetector(
          onTap: () => _onCreditCardTap(context, card),
          child: Hero(
            tag: card.cardNumber,
            child: CreditCardWidget(
                cardNumber: card.cardNumber,
                expiryDate: card.expiracyDate,
                cardHolderName: card.cardHolderName,
                cvvCode: card.cvv,
                showBackView: false,
                onCreditCardWidgetChange: (CreditCardBrand card) {}),
          ),
        );
      },
    );
  }

  void _onCreditCardTap(BuildContext context, CustomCreditCard card) {
    final paymentBloc = BlocProvider.of<PaymentBloc>(context);
    paymentBloc.add(OnSelectCardEvent(card));
    Navigator.push(context, navigateFadeIn(context, const CardPage()));
  }
}
